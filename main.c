#include "minilibx_macos/mlx.h"

# define WINDOW_WIDTH 500
# define WINDOW_HEIGHT 500

int main()
{
    void    *mlx_ptr;
    void    *win_ptr;

    mlx_ptr = mlx_init();
    win_ptr = mlx_new_window(mlx_ptr, WINDOW_WIDTH, WINDOW_HEIGHT, "mlx 42");
    //mlx_pixel_put(mlx_ptr, win_ptr, 250, 250, 0xFF0000);
    
    mlx_loop(mlx_ptr);
}