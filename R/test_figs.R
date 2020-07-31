#' create plots with diffeent resolution
#' 
#' 

dpi <-  96

png(filename=here::here("figures","test1.png"),width = 400,height=200,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test2.png"),width = 400,height=400,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test3.png"),width = 400,height=600,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test4.png"),width = 400,height=800,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test5.png"),width = 600,height=200,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test6.png"),width = 600,height=400,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test7.png"),width = 600,height=600,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test8.png"),width = 600,height=800,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test9.png"),width = 800,height=200,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test10.png"),width = 800,height=400,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test11.png"),width = 800,height=600,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test12.png"),width = 800,height=800,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test13.png"),width = 1000,height=200,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test14.png"),width = 1000,height=400,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test15.png"),width = 1000,height=600,units="px",res=dpi)
plot(1:10,1:10)
dev.off()

png(filename=here::here("figures","test16.png"),width = 1000,height=800,units="px",res=dpi)
plot(1:10,1:10)
dev.off()
