#include <syslog.h>
#include <stddef.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    openlog(NULL, 0, LOG_USER);
    syslog(LOG_INFO, "My Writer App has started");

    if (argc != 3) {
        syslog(LOG_ERR, "Expected number of args is 2 but %d were provided", argc - 1);
        closelog();
        return 1;
    }

    const char *full_filename = argv[1];
    const char *str = argv[2];

    FILE *file = fopen(full_filename, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Opening file %s with write mode failed", full_filename);
        closelog();
        return 2;
    }

    fprintf(file, "%s", str);
    syslog(LOG_DEBUG, "Writing %s to %s", str, full_filename);
    fclose(file);
    closelog();
    return 0;
}