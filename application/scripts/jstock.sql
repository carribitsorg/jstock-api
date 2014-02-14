-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 15, 2014 at 12:17 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jstock`
--

-- --------------------------------------------------------

--
-- Table structure for table `daily_market_report`
--

CREATE TABLE IF NOT EXISTS `daily_market_report` (
  `report_date` date NOT NULL,
  `one_week_graph` varchar(1024) NOT NULL,
  `one_month_graph` varchar(1024) NOT NULL,
  `three_month_graph` varchar(1024) NOT NULL,
  `six_month_graph` varchar(1024) NOT NULL,
  `one_year_graph` varchar(1024) NOT NULL,
  `value_date` date NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `change` decimal(10,2) NOT NULL,
  `change_perc` decimal(10,2) NOT NULL,
  `change_dir` varchar(32) NOT NULL,
  `vol` decimal(10,2) NOT NULL,
  `market_capitalization` decimal(10,2) NOT NULL,
  `change_1969` decimal(10,2) NOT NULL,
  `wtd` decimal(10,2) NOT NULL,
  `mtd` decimal(10,2) NOT NULL,
  `qtd` int(11) NOT NULL,
  `ytd` decimal(10,2) NOT NULL,
  `wtd_direction` varchar(32) NOT NULL,
  `mtd_direction` varchar(32) NOT NULL,
  `qtd_direction` varchar(32) NOT NULL,
  `ytd_direction` varchar(32) NOT NULL,
  `change_perc_dir` varchar(32) NOT NULL,
  `index_name` varchar(16) NOT NULL,
  KEY `report_date` (`report_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_market_report`
--

INSERT INTO `daily_market_report` (`report_date`, `one_week_graph`, `one_month_graph`, `three_month_graph`, `six_month_graph`, `one_year_graph`, `value_date`, `value`, `change`, `change_perc`, `change_dir`, `vol`, `market_capitalization`, `change_1969`, `wtd`, `mtd`, `qtd`, `ytd`, `wtd_direction`, `mtd_direction`, `qtd_direction`, `ytd_direction`, `change_perc_dir`, `index_name`) VALUES
('2014-02-14', '79435.220;79184.540;79193.510;79133.760;79116.250;79614.290\nFeb 07, 2014 - 79,435.22;Feb 10, 2014 - 79,184.54;Feb 11, 2014 - 79,193.51;Feb 12, 2014 - 79,133.76;Feb 13, 2014 - 79,116.25;Feb 14, 2014 - 79,614.29\n7;10;11;12;13;14', '79840.960;80227.600;79922.910;79619.380;79892.040;80173.720;79771.250;79636.630;79854.040;79567.500;80540.480;81315.470;82387.810;81436.230;81017.930;81192.730;78993.480;79435.220;79184.540;79193.510;79133.760;79116.250;79614.290\nJan 15, 2014 - 79,840.96;Jan 16, 2014 - 80,227.60;Jan 17, 2014 - 79,922.91;Jan 20, 2014 - 79,619.38;Jan 21, 2014 - 79,892.04;Jan 22, 2014 - 80,173.72;Jan 23, 2014 - 79,771.25;Jan 24, 2014 - 79,636.63;Jan 27, 2014 - 79,854.04;Jan 28, 2014 - 79,567.50;Jan 29, 2014 - 80,540.48;Jan 30, 2014 - 81,315.47;Jan 31, 2014 - 82,387.81;Feb 03, 2014 - 81,436.23;Feb 04, 2014 - 81,017.93;Feb 05, 2014 - 81,192.73;Feb 06, 2014 - 78,993.48;Feb 07, 2014 - 79,435.22;Feb 10, 2014 - 79,184.54;Feb 11, 2014 - 79,193.51;Feb 12, 2014 - 79,133.76;Feb 13, 2014 - 79,116.25;Feb 14, 2014 - 79,614.29\n15;16;17;20;21;22;23;24;27;28;29;30;31;Feb;4;5;6;7;10;11;12;13;14', '77186.500;77428.290;77001.060;77086.980;77384.080;77301.920;77460.730;77591.330;77144.570;77481.830;78769.580;78584.850;79073.800;79186.200;79093.810;79911.120;78714.600;78665.440;78096.310;77877.890;77624.110;77692.090;77978.210;78512.420;78667.650;78855.650;79337.370;79199.780;79447.880;80633.550;81002.810;80531.480;80005.430;79651.030;80094.420;79883.450;79766.010;79950.500;79865.290;79840.960;80227.600;79922.910;79619.380;79892.040;80173.720;79771.250;79636.630;79854.040;79567.500;80540.480;81315.470;82387.810;81436.230;81017.930;81192.730;78993.480;79435.220;79184.540;79193.510;79133.760;79116.250;79614.290\nNov 18, 2013 - 77,186.50;Nov 19, 2013 - 77,428.29;Nov 20, 2013 - 77,001.06;Nov 21, 2013 - 77,086.98;Nov 22, 2013 - 77,384.08;Nov 25, 2013 - 77,301.92;Nov 26, 2013 - 77,460.73;Nov 27, 2013 - 77,591.33;Nov 28, 2013 - 77,144.57;Nov 29, 2013 - 77,481.83;Dec 02, 2013 - 78,769.58;Dec 03, 2013 - 78,584.85;Dec 04, 2013 - 79,073.80;Dec 05, 2013 - 79,186.20;Dec 06, 2013 - 79,093.81;Dec 09, 2013 - 79,911.12;Dec ', '85373.850;85676.880;85214.090;85066.460;85086.160;84936.680;84650.060;84480.160;84717.610;85039.910;84442.250;85363.570;84771.430;84593.490;84840.690;85010.180;85062.530;85331.520;85359.550;84893.830;84968.000;84798.970;84825.930;84436.770;84819.820;84157.440;84144.930;84122.810;84415.540;84285.070;84500.200;85050.340;85328.520;85040.740;84399.820;84271.590;84093.360;83662.330;82934.250;83328.280;83233.600;83036.360;82468.480;82075.010;81806.110;82320.710;82304.350;81979.680;82154.720;82663.070;81675.460;81639.520;81832.160;82190.300;82868.000;81689.240;81134.050;82001.880;78679.410;78634.190;78989.090;78407.850;78133.270;77667.370;77186.500;77428.290;77001.060;77086.980;77384.080;77301.920;77460.730;77591.330;77144.570;77481.830;78769.580;78584.850;79073.800;79186.200;79093.810;79911.120;78714.600;78665.440;78096.310;77877.890;77624.110;77692.090;77978.210;78512.420;78667.650;78855.650;79337.370;79199.780;79447.880;80633.550;81002.810;80531.480;80005.430;79651.030;80094.420;79883.450;79766.010;79950.500;7986', '85369.170;85499.750;84968.550;85027.370;84622.370;85390.710;84665.710;84048.930;83959.300;83905.900;85308.130;85694.890;85384.570;85400.240;84380.910;85253.740;83950.070;84107.810;83458.690;83711.640;83770.500;82665.870;82612.780;82630.120;82241.970;82512.840;82594.830;81986.300;82111.640;79894.890;79863.720;81579.810;81232.160;80430.670;81469.700;81752.760;82076.410;83246.990;83252.470;83067.310;83174.230;83040.800;83308.580;83315.220;83522.960;83518.890;83214.750;83039.750;83476.380;83549.410;83813.920;83811.090;84259.730;84264.650;83824.520;84318.470;84008.360;84479.120;84629.610;85273.150;85410.860;85379.880;85395.370;85693.250;86275.280;86529.000;86366.070;87190.560;87297.620;87578.310;87577.920;88455.090;88356.800;88455.470;87778.900;87495.760;87675.590;87884.020;87914.400;88639.940;88849.670;88440.970;87805.820;88000.810;88297.860;88252.950;87769.200;87263.840;87135.910;87085.870;86853.910;86796.670;87337.260;87434.180;87361.200;88276.460;86977.410;86931.610;86978.730;86677.830;86944.140;87894.710;8658', '2014-02-14', 79614.29, 498.04, 0.63, 'images/mov_up.gif', 1976790.00, 0.00, 0.00, 0.23, -3.37, -1, -1.26, 'images/mov_up.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_up.gif', 'MAIN_INDEX'),
('2014-02-14', '2244.110;2250.650;2255.240;2255.050;2253.540;2265.570\nFeb 07, 2014 - 2,244.11;Feb 10, 2014 - 2,250.65;Feb 11, 2014 - 2,255.24;Feb 12, 2014 - 2,255.05;Feb 13, 2014 - 2,253.54;Feb 14, 2014 - 2,265.57\n7;10;11;12;13;14', '2223.280;2244.740;2221.140;2206.440;2219.920;2250.940;2228.500;2218.280;2222.450;2214.760;2229.740;2218.740;2281.990;2238.460;2233.200;2236.900;2251.440;2244.110;2250.650;2255.240;2255.050;2253.540;2265.570\nJan 15, 2014 - 2,223.28;Jan 16, 2014 - 2,244.74;Jan 17, 2014 - 2,221.14;Jan 20, 2014 - 2,206.44;Jan 21, 2014 - 2,219.92;Jan 22, 2014 - 2,250.94;Jan 23, 2014 - 2,228.50;Jan 24, 2014 - 2,218.28;Jan 27, 2014 - 2,222.45;Jan 28, 2014 - 2,214.76;Jan 29, 2014 - 2,229.74;Jan 30, 2014 - 2,218.74;Jan 31, 2014 - 2,281.99;Feb 03, 2014 - 2,238.46;Feb 04, 2014 - 2,233.20;Feb 05, 2014 - 2,236.90;Feb 06, 2014 - 2,251.44;Feb 07, 2014 - 2,244.11;Feb 10, 2014 - 2,250.65;Feb 11, 2014 - 2,255.24;Feb 12, 2014 - 2,255.05;Feb 13, 2014 - 2,253.54;Feb 14, 2014 - 2,265.57\n15;16;17;20;21;22;23;24;27;28;29;30;31;Feb;4;5;6;7;10;11;12;13;14', '2075.780;2088.780;2064.730;2066.220;2078.990;2076.500;2090.980;2098.280;2074.860;2093.370;2164.850;2151.310;2181.360;2188.010;2182.560;2222.960;2155.860;2153.620;2123.020;2108.740;2100.060;2099.190;2114.790;2141.230;2152.310;2156.420;2176.670;2169.380;2174.490;2176.170;2178.640;2225.440;2207.410;2189.630;2205.870;2188.410;2198.730;2230.340;2220.830;2223.280;2244.740;2221.140;2206.440;2219.920;2250.940;2228.500;2218.280;2222.450;2214.760;2229.740;2218.740;2281.990;2238.460;2233.200;2236.900;2251.440;2244.110;2250.650;2255.240;2255.050;2253.540;2265.570\nNov 18, 2013 - 2,075.78;Nov 19, 2013 - 2,088.78;Nov 20, 2013 - 2,064.73;Nov 21, 2013 - 2,066.22;Nov 22, 2013 - 2,078.99;Nov 25, 2013 - 2,076.50;Nov 26, 2013 - 2,090.98;Nov 27, 2013 - 2,098.28;Nov 28, 2013 - 2,074.86;Nov 29, 2013 - 2,093.37;Dec 02, 2013 - 2,164.85;Dec 03, 2013 - 2,151.31;Dec 04, 2013 - 2,181.36;Dec 05, 2013 - 2,188.01;Dec 06, 2013 - 2,182.56;Dec 09, 2013 - 2,222.96;Dec 10, 2013 - 2,155.86;Dec 11, 2013 - 2,153.62;Dec 12, 2013 - 2,123.02;Dec 13, 20', '2357.710;2373.780;2347.680;2341.400;2342.910;2334.640;2332.230;2323.740;2337.040;2353.970;2321.700;2372.660;2340.000;2330.160;2343.800;2353.080;2355.970;2370.700;2372.740;2347.060;2351.190;2342.820;2338.510;2317.110;2338.230;2301.760;2301.810;2303.520;2319.660;2312.470;2324.330;2349.680;2368.060;2354.050;2316.720;2311.920;2302.720;2283.340;2244.610;2267.130;2261.630;2250.580;2216.900;2198.350;2188.350;2215.330;2214.500;2198.010;2207.730;2236.120;2181.630;2179.650;2190.250;2208.280;2245.610;2180.640;2149.880;2198.360;2156.090;2153.600;2174.180;2140.760;2130.370;2103.820;2075.780;2088.780;2064.730;2066.220;2078.990;2076.500;2090.980;2098.280;2074.860;2093.370;2164.850;2151.310;2181.360;2188.010;2182.560;2222.960;2155.860;2153.620;2123.020;2108.740;2100.060;2099.190;2114.790;2141.230;2152.310;2156.420;2176.670;2169.380;2174.490;2176.170;2178.640;2225.440;2207.410;2189.630;2205.870;2188.410;2198.730;2230.340;2220.830;2223.280;2244.740;2221.140;2206.440;2219.920;2250.940;2228.500;2218.280;2222.450;2214.760;2229.74', '2146.250;2153.390;2124.780;2128.550;2119.830;2162.150;2141.020;2152.150;2146.800;2144.020;2227.620;2241.890;2238.790;2238.030;2178.910;2233.620;2162.130;2166.890;2131.120;2145.210;2148.300;2146.460;2142.400;2143.480;2122.140;2123.130;2131.810;2097.190;2106.000;2126.960;2124.670;2219.750;2208.370;2175.200;2223.000;2239.130;2246.660;2242.740;2232.920;2222.510;2228.140;2225.260;2239.980;2238.360;2249.810;2249.730;2232.780;2222.870;2249.930;2253.790;2267.960;2266.900;2291.320;2291.890;2263.660;2291.130;2273.490;2299.190;2306.980;2338.510;2324.720;2318.880;2319.700;2336.760;2365.230;2383.550;2374.210;2419.710;2425.590;2441.060;2434.580;2483.290;2483.940;2487.770;2475.920;2460.020;2469.930;2478.220;2479.910;2521.470;2530.760;2507.890;2477.880;2486.120;2502.210;2500.100;2473.480;2449.230;2446.160;2439.860;2426.360;2423.280;2453.070;2459.240;2452.970;2502.530;2430.940;2428.380;2431.770;2414.400;2428.790;2473.790;2402.730;2409.370;2437.850;2402.440;2407.750;2432.400;2418.150;2430.630;2409.830;2399.600;2385.800;2380.61', '2014-02-14', 2265.57, 12.03, 0.53, 'images/mov_up.gif', 2600050.00, 0.00, 0.00, 0.96, -0.72, 4, 4.11, 'images/mov_up.gif', 'images/mov_down.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'JSE_SELECT'),
('2014-02-14', '83953.110;83572.850;83682.300;83591.650;83565.100;84320.580\nFeb 07, 2014 - 83,953.11;Feb 10, 2014 - 83,572.85;Feb 11, 2014 - 83,682.30;Feb 12, 2014 - 83,591.65;Feb 13, 2014 - 83,565.10;Feb 14, 2014 - 84,320.58\n7;10;11;12;13;14', '81083.430;81669.930;81207.740;80747.320;81160.930;82023.810;81413.320;81209.110;81538.900;81104.250;82580.180;83755.770;85382.430;83938.970;83304.430;83569.590;83718.670;83953.110;83572.850;83682.300;83591.650;83565.100;84320.580\nJan 15, 2014 - 81,083.43;Jan 16, 2014 - 81,669.93;Jan 17, 2014 - 81,207.74;Jan 20, 2014 - 80,747.32;Jan 21, 2014 - 81,160.93;Jan 22, 2014 - 82,023.81;Jan 23, 2014 - 81,413.32;Jan 24, 2014 - 81,209.11;Jan 27, 2014 - 81,538.90;Jan 28, 2014 - 81,104.25;Jan 29, 2014 - 82,580.18;Jan 30, 2014 - 83,755.77;Jan 31, 2014 - 85,382.43;Feb 03, 2014 - 83,938.97;Feb 04, 2014 - 83,304.43;Feb 05, 2014 - 83,569.59;Feb 06, 2014 - 83,718.67;Feb 07, 2014 - 83,953.11;Feb 10, 2014 - 83,572.85;Feb 11, 2014 - 83,682.30;Feb 12, 2014 - 83,591.65;Feb 13, 2014 - 83,565.10;Feb 14, 2014 - 84,320.58\n15;16;17;20;21;22;23;24;27;28;29;30;31;Feb;4;5;6;7;10;11;12;13;14', '75996.400;76416.740;75674.020;75823.390;76339.890;76201.400;76477.490;76704.530;75927.870;76514.170;78752.850;78431.710;79281.710;79477.120;79316.510;80737.350;78657.270;78571.810;77582.400;77202.680;76761.490;76879.670;77377.080;78305.800;78575.660;78902.490;79596.600;79357.400;79788.720;81850.040;82410.130;81695.230;80897.300;80359.750;81032.290;80712.270;80534.130;81249.600;81120.350;81083.430;81669.930;81207.740;80747.320;81160.930;82023.810;81413.320;81209.110;81538.900;81104.250;82580.180;83755.770;85382.430;83938.970;83304.430;83569.590;83718.670;83953.110;83572.850;83682.300;83591.650;83565.100;84320.580\nNov 18, 2013 - 75,996.40;Nov 19, 2013 - 76,416.74;Nov 20, 2013 - 75,674.02;Nov 21, 2013 - 75,823.39;Nov 22, 2013 - 76,339.89;Nov 25, 2013 - 76,201.40;Nov 26, 2013 - 76,477.49;Nov 27, 2013 - 76,704.53;Nov 28, 2013 - 75,927.87;Nov 29, 2013 - 76,514.17;Dec 02, 2013 - 78,752.85;Dec 03, 2013 - 78,431.71;Dec 04, 2013 - 79,281.71;Dec 05, 2013 - 79,477.12;Dec 06, 2013 - 79,316.51;Dec 09, 2013 - 80,737.35;Dec ', '85460.900;85994.080;85179.800;84920.040;84954.710;84691.690;84635.170;84336.240;84754.040;85321.120;84269.540;85890.590;84848.720;84535.650;84970.580;85268.800;85360.920;85834.210;85883.530;85064.080;85194.580;84897.190;84944.620;84259.890;84933.870;83768.420;83746.400;83707.490;84222.540;83992.980;84371.490;85339.460;85828.920;85322.570;84194.890;83969.260;83655.660;82897.260;81616.210;82309.510;82142.910;81795.870;80796.700;80104.390;79631.260;80536.700;80507.910;79936.650;80244.640;81139.070;79401.380;79338.150;79677.090;80307.250;81499.650;79425.620;78448.760;79975.720;78607.710;78528.160;79148.110;78125.430;77642.310;76832.370;75996.400;76416.740;75674.020;75823.390;76339.890;76201.400;76477.490;76704.530;75927.870;76514.170;78752.850;78431.710;79281.710;79477.120;79316.510;80737.350;78657.270;78571.810;77582.400;77202.680;76761.490;76879.670;77377.080;78305.800;78575.660;78902.490;79596.600;79357.400;79788.720;81850.040;82410.130;81695.230;80897.300;80359.750;81032.290;80712.270;80534.130;81249.600;8112', '79415.580;79645.460;78710.290;78813.840;78100.830;79453.490;78177.140;78414.030;78256.250;78162.230;80832.810;81513.700;81444.620;81472.210;79677.670;81214.310;78919.180;79196.890;78054.120;78497.970;78601.580;78450.440;78356.970;78387.490;77704.160;78181.030;78325.370;77254.060;77474.720;77831.830;77776.940;80798.120;80186.090;78775.070;80604.280;81102.600;81672.390;81491.250;81276.710;80950.740;81138.970;81128.250;81599.690;81611.380;81977.100;81969.950;81434.500;81126.410;81895.100;82023.680;82489.340;82484.350;83274.180;83282.860;82508.010;83377.600;82831.650;83660.420;83925.360;85058.310;84628.180;84573.640;84600.900;85125.320;86149.990;86596.660;86309.820;87761.340;87949.820;88443.970;88443.290;89987.540;89814.510;89988.220;89693.890;89195.420;89512.010;89878.950;89932.440;91209.760;91534.150;90814.630;89696.440;90039.730;90562.680;90483.620;89631.980;88742.300;88512.590;88424.480;88043.020;87942.260;88893.960;89037.690;88909.200;90520.520;88233.550;88152.900;88235.870;87706.140;88174.960;89848.460;8753', '2014-02-14', 84320.58, 755.48, 0.90, 'images/mov_up.gif', 1865790.00, 0.00, 0.00, 0.44, -1.24, 3, 3.02, 'images/mov_up.gif', 'images/mov_down.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'ALL_JAMAICAN'),
('2014-02-14', '668.550;668.550;666.800;666.800;666.800;666.800\nFeb 07, 2014 - 668.55;Feb 10, 2014 - 668.55;Feb 11, 2014 - 666.80;Feb 12, 2014 - 666.80;Feb 13, 2014 - 666.80;Feb 14, 2014 - 666.80\n7;10;11;12;13;14', '732.310;732.310;732.310;732.310;732.310;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800\nJan 15, 2014 - 732.31;Jan 16, 2014 - 732.31;Jan 17, 2014 - 732.31;Jan 20, 2014 - 732.31;Jan 21, 2014 - 732.31;Jan 22, 2014 - 724.34;Jan 23, 2014 - 724.34;Jan 24, 2014 - 724.34;Jan 27, 2014 - 724.34;Jan 28, 2014 - 724.34;Jan 29, 2014 - 724.34;Jan 30, 2014 - 724.34;Jan 31, 2014 - 724.34;Feb 03, 2014 - 724.34;Feb 04, 2014 - 724.34;Feb 05, 2014 - 724.34;Feb 06, 2014 - 660.58;Feb 07, 2014 - 668.55;Feb 10, 2014 - 668.55;Feb 11, 2014 - 666.80;Feb 12, 2014 - 666.80;Feb 13, 2014 - 666.80;Feb 14, 2014 - 666.80\n15;16;17;20;21;22;23;24;27;28;29;30;31;Feb;4;5;6;7;10;11;12;13;14', '738.510;738.510;738.510;738.510;738.510;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;732.310;732.310;732.310;732.310;732.310;732.310;732.310;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800\nNov 18, 2013 - 738.51;Nov 19, 2013 - 738.51;Nov 20, 2013 - 738.51;Nov 21, 2013 - 738.51;Nov 22, 2013 - 738.51;Nov 25, 2013 - 738.46;Nov 26, 2013 - 738.46;Nov 27, 2013 - 738.46;Nov 28, 2013 - 738.46;Nov 29, 2013 - 738.46;Dec 02, 2013 - 738.46;Dec 03, 2013 - 738.46;Dec 04, 2013 - 738.46;Dec 05, 2013 - 738.46;Dec 06, 2013 - 738.46;Dec 09, 2013 - 738.46;Dec 10, 2013 - 738.46;Dec 11, 2013 - 738.46;Dec 12, 2013 - 738.46;Dec 13, 2013 - 738.46;Dec 16, 2013 - 738.46;Dec 17, 2013 - 738.46;Dec 18, 2013 - 738.46;Dec 19, 2013 - 738.46;', '799.260;799.260;799.260;799.260;799.260;799.260;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;738.460;738.460;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;732.310;732.310;732.310;732.310;732.310;732.310;732.310;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800\nAug 19, 2013 - 7', '873.660;873.660;873.660;873.660;873.660;873.660;873.660;857.350;857.350;857.350;854.860;854.860;848.980;848.980;848.980;848.980;848.980;848.980;848.980;849.000;849.000;826.890;826.890;826.890;826.890;826.890;826.890;826.890;826.890;774.380;774.380;774.380;774.380;774.380;774.380;774.380;774.380;802.020;804.780;804.780;804.780;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;799.260;799.260;799.260;799.260;799.260;799.260;799.810;799.810;799.810;799.810;799.810;799.810;799.810;799.810;799.860;799.860;799.530;799.530;799.530;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.260;799.260;799.260;799.260;799.260;799.260;', '2014-02-14', 666.80, 0.00, 0.00, 'images/mov_none.gif', 0.00, 0.00, 0.00, -0.26, -7.94, -10, -9.93, 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_none.gif', 'CROSS_LISTED');

-- --------------------------------------------------------

--
-- Table structure for table `daily_summary`
--

CREATE TABLE IF NOT EXISTS `daily_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `summary_date` date DEFAULT NULL,
  `stock` varchar(20) DEFAULT NULL,
  `security` varchar(128) DEFAULT NULL,
  `volume` decimal(18,2) DEFAULT NULL,
  `close_price` decimal(18,2) DEFAULT NULL,
  `change` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

--
-- Dumping data for table `daily_summary`
--

INSERT INTO `daily_summary` (`id`, `summary_date`, `stock`, `security`, `volume`, `close_price`, `change`) VALUES
(1, '2014-01-23', 'ADVANCING', 'Caribbean Cement Company Ltd.', 108345.00, 4.08, 0.09),
(2, '2014-01-23', 'ADVANCING', 'Jamaica Broilers Ltd.', 2880.00, 4.72, 0.01),
(3, '2014-01-23', 'ADVANCING', 'Jamaica Money Market Brokers Limited 8.75%', 350500.00, 3.01, 0.01),
(4, '2014-01-23', 'ADVANCING', 'Pan-Jamaican Investment Trust Ltd.', 216.00, 48.20, 0.05),
(5, '2014-01-23', 'ADVANCING', 'Proven Investments Limited 8%', 1150.00, 5.10, 0.02),
(6, '2014-01-23', 'ADVANCING', 'Scotia Group Jamaica', 66879.00, 20.86, 0.10),
(7, '2014-01-23', 'DECLINING', 'Carreras Limited', 14019.00, 34.53, -1.97),
(8, '2014-01-23', 'DECLINING', 'GraceKennedy Ltd.', 123716.00, 55.00, -1.00),
(9, '2014-01-23', 'DECLINING', 'Hardware & Lumber', 17500.00, 8.34, -0.66),
(10, '2014-01-23', 'DECLINING', 'Jamaica Money Market Brokers Ltd.', 558.00, 7.11, -0.38),
(11, '2014-01-23', 'DECLINING', 'Sagicor Group Jamaica Limited', 11117.00, 8.45, -0.04),
(12, '2014-01-23', 'DECLINING', 'Sagicor Real Estate X Fund Limited', 300.00, 6.30, -0.20),
(13, '2014-01-23', 'DECLINING', 'Seprod Limited', 107484.00, 10.84, -0.16),
(14, '2014-01-23', 'DECLINING', 'Supreme Ventures Limited', 78102.00, 2.40, -0.02),
(15, '2014-01-23', 'TRADING_FIRM', 'Berger Paints Ltd.', 445725.00, 1.80, 0.00),
(16, '2014-01-23', 'TRADING_FIRM', 'Desnoes and Geddes Ltd.', 45909.00, 5.00, 0.00),
(17, '2014-01-23', 'TRADING_FIRM', 'Gleaner Company', 5600.00, 1.10, 0.00),
(18, '2014-01-23', 'TRADING_FIRM', 'Jamaica Money Market Brokers Ltd 8.50%', 1000.00, 3.50, 0.00),
(19, '2014-01-23', 'TRADING_FIRM', 'Mayberry Investments Ltd', 1223442.00, 2.00, 0.00),
(20, '2014-01-23', 'TRADING_FIRM', 'National Commercial Bank of Jamaica Ltd.', 133900.00, 17.99, 0.00),
(21, '2014-02-10', 'ADVANCING', 'Caribbean Cement Company Ltd.', 7250.00, 4.12, 0.05),
(22, '2014-02-10', 'ADVANCING', 'Carreras Limited', 65939.00, 34.34, 0.22),
(23, '2014-02-10', 'ADVANCING', 'Jamaica Broilers Ltd.', 51214.00, 4.93, 0.13),
(24, '2014-02-10', 'ADVANCING', 'Mayberry Investments Ltd', 2000.00, 2.00, 0.10),
(25, '2014-02-10', 'ADVANCING', 'Sagicor Real Estate X Fund Limited', 8700.00, 7.12, 0.13),
(26, '2014-02-10', 'ADVANCING', 'Scotia Group Jamaica', 59150.00, 21.16, 0.15),
(27, '2014-02-10', 'ADVANCING', 'Seprod Limited', 15000.00, 11.00, 0.10),
(28, '2014-02-10', 'DECLINING', 'Barita Investments Limited', 3000.00, 2.50, -0.10),
(29, '2014-02-10', 'DECLINING', 'Jamaica Money Market Brokers Limited 8.75%', 10000.00, 3.00, -0.03),
(30, '2014-02-10', 'DECLINING', 'Jamaica Money Market Brokers Ltd.', 1150.00, 7.46, -0.02),
(31, '2014-02-10', 'DECLINING', 'Sagicor Group Jamaica Limited', 25491.00, 9.11, -0.39),
(32, '2014-02-10', 'DECLINING', 'Scotia Investments Jamaica Ltd.', 1693.00, 24.50, -2.00),
(33, '2014-02-10', 'DECLINING', 'Supreme Ventures Limited', 13800.00, 2.40, -0.03),
(34, '2014-02-10', 'TRADING_FIRM', 'Berger Paints Ltd.', 166803.00, 1.75, 0.00),
(35, '2014-02-10', 'TRADING_FIRM', 'GraceKennedy Ltd.', 454405.00, 55.00, 0.00),
(36, '2014-02-10', 'TRADING_FIRM', 'Jamaica Money Market Brokers Limited 7.25%', 1000.00, 2.50, 0.00),
(37, '2014-02-10', 'TRADING_FIRM', 'Jamaica Producers Group Ltd.', 128000.00, 18.75, 0.00),
(38, '2014-02-10', 'TRADING_FIRM', 'Kingston Wharves Ltd.', 22753.00, 6.00, 0.00),
(39, '2014-02-10', 'TRADING_FIRM', 'LIME', 403970.00, 0.30, 0.00),
(40, '2014-02-10', 'TRADING_FIRM', 'National Commercial Bank of Jamaica Ltd.', 303100.00, 18.00, 0.00),
(41, '2014-02-10', 'TRADING_FIRM', 'Radio Jamaica Ltd.', 6245.00, 1.60, 0.00),
(42, '2014-02-07', 'ADVANCING', 'Carreras Limited', 16350.00, 34.12, 0.12),
(43, '2014-02-07', 'ADVANCING', 'First Caribbean International Bank', 13982.00, 81.00, 1.00),
(44, '2014-02-07', 'ADVANCING', 'Jamaica Broilers Ltd.', 66146.00, 4.80, 0.02),
(45, '2014-02-07', 'ADVANCING', 'National Commercial Bank of Jamaica Ltd.', 45270.00, 18.00, 0.11),
(46, '2014-02-07', 'ADVANCING', 'Sagicor Real Estate X Fund Limited', 25000.00, 6.99, 0.18),
(47, '2014-02-07', 'ADVANCING', 'Scotia Investments Jamaica Ltd.', 2000.00, 26.50, 2.94),
(48, '2014-02-07', 'DECLINING', 'Caribbean Cement Company Ltd.', 283035.00, 4.07, -0.01),
(49, '2014-02-07', 'DECLINING', 'Gleaner Company', 55000.00, 1.11, -0.04),
(50, '2014-02-07', 'DECLINING', 'GraceKennedy Ltd.', 303243.00, 55.00, -0.20),
(51, '2014-02-07', 'DECLINING', 'Jamaica Money Market Brokers Limited 8.75%', 3019532.00, 3.03, -0.02),
(52, '2014-02-07', 'DECLINING', 'LIME', 1210000.00, 0.30, -0.02),
(53, '2014-02-07', 'DECLINING', 'Scotia Group Jamaica', 116884.00, 21.01, -0.24),
(54, '2014-02-07', 'TRADING_FIRM', 'Desnoes and Geddes Ltd.', 15000.00, 5.00, 0.00),
(55, '2014-02-07', 'TRADING_FIRM', 'Jamaica Money Market Brokers Ltd.', 6703295.00, 7.48, 0.00),
(56, '2014-02-07', 'TRADING_FIRM', 'Sagicor Group Jamaica Limited', 13468.00, 9.50, 0.00),
(57, '2014-02-12', 'ADVANCING', 'Caribbean Cement Company Ltd.', 536064.00, 4.53, 0.41),
(58, '2014-02-12', 'ADVANCING', 'Carreras Limited', 66036.00, 35.00, 0.66),
(59, '2014-02-12', 'ADVANCING', 'Gleaner Company', 5000.00, 1.15, 0.04),
(60, '2014-02-12', 'ADVANCING', 'LIME', 25016488.00, 0.33, 0.03),
(61, '2014-02-12', 'ADVANCING', 'National Commercial Bank of Jamaica Ltd.', 16417.00, 18.08, 0.08),
(62, '2014-02-12', 'ADVANCING', 'Sagicor Group Jamaica Limited', 18774.00, 9.19, 0.08),
(63, '2014-02-12', 'ADVANCING', 'Scotia Investments Jamaica Ltd.', 3136.00, 25.78, 1.28),
(64, '2014-02-12', 'DECLINING', 'First Caribbean International Bank', 800.00, 80.78, -0.22),
(65, '2014-02-12', 'DECLINING', 'Jamaica Broilers Ltd.', 1000.00, 4.86, -0.07),
(66, '2014-02-12', 'DECLINING', 'Jamaica Money Market Brokers Ltd.', 122797.00, 7.40, -0.06),
(67, '2014-02-12', 'DECLINING', 'Mayberry Investments Ltd', 8000.00, 1.91, -0.09),
(68, '2014-02-12', 'DECLINING', 'Sagicor Investments Jamaica Limited', 1000.00, 18.00, -1.33),
(69, '2014-02-12', 'DECLINING', 'Sagicor Real Estate X Fund Limited', 14605.00, 7.06, -0.06),
(70, '2014-02-12', 'DECLINING', 'Scotia Group Jamaica', 1084114.00, 21.00, -0.16),
(71, '2014-02-12', 'DECLINING', 'Supreme Ventures Limited', 48700.00, 2.39, -0.01),
(72, '2014-02-12', 'TRADING_FIRM', 'Berger Paints Ltd.', 1000.00, 1.75, 0.00),
(73, '2014-02-12', 'TRADING_FIRM', 'Ciboney Group Ltd.', 557600.00, 0.10, 0.00),
(74, '2014-02-12', 'TRADING_FIRM', 'Desnoes and Geddes Ltd.', 429937.00, 5.00, 0.00),
(75, '2014-02-12', 'TRADING_FIRM', 'GraceKennedy Ltd.', 990.00, 55.00, 0.00),
(76, '2014-02-12', 'TRADING_FIRM', 'Jamaica Money Market Brokers Limited 8.75%', 6000.00, 3.00, 0.00),
(77, '2014-02-12', 'TRADING_FIRM', 'Kingston Wharves Ltd.', 10805.00, 6.00, 0.00),
(78, '2014-02-12', 'TRADING_FIRM', 'Seprod Limited', 500.00, 11.00, 0.00),
(79, '2014-02-11', 'ADVANCING', 'Caribbean Cement Company Ltd.', 536064.00, 4.53, 0.41),
(80, '2014-02-11', 'ADVANCING', 'Carreras Limited', 66036.00, 35.00, 0.66),
(81, '2014-02-11', 'ADVANCING', 'Gleaner Company', 5000.00, 1.15, 0.04),
(82, '2014-02-11', 'ADVANCING', 'LIME', 25016488.00, 0.33, 0.03),
(83, '2014-02-11', 'ADVANCING', 'National Commercial Bank of Jamaica Ltd.', 16417.00, 18.08, 0.08),
(84, '2014-02-11', 'ADVANCING', 'Sagicor Group Jamaica Limited', 18774.00, 9.19, 0.08),
(85, '2014-02-11', 'ADVANCING', 'Scotia Investments Jamaica Ltd.', 3136.00, 25.78, 1.28),
(86, '2014-02-11', 'DECLINING', 'First Caribbean International Bank', 800.00, 80.78, -0.22),
(87, '2014-02-11', 'DECLINING', 'Jamaica Broilers Ltd.', 1000.00, 4.86, -0.07),
(88, '2014-02-11', 'DECLINING', 'Jamaica Money Market Brokers Ltd.', 122797.00, 7.40, -0.06),
(89, '2014-02-11', 'DECLINING', 'Mayberry Investments Ltd', 8000.00, 1.91, -0.09),
(90, '2014-02-11', 'DECLINING', 'Sagicor Investments Jamaica Limited', 1000.00, 18.00, -1.33),
(91, '2014-02-11', 'DECLINING', 'Sagicor Real Estate X Fund Limited', 14605.00, 7.06, -0.06),
(92, '2014-02-11', 'DECLINING', 'Scotia Group Jamaica', 1084114.00, 21.00, -0.16),
(93, '2014-02-11', 'DECLINING', 'Supreme Ventures Limited', 48700.00, 2.39, -0.01),
(94, '2014-02-11', 'TRADING_FIRM', 'Berger Paints Ltd.', 1000.00, 1.75, 0.00),
(95, '2014-02-11', 'TRADING_FIRM', 'Ciboney Group Ltd.', 557600.00, 0.10, 0.00),
(96, '2014-02-11', 'TRADING_FIRM', 'Desnoes and Geddes Ltd.', 429937.00, 5.00, 0.00),
(97, '2014-02-11', 'TRADING_FIRM', 'GraceKennedy Ltd.', 990.00, 55.00, 0.00),
(98, '2014-02-11', 'TRADING_FIRM', 'Jamaica Money Market Brokers Limited 8.75%', 6000.00, 3.00, 0.00),
(99, '2014-02-11', 'TRADING_FIRM', 'Kingston Wharves Ltd.', 10805.00, 6.00, 0.00),
(100, '2014-02-11', 'TRADING_FIRM', 'Seprod Limited', 500.00, 11.00, 0.00),
(101, '2014-02-13', 'ADVANCING', 'Berger Paints Ltd.', 9000.00, 1.85, 0.10),
(102, '2014-02-13', 'ADVANCING', 'Caribbean Cement Company Ltd.', 34050.00, 4.97, 0.07),
(103, '2014-02-13', 'ADVANCING', 'Carreras Limited', 147717.00, 35.72, 1.07),
(104, '2014-02-13', 'ADVANCING', 'Hardware & Lumber', 1750.00, 8.10, 0.02),
(105, '2014-02-13', 'ADVANCING', 'Sagicor Group Jamaica Limited', 13652.00, 9.04, 0.01),
(106, '2014-02-13', 'DECLINING', 'Desnoes and Geddes Ltd.', 16000.00, 5.00, -0.09),
(107, '2014-02-13', 'DECLINING', 'Jamaica Broilers Ltd.', 28548.00, 4.81, -0.02),
(108, '2014-02-13', 'DECLINING', 'LIME', 5994372.00, 0.33, -0.02),
(109, '2014-02-13', 'DECLINING', 'Scotia Group Jamaica', 67810.00, 20.94, -0.09),
(110, '2014-02-13', 'TRADING_FIRM', 'Jamaica Money Market Brokers Limited 8.75%', 68680.00, 3.00, 0.00),
(111, '2014-02-13', 'TRADING_FIRM', 'Jamaica Money Market Brokers Ltd.', 72500.00, 7.25, 0.00),
(112, '2014-02-13', 'TRADING_FIRM', 'Kingston Wharves Ltd.', 1719.00, 6.00, 0.00),
(113, '2014-02-13', 'TRADING_FIRM', 'Sagicor Real Estate X Fund Limited', 1500.00, 7.10, 0.00),
(114, '2014-02-14', 'ADVANCING', 'Jamaica Broilers Ltd.', 14930.00, 4.83, 0.02),
(115, '2014-02-14', 'ADVANCING', 'Jamaica Money Market Brokers Ltd.', 12250.00, 7.29, 0.04),
(116, '2014-02-14', 'ADVANCING', 'Kingston Wharves Ltd.', 161362.00, 6.06, 0.06),
(117, '2014-02-14', 'ADVANCING', 'National Commercial Bank of Jamaica Ltd.', 498100.00, 18.50, 0.51),
(118, '2014-02-14', 'ADVANCING', 'Sagicor Group Jamaica Limited', 1650.00, 9.50, 0.46),
(119, '2014-02-14', 'ADVANCING', 'Salada Foods Jamaica Limited', 2000.00, 9.01, 0.01),
(120, '2014-02-14', 'ADVANCING', 'Scotia Group Jamaica', 98800.00, 21.01, 0.07),
(121, '2014-02-14', 'DECLINING', 'Carreras Limited', 242950.00, 35.00, -0.72),
(122, '2014-02-14', 'DECLINING', 'GraceKennedy Ltd.', 1715.00, 55.03, -0.07),
(123, '2014-02-14', 'DECLINING', 'Jamaica Producers Group Ltd.', 3865.00, 18.22, -0.53),
(124, '2014-02-14', 'DECLINING', 'Kingston Properties Limited', 20469.00, 4.00, -0.50),
(125, '2014-02-14', 'DECLINING', 'Mayberry Investments Ltd', 53710.00, 1.85, -0.10),
(126, '2014-02-14', 'DECLINING', 'Seprod Limited', 5000.00, 10.99, -0.01),
(127, '2014-02-14', 'DECLINING', 'Supreme Ventures Limited', 561690.00, 2.35, -0.04),
(128, '2014-02-14', 'TRADING_FIRM', 'Berger Paints Ltd.', 13790.00, 1.85, 0.00),
(129, '2014-02-14', 'TRADING_FIRM', 'Caribbean Cement Company Ltd.', 116945.00, 4.97, 0.00),
(130, '2014-02-14', 'TRADING_FIRM', 'Jamaica Money Market Brokers Limited 7.50%', 50000.00, 2.00, 0.00),
(131, '2014-02-14', 'TRADING_FIRM', 'Jamaica Money Market Brokers Limited 8.75%', 61000.00, 3.00, 0.00),
(132, '2014-02-14', 'TRADING_FIRM', 'LIME', 50000.00, 0.33, 0.00),
(133, '2014-02-14', 'TRADING_FIRM', 'Sagicor Real Estate X Fund Limited', 6564.00, 7.10, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `daily_summary_master`
--

CREATE TABLE IF NOT EXISTS `daily_summary_master` (
  `summary_date` date NOT NULL,
  `cache_date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `summary1` varchar(512) DEFAULT NULL,
  `summary2` varchar(512) DEFAULT NULL,
  `summary_list` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`summary_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_summary_master`
--

INSERT INTO `daily_summary_master` (`summary_date`, `cache_date`, `status`, `summary1`, `summary2`, `summary_list`) VALUES
('2014-01-23', '2014-01-26 00:42:36', 'COMPLETE', 'Overall Market activity resulted from trading in 20 \r\n  stocks of which 6 advanced, 8 \r\n  declined and\r\n  6 traded firm.', 'Market volume amounted to 2,738,342 \r\n   units valued at over $17,705,312. Mayberry Investments Ltd \r\n  was the volume leader with 1,223,442 units (44.68%) \r\n  followed by Berger Paints Ltd. with 445,725 \r\n  units (16.28%) and Jamaica Money Market Brokers Limited 8.75% \r\n  with 350,500 units (12.80%).', '["The JSE Market Index declined by 402.47 points (0.50%) to close at 79,771.25.","The JSE Select Index declined by 22.44 points (1.00%) to close at 2,228.50.","The JSE All Jamaican Composite declined by 610.49 points (0.74%) to close at 81,413.32.","The JSE Cross Listed Index  by 0.00 points (0.00%) to close at 724.34.","The JSE Junior Market Index declined by 10.72 points (1.36%) to close at 775.31.","The JSE Combined Index declined by 461.13 points (0.56%) to close at 82,217.98.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 95.00."]'),
('2014-02-07', '2014-02-10 20:07:18', 'COMPLETE', 'Overall Market activity resulted from trading in 15 \r\n  stocks of which 6 advanced, 6 \r\n  declined and\r\n  3 traded firm.', 'Market volume amounted to 11,888,205 \r\n   units valued at over $83,239,081. Jamaica Money Market Brokers Ltd. \r\n  was the volume leader with 6,703,295 units (56.39%) \r\n  followed by Jamaica Money Market Brokers Limited 8.75% with 3,019,532 \r\n  units (25.40%) and LIME \r\n  with 1,210,000 units (10.18%).', '["The JSE Market Index advanced by 441.74 points (0.56%) to close at 79,435.22.","The JSE Select Index declined by 7.33 points (0.33%) to close at 2,244.11.","The JSE All Jamaican Composite advanced by 234.44 points (0.28%) to close at 83,953.11.","The JSE Cross Listed Index advanced by 7.97 points (1.21%) to close at 668.55.","The JSE Junior Market Index advanced by 0.81 points (0.11%) to close at 755.66.","The JSE Combined Index advanced by 431.63 points (0.53%) to close at 81,760.21.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 128.57."]'),
('2014-02-10', '2014-02-10 20:02:37', 'COMPLETE', 'Overall Market activity resulted from trading in 21 \r\n  stocks of which 7 advanced, 6 \r\n  declined and\r\n  8 traded firm.', 'Market volume amounted to 1,750,663 \r\n   units valued at over $37,793,345. GraceKennedy Ltd. \r\n  was the volume leader with 454,405 units (25.96%) \r\n  followed by LIME with 403,970 \r\n  units (23.08%) and National Commercial Bank of Jamaica Ltd. \r\n  with 303,100 units (17.31%).', '["The JSE Market Index declined by 250.68 points (0.32%) to close at 79,184.54.","The JSE Select Index advanced by 6.54 points (0.29%) to close at 2,250.65.","The JSE All Jamaican Composite declined by 380.26 points (0.45%) to close at 83,572.85.","The JSE Cross Listed Index  by 0.00 points (0.00%) to close at 668.55.","The JSE Junior Market Index declined by 6.62 points (0.88%) to close at 749.04.","The JSE Combined Index declined by 286.82 points (0.35%) to close at 81,473.39.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 128.57."]'),
('2014-02-11', '2014-02-12 23:55:44', 'COMPLETE', 'Overall Market activity resulted from trading in 22 \r\n  stocks of which 7 advanced, 8 \r\n  declined and\r\n  7 traded firm.', 'Market volume amounted to 27,949,763 \r\n   units valued at over $39,884,294. LIME \r\n  was the volume leader with 25,016,488 units (89.51%) \r\n  followed by Scotia Group Jamaica with 1,084,114 \r\n  units (3.88%) and Ciboney Group Ltd. \r\n  with 557,600 units (2.00%).', '["The JSE Market Index advanced by 8.97 points (0.01%) to close at 79,193.51.","The JSE Select Index advanced by 4.59 points (0.20%) to close at 2,255.24.","The JSE All Jamaican Composite advanced by 109.45 points (0.13%) to close at 83,682.30.","The JSE Cross Listed Index declined by 1.75 points (0.26%) to close at 666.80.","The JSE Junior Market Index advanced by 10.91 points (1.46%) to close at 759.95.","The JSE Combined Index advanced by 82.86 points (0.10%) to close at 81,556.25.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 128.57."]'),
('2014-02-12', '2014-02-12 00:02:25', 'COMPLETE', 'Overall Market activity resulted from trading in 22 \r\n  stocks of which 7 advanced, 8 \r\n  declined and\r\n  7 traded firm.', 'Market volume amounted to 27,949,763 \r\n   units valued at over $39,884,294. LIME \r\n  was the volume leader with 25,016,488 units (89.51%) \r\n  followed by Scotia Group Jamaica with 1,084,114 \r\n  units (3.88%) and Ciboney Group Ltd. \r\n  with 557,600 units (2.00%).', '["The JSE Market Index advanced by 8.97 points (0.01%) to close at 79,193.51.","The JSE Select Index advanced by 4.59 points (0.20%) to close at 2,255.24.","The JSE All Jamaican Composite advanced by 109.45 points (0.13%) to close at 83,682.30.","The JSE Cross Listed Index declined by 1.75 points (0.26%) to close at 666.80.","The JSE Junior Market Index advanced by 10.91 points (1.46%) to close at 759.95.","The JSE Combined Index advanced by 82.86 points (0.10%) to close at 81,556.25.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 128.57."]'),
('2014-02-13', '2014-02-13 21:23:02', 'COMPLETE', 'Overall Market activity resulted from trading in 13 \r\n  stocks of which 5 advanced, 4 \r\n  declined and\r\n  4 traded firm.', 'Market volume amounted to 6,457,298 \r\n   units valued at over $9,962,891. LIME \r\n  was the volume leader with 5,994,372 units (92.83%) \r\n  followed by Carreras Limited with 147,717 \r\n  units (2.29%) and Jamaica Money Market Brokers Ltd. \r\n  with 72,500 units (1.12%).', '["The JSE Market Index declined by 17.51 points (0.02%) to close at 79,116.25.","The JSE Select Index declined by 1.51 points (0.07%) to close at 2,253.54.","The JSE All Jamaican Composite declined by 26.55 points (0.03%) to close at 83,565.10.","The JSE Cross Listed Index  by 0.00 points (0.00%) to close at 666.80.","The JSE Junior Market Index advanced by 0.84 points (0.11%) to close at 762.80.","The JSE Combined Index declined by 11.13 points (0.01%) to close at 81,501.11.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 128.57."]'),
('2014-02-14', '2014-02-14 20:39:18', 'COMPLETE', 'Overall Market activity resulted from trading in 20 \r\n  stocks of which 7 advanced, 7 \r\n  declined and\r\n  6 traded firm.', 'Market volume amounted to 1,976,790 \r\n   units valued at over $23,641,122. Supreme Ventures Limited \r\n  was the volume leader with 561,690 units (28.41%) \r\n  followed by National Commercial Bank of Jamaica Ltd. with 498,100 \r\n  units (25.20%) and Carreras Limited \r\n  with 242,950 units (12.29%).', '["The JSE Market Index advanced by 498.04 points (0.63%) to close at 79,614.29.","The JSE Select Index advanced by 12.03 points (0.53%) to close at 2,265.57.","The JSE All Jamaican Composite advanced by 755.48 points (0.90%) to close at 84,320.58.","The JSE Cross Listed Index  by 0.00 points (0.00%) to close at 666.80.","The JSE Junior Market Index advanced by 3.33 points (0.44%) to close at 766.13.","The JSE Combined Index advanced by 503.00 points (0.62%) to close at 82,004.11.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 128.57."]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
