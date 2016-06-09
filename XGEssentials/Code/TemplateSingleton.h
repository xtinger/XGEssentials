
#ifndef Wipi_TemplateSingleton_h
#define Wipi_TemplateSingleton_h

#define SINGLETON_FOR_CLASS_HEADER(classname) \
+ (classname *)sharedInstance


#define SINGLETON_FOR_CLASS_MODULE(classname) \
\
static classname *g_shared##classname = nil; \
\
+ (classname *)sharedInstance \
{ \
@synchronized(self) \
{ \
if (g_shared##classname == nil) \
{ \
g_shared##classname = [[self alloc] init]; \
} \
} \
\
return g_shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (g_shared##classname == nil) \
{ \
g_shared##classname = [super allocWithZone:zone]; \
return g_shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
\
\

#endif
