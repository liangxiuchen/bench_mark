//
//  ZMSIPBenchMark.h
//  iZipow
//
//  Created by carroll.chen on 2021/9/18.
//  Copyright © 2021 Zoom Video Communications, Inc. All rights reserved.
//

#ifndef _bench_mark_ //guard for #include usage
#define _bench_mark_
#ifdef DEBUG
    #ifdef __cplusplus
        extern "C" {
    #endif

    #ifdef __GNUC__
        __attribute__((__format__(printf, 2, 3)))
    #endif
        void bench_mark(void(^task)(void),const char *format,...);

    #ifdef __cplusplus
        }
    #endif
#else
    #define bench_mark(t,f,...) do {\
        void(^b)(void) = t;\
        b ? b() : (void)0;\
    } while(0)
#endif

#endif


