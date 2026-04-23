CROSS_COMPILE_EXPECTED = aarch64-none-linux-gnu-
CROSS_COMPILER = $(CROSS_COMPILE_EXPECTED)gcc


writer: writer.o
	@if [ "$(CROSS_COMPILE)" = "$(CROSS_COMPILE_EXPECTED)" ]; then \
		echo "Executable generation: Using cross compiler"; \
		$(CROSS_COMPILER) $^ -o writer; \
	else \
		echo "Executable generation: Using native compiler"; \
		$(CC) $^ -o writer; \
	fi

writer.o: writer.c
	@if [ "$(CROSS_COMPILE)" = "$(CROSS_COMPILE_EXPECTED)" ]; then \
		echo "Compilation: Using cross compiler"; \
		$(CROSS_COMPILER) -c writer.c; \
	else \
		echo "Compilation: Using native compiler"; \
		$(CC) -c writer.c; \
	fi

.PHONY: clean
clean:
	rm -f writer *.o

all: writer

# Support for cross-compilation.
# You should be able to generate an application for the native build platform when GNU make variable CROSS_COMPILE is not specified on the make command line.  When CROSS_COMPILE is specified with aarch64-none-linux-gnu- (note the trailing -)your makefile should compile successfully using the cross compiler installed in step 1.