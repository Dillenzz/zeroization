#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <bearssl.h>

/* Define function pointer types */
typedef void (*crypto_func_t)(uint8_t *data, size_t len);
typedef void (*zeroize_func_t)(void *ptr, size_t len);

/* Function to compute SHA-256 hash */
void bearssl_sha256(uint8_t *data, size_t len) {
    br_sha256_context ctx;
    uint8_t hash[32];

    br_sha256_init(&ctx);
    br_sha256_update(&ctx, data, len);
    br_sha256_out(&ctx, hash);

    memcpy(data, hash, sizeof(hash));
    printf("SHA-256 computed.\n");
}

/* Function to securely wipe memory */
void bearssl_secure_erase(void *ptr, size_t len) {
    volatile uint8_t *p = (volatile uint8_t *)ptr;
    while (len--) {
        *p++ = 0;
    }
}

/* Test function */
void test_crypto(crypto_func_t crypto, zeroize_func_t zeroize, const char *label) {
    uint8_t data[32] = "SensitiveDataToErase";

    printf("\n=== Testing: %s ===\n", label);
    printf("Before operation: %s\n", data);

    if (crypto) crypto(data, sizeof(data));

    printf("After operation: %s\n", data);

    if (zeroize) zeroize(data, sizeof(data));
    
}

int main() {
    test_crypto(bearssl_sha256, bearssl_secure_erase, "BearSSL SHA-256 & Secure Erase");
    return 0;
}
