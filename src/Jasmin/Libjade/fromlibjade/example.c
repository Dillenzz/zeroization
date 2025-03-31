
#include <stdint.h>
#include <string.h>
#include <assert.h>
#include <stdio.h>
#include <inttypes.h>

#include "randombytes.h"
#include "poly1305_ref.h"

static void print_info(const char *algname, const char *arch, const char *impl)
{
  printf("// {\"%s\" : { architecture : \"%s\", implementation : \"%s\"} }",
         algname, arch, impl);
  printf("\n");
}

static void print_u8(const uint8_t *a, size_t l)
{
  size_t i;

  if(l == 0)
  { return; }

  printf("{\n  ");
  for(i=0; i<(l-1); i++)
  { printf("0x%02" PRIx8 ", ", a[i]);
    if((i+1)%16 == 0)
    { printf("\n  "); }
  }

  printf("0x%02" PRIx8 "\n};\n", a[i]);
  return;
}

static void print_str_u8(const char *str, const uint8_t *a, size_t l)
{
  if( l == 0 )
  { printf("uint8_t *%s = NULL;\n", str);
    return;
  }

  printf("uint8_t %s[%zu] = ",str, l);
  print_u8(a, l);
}

int main(void)
{
  int r;
  uint8_t mac[JADE_ONETIMEAUTH_poly1305_amd64_ref_BYTES];
  uint8_t input[] = {0x61, 0x62, 0x63};
  uint8_t _key[JADE_ONETIMEAUTH_poly1305_amd64_ref_KEYBYTES];
  uint8_t* key = _key;

  randombytes(key, JADE_ONETIMEAUTH_poly1305_amd64_ref_KEYBYTES);

  r = jade_onetimeauth_poly1305_amd64_ref(mac, input, sizeof(input), key);
    assert(r == 0);

  r = jade_onetimeauth_poly1305_amd64_ref_verify(mac, input, sizeof(input), key);
    assert(r == 0);

  print_info(JADE_ONETIMEAUTH_poly1305_amd64_ref_ALGNAME, JADE_ONETIMEAUTH_poly1305_amd64_ref_ARCH, JADE_ONETIMEAUTH_poly1305_amd64_ref_IMPL);
  print_str_u8("input", input, sizeof(input));
  print_str_u8("key", key, JADE_ONETIMEAUTH_poly1305_amd64_ref_KEYBYTES);
  print_str_u8("mac", mac, JADE_ONETIMEAUTH_poly1305_amd64_ref_BYTES);

  //flip one bit of input so the verification fails
  input[0] ^= 0x1;
  r = jade_onetimeauth_poly1305_amd64_ref_verify(mac, input, sizeof(input), key);
    assert(r == -1);

  return 0;
}

