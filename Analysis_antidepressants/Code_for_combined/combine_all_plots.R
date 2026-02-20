library(magick)

source("Analysis_antidepressants/Code_for_graphs/helpers.graphs/gather_TEs.R")
source("Analysis_antidepressants/Code_for_graphs/helpers.graphs/plot_results.R")

out <- c("Response","Remission","AE","Loss_to_follow_up","Loss_to_follow_up_AE")
search <- paste0(getwd(),"/Analysis_antidepressants/Results/")

### Combine forest plots for treatments effects to create Figure 3(A-E)

file_fig3 <- paste("netgraph",out,sep = "_")
files_fig3 <- paste(search,file_fig3,".tiff",sep = "")
imgs_fig3 <- lapply(files_fig3, image_read)
grid_fig3 <- image_montage(
  image_join(imgs_fig3),
  tile = "3x2",       # 3 columns, 2 rows
  geometry = "+10+10"# spacing between images
)
# Save combined graph
image_write(grid_fig3, "Analysis_antidepressants/Results/Figure3.tiff", format = "tiff",density = "300x300")

### Combine forest plots for treatments effects to create Figure 4(A-E)

file_fig4 <- paste("TE",out,sep = "_")
files_fig4 <- paste(search,file_fig4,".tiff",sep = "")
imgs_fig4 <- lapply(files_fig4, image_read)
grid_fig4 <- image_montage(
  image_join(imgs_fig4),
  tile = "3x2",       # 3 columns, 2 rows
  geometry = "+10+10"# spacing between images
)
print(grid_fig4)

# Save combined graph
image_write(grid_fig4, "Analysis_antidepressants/Results/Figure4.tiff", format = "tiff",density = "300x300")

