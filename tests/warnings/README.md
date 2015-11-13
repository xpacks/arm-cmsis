# Test compile warnings

Cross compile test files which include the CMSIS Core headers,
with all warnings enabled,
both with C and C++, with the standard `arm-none-eabi-` GCC compiler.

```
WARNFLAGS=-Werror -Wall -Wextra -Wunused -Wuninitialized \
-Wmissing-declarations -Wconversion -Wpointer-arith \
-Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal

CWARNFLAGS=-Wmissing-prototypes -Wstrict-prototypes -Wbad-function-cast
CPPWARNFLAGS=-Wabi -Wctor-dtor-privacy -Wnoexcept -Wnon-virtual-dtor \
-Wstrict-null-sentinel -Wsign-promo
```

To run the test, go to a temporary location (like `/tmp`) and start the script using an absolute path:

```
PATH=/usr/local/gcc-arm-none-eabi-4_9-2015q3/bin:$PATH
cd /tmp
bash /Users/ilg/My\ Files/MacBookPro\ Projects/xPacks/arm-cmsis.git/scripts/run-tests.sh
```

The script will create `xpacks/test/warnings`, copy the source files and compile them.
