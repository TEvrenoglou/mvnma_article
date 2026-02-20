library(magick)
#
source("Analysis_osteoarthritis/Code_for_combined_graphs/helpers.graphs/gather_TEs.R")
source("Analysis_osteoarthritis/Code_for_combined_graphs/helpers.graphs/plot_results.R")
#
out <- c("Pain","Disability")
search <- paste0(getwd(),"/Analysis_osteoarthritis/Results/")
#
# Combine forest plots for treatments effects to create Figure 1(A-E)
#
file_fig1 <- paste("netgraph",out,sep = "_")
files_fig1 <- paste(search,file_fig1,".tiff",sep = "")
imgs_fig1 <- lapply(files_fig1, image_read)
grid_fig1 <- image_montage(
  image_join(imgs_fig1),
  tile = "2x1",       # 2 columns, 1 row
  geometry = "+10+10"# spacing between images
)
# Save combined graph
image_write(grid_fig1, "Analysis_osteoarthritis/Results/Figure1.tiff", format = "tiff",density = "300x300")
# 
# Combine forest plots for treatments effects to create Figure 2(A-E)
#
file_fig2 <- paste("TE",out,sep = "_")
files_fig2 <- paste(search,file_fig2,".tiff",sep = "")
imgs_fig2 <- lapply(files_fig2, image_read)
grid_fig2 <- image_montage(
  image_join(imgs_fig2),
  tile = "2x1",       # 2 columns, 1 rows
  geometry = "+10+10"# spacing between images
)
# Save combined graph
image_write(grid_fig2, "Analysis_osteoarthritis/Results/Figure2.tiff", format = "tiff",density = "300x300")

