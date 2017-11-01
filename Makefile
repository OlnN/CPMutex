NAME = libcpmutex.so

CSRC = cpmutex.cpp
HDRS = cpmutex.h
OBJDIR = obj
_OBJS = $(patsubst %.cpp,%.o,$(CSRC))
OBJS =	$(patsubst %, $(OBJDIR)/%, $(_OBJS))


DEBUG =
DEFS = DEBUG

CCFLAGS = -fpic -std=c++14 -Wno-format-security -g3 $(addprefix -D,$(DEFS)) 
LINKFLAGS =  -shared

all:		$(NAME)
		cd test && make

clean:
		rm -f $(OBJS) $(NAME)
		cd test && make clean

$(NAME):	$(OBJS) $(HDRS)
		clang  -o $@ $(OBJS) $(LINKFLAGS)

$(OBJDIR)/%.o:	%.cpp $(HDRS)
		clang $(CCFLAGS) -o $@ -c $<

