	component on_chip_with_keyboard_pio is
		port (
			clk_clk                : in  std_logic                     := 'X';             -- clk
			mouse_click_export     : out std_logic;                                        -- export
			mouse_x_export         : out std_logic_vector(11 downto 0);                    -- export
			mouse_y_export         : out std_logic_vector(11 downto 0);                    -- export
			otg_hpi_address_export : out std_logic_vector(1 downto 0);                     -- export
			otg_hpi_cs_export      : out std_logic;                                        -- export
			otg_hpi_data_in_port   : in  std_logic_vector(15 downto 0) := (others => 'X'); -- in_port
			otg_hpi_data_out_port  : out std_logic_vector(15 downto 0);                    -- out_port
			otg_hpi_r_export       : out std_logic;                                        -- export
			otg_hpi_reset_export   : out std_logic;                                        -- export
			otg_hpi_w_export       : out std_logic;                                        -- export
			reset_reset_n          : in  std_logic                     := 'X';             -- reset_n
			exposure_export        : out std_logic_vector(31 downto 0);                    -- export
			green1_export          : out std_logic_vector(31 downto 0);                    -- export
			green2_export          : out std_logic_vector(31 downto 0);                    -- export
			red_export             : out std_logic_vector(31 downto 0);                    -- export
			blue_export            : out std_logic_vector(31 downto 0)                     -- export
		);
	end component on_chip_with_keyboard_pio;

	u0 : component on_chip_with_keyboard_pio
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			mouse_click_export     => CONNECTED_TO_mouse_click_export,     --     mouse_click.export
			mouse_x_export         => CONNECTED_TO_mouse_x_export,         --         mouse_x.export
			mouse_y_export         => CONNECTED_TO_mouse_y_export,         --         mouse_y.export
			otg_hpi_address_export => CONNECTED_TO_otg_hpi_address_export, -- otg_hpi_address.export
			otg_hpi_cs_export      => CONNECTED_TO_otg_hpi_cs_export,      --      otg_hpi_cs.export
			otg_hpi_data_in_port   => CONNECTED_TO_otg_hpi_data_in_port,   --    otg_hpi_data.in_port
			otg_hpi_data_out_port  => CONNECTED_TO_otg_hpi_data_out_port,  --                .out_port
			otg_hpi_r_export       => CONNECTED_TO_otg_hpi_r_export,       --       otg_hpi_r.export
			otg_hpi_reset_export   => CONNECTED_TO_otg_hpi_reset_export,   --   otg_hpi_reset.export
			otg_hpi_w_export       => CONNECTED_TO_otg_hpi_w_export,       --       otg_hpi_w.export
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --           reset.reset_n
			exposure_export        => CONNECTED_TO_exposure_export,        --        exposure.export
			green1_export          => CONNECTED_TO_green1_export,          --          green1.export
			green2_export          => CONNECTED_TO_green2_export,          --          green2.export
			red_export             => CONNECTED_TO_red_export,             --             red.export
			blue_export            => CONNECTED_TO_blue_export             --            blue.export
		);

