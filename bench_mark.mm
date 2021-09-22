//
//  ZMSIPBenchMark.m
//  iZipow
//
//  Created by carroll.chen on 2021/9/18.
//  Copyright © 2021 Zoom Video Communications, Inc. All rights reserved.
//

#import "bench_mark.h"
#ifdef DEBUG
#ifdef __GNUC__
    #define likely(x) __builtin_expect(!!(x), 1)
#else
    #define likely(x) (!!(x))
#endif
void bench_mark(void(^task)(void),const char *format,...) {
    char buffer[1024] = {0};
    if (format) {
        va_list ap;
        va_start(ap, format);
        vsnprintf(buffer, sizeof(buffer), format, ap);
        va_end(ap);
    }
    
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime delta = 0.f;
    if (likely(task)) {
        task();
        delta = (CFAbsoluteTimeGetCurrent() - start);
    }
    NSLog(@"Used time:(%.2lfs)-(%.5lfms) %s", delta, delta * 1000, buffer);
}

#endif
