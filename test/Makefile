NAME = test_cpmutex

CSRC = test_cpmutex.cpp
HDRS =
OBJDIR = obj
_OBJS = $(patsubst %.cpp,%.o,$(CSRC))
OBJS =  $(patsubst %, $(OBJDIR)/%, $(_OBJS))


DEBUG =
DEFS = DEBUG

CCFLAGS = -fpic -std=c++14 -Wno-format-security -g3 $(addprefix -D,$(DEFS)) -I../
LINKFLAGS =  -lcpmutex -L.. -lpthread

all:        $(NAME)

test%:  $(OBJDIR)/test%.o  $(HDRS)
        clang++ $(CCFLAGS) -o $@ $(OBJDIR)/test$*.o $(LINKFLAGS)

$(OBJDIR)/%.o:  %.cpp $(HDRS)
        clang++ $(CCFLAGS) -o $@ -c $<

clean:
        rm -f $(OBJS) $(NAME)
