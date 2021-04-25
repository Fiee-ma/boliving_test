CXXFLAGS = -std=c++98 -Wall -Wextra -g -O0  -DSRS_HIJACK_IO -DSRS_DISABLE_LOG
GCC = g++
LINK = $(GCC)
AR = ar

.PHONY: default sb_http_load sb_hls_load sb_rtmp_load sb_rtmp_load_fast sb_rtmp_publish

default:

# the CORE module.
CORE_MODULE_INCS = -I src/core 
CORE_INCS = -I src/core -I objs/http-parser-2.1 
CORE_DEPS =  src/core/htl_core_log.hpp src/core/htl_core_error.hpp src/core/htl_core_uri.hpp src/core/htl_core_aggregate_ret.hpp

objs/src/core/htl_core_log.o: $(CORE_DEPS) src/core/htl_core_log.cpp 
	$(GCC) -c $(CXXFLAGS) $(CORE_INCS) -o objs/src/core/htl_core_log.o src/core/htl_core_log.cpp
objs/src/core/htl_core_error.o: $(CORE_DEPS) src/core/htl_core_error.cpp 
	$(GCC) -c $(CXXFLAGS) $(CORE_INCS) -o objs/src/core/htl_core_error.o src/core/htl_core_error.cpp
objs/src/core/htl_core_uri.o: $(CORE_DEPS) src/core/htl_core_uri.cpp 
	$(GCC) -c $(CXXFLAGS) $(CORE_INCS) -o objs/src/core/htl_core_uri.o src/core/htl_core_uri.cpp
objs/src/core/htl_core_aggregate_ret.o: $(CORE_DEPS) src/core/htl_core_aggregate_ret.cpp 
	$(GCC) -c $(CXXFLAGS) $(CORE_INCS) -o objs/src/core/htl_core_aggregate_ret.o src/core/htl_core_aggregate_ret.cpp

# the OS module.
OS_MODULE_INCS = -I src/os 
OS_INCS = -I src/os $(CORE_MODULE_INCS) -I objs/st-1.9/obj 
OS_DEPS =  src/os/htl_os_st.hpp $(CORE_DEPS) 

objs/src/os/htl_os_st.o: $(OS_DEPS) src/os/htl_os_st.cpp 
	$(GCC) -c $(CXXFLAGS) $(OS_INCS) -o objs/src/os/htl_os_st.o src/os/htl_os_st.cpp

# the APP module.
APP_MODULE_INCS = -I src/app 
APP_INCS = -I src/app $(CORE_MODULE_INCS) $(OS_MODULE_INCS) -I objs/st-1.9/obj -I objs/http-parser-2.1 
APP_DEPS =  src/app/htl_app_hls_load.hpp src/app/htl_app_http_load.hpp src/app/htl_app_http_client.hpp src/app/htl_app_rtmp_play.hpp src/app/htl_app_m3u8_parser.hpp src/app/htl_app_task_base.hpp src/app/htl_app_rtmp_load.hpp src/app/htl_app_rtmp_publish.hpp src/app/htl_app_srs_hijack.hpp $(CORE_DEPS)  $(OS_DEPS) 

objs/src/app/htl_app_hls_load.o: $(APP_DEPS) src/app/htl_app_hls_load.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_hls_load.o src/app/htl_app_hls_load.cpp
objs/src/app/htl_app_http_load.o: $(APP_DEPS) src/app/htl_app_http_load.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_http_load.o src/app/htl_app_http_load.cpp
objs/src/app/htl_app_http_client.o: $(APP_DEPS) src/app/htl_app_http_client.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_http_client.o src/app/htl_app_http_client.cpp
objs/src/app/htl_app_rtmp_play.o: $(APP_DEPS) src/app/htl_app_rtmp_play.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_rtmp_play.o src/app/htl_app_rtmp_play.cpp
objs/src/app/htl_app_m3u8_parser.o: $(APP_DEPS) src/app/htl_app_m3u8_parser.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_m3u8_parser.o src/app/htl_app_m3u8_parser.cpp
objs/src/app/htl_app_task_base.o: $(APP_DEPS) src/app/htl_app_task_base.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_task_base.o src/app/htl_app_task_base.cpp
objs/src/app/htl_app_rtmp_load.o: $(APP_DEPS) src/app/htl_app_rtmp_load.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_rtmp_load.o src/app/htl_app_rtmp_load.cpp
objs/src/app/srs_librtmp.o: $(APP_DEPS) src/app/srs_librtmp.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/srs_librtmp.o src/app/srs_librtmp.cpp
objs/src/app/htl_app_rtmp_publish.o: $(APP_DEPS) src/app/htl_app_rtmp_publish.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_rtmp_publish.o src/app/htl_app_rtmp_publish.cpp
objs/src/app/htl_app_srs_hijack.o: $(APP_DEPS) src/app/htl_app_srs_hijack.cpp 
	$(GCC) -c $(CXXFLAGS) $(APP_INCS) -o objs/src/app/htl_app_srs_hijack.o src/app/htl_app_srs_hijack.cpp

# the MAIN module.
MAIN_MODULE_INCS = -I src/main 
MAIN_INCS = -I src/main $(CORE_MODULE_INCS) $(OS_MODULE_INCS) $(APP_MODULE_INCS) -I objs/st-1.9/obj -I objs/http-parser-2.1 
MAIN_DEPS =  src/main/htl_main_utility.hpp $(CORE_DEPS)  $(OS_DEPS)  $(APP_DEPS) 

objs/src/main/htl_main_hls_load.o: $(MAIN_DEPS) src/main/htl_main_hls_load.cpp 
	$(GCC) -c $(CXXFLAGS) $(MAIN_INCS) -o objs/src/main/htl_main_hls_load.o src/main/htl_main_hls_load.cpp
objs/src/main/htl_main_http_load.o: $(MAIN_DEPS) src/main/htl_main_http_load.cpp 
	$(GCC) -c $(CXXFLAGS) $(MAIN_INCS) -o objs/src/main/htl_main_http_load.o src/main/htl_main_http_load.cpp
objs/src/main/htl_main_rtmp_load.o: $(MAIN_DEPS) src/main/htl_main_rtmp_load.cpp 
	$(GCC) -c $(CXXFLAGS) $(MAIN_INCS) -o objs/src/main/htl_main_rtmp_load.o src/main/htl_main_rtmp_load.cpp
objs/src/main/htl_main_rtmp_load_fast.o: $(MAIN_DEPS) src/main/htl_main_rtmp_load_fast.cpp 
	$(GCC) -c $(CXXFLAGS) $(MAIN_INCS) -o objs/src/main/htl_main_rtmp_load_fast.o src/main/htl_main_rtmp_load_fast.cpp
objs/src/main/htl_main_utility.o: $(MAIN_DEPS) src/main/htl_main_utility.cpp 
	$(GCC) -c $(CXXFLAGS) $(MAIN_INCS) -o objs/src/main/htl_main_utility.o src/main/htl_main_utility.cpp
objs/src/main/htl_main_rtmp_publish.o: $(MAIN_DEPS) src/main/htl_main_rtmp_publish.cpp 
	$(GCC) -c $(CXXFLAGS) $(MAIN_INCS) -o objs/src/main/htl_main_rtmp_publish.o src/main/htl_main_rtmp_publish.cpp

# build objs/sb_http_load
sb_http_load: objs/sb_http_load
objs/sb_http_load: objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_http_load.o objs/src/main/htl_main_utility.o 
	$(LINK)  -o objs/sb_http_load objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_http_load.o objs/src/main/htl_main_utility.o objs/st-1.9/obj/libst.a objs/http-parser-2.1/libhttp_parser.a -ldl
# build objs/sb_rtmp_load
sb_rtmp_load: objs/sb_rtmp_load
objs/sb_rtmp_load: objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_rtmp_load.o objs/src/main/htl_main_utility.o 
	$(LINK)  -o objs/sb_rtmp_load objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_rtmp_load.o objs/src/main/htl_main_utility.o objs/st-1.9/obj/libst.a objs/http-parser-2.1/libhttp_parser.a -ldl
# build objs/sb_rtmp_load_fast
sb_rtmp_load_fast: objs/sb_rtmp_load_fast
objs/sb_rtmp_load_fast: objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_rtmp_load_fast.o objs/src/main/htl_main_utility.o 
	$(LINK)  -o objs/sb_rtmp_load_fast objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_rtmp_load_fast.o objs/src/main/htl_main_utility.o objs/st-1.9/obj/libst.a objs/http-parser-2.1/libhttp_parser.a -ldl
# build objs/sb_rtmp_publish
sb_rtmp_publish: objs/sb_rtmp_publish
objs/sb_rtmp_publish: objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_utility.o objs/src/main/htl_main_rtmp_publish.o 
	$(LINK)  -o objs/sb_rtmp_publish objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_utility.o objs/src/main/htl_main_rtmp_publish.o objs/st-1.9/obj/libst.a objs/http-parser-2.1/libhttp_parser.a -ldl
# build objs/sb_hls_load
sb_hls_load: objs/sb_hls_load
objs/sb_hls_load: objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_hls_load.o objs/src/main/htl_main_utility.o 
	$(LINK)  -o objs/sb_hls_load objs/src/core/htl_core_log.o objs/src/core/htl_core_error.o objs/src/core/htl_core_uri.o objs/src/core/htl_core_aggregate_ret.o objs/src/os/htl_os_st.o objs/src/app/htl_app_hls_load.o objs/src/app/htl_app_http_load.o objs/src/app/htl_app_http_client.o objs/src/app/htl_app_rtmp_play.o objs/src/app/htl_app_m3u8_parser.o objs/src/app/htl_app_task_base.o objs/src/app/htl_app_rtmp_load.o objs/src/app/srs_librtmp.o objs/src/app/htl_app_rtmp_publish.o objs/src/app/htl_app_srs_hijack.o objs/src/main/htl_main_hls_load.o objs/src/main/htl_main_utility.o objs/st-1.9/obj/libst.a objs/http-parser-2.1/libhttp_parser.a -ldl
