package ADM1_P
  
  record StateVariablesADM1_bio
    //Biomass
    Modelica.SIunits.MassConcentration X_su(fixed = true, start = 1.60571) "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_aa(fixed = true, start = 0.541365) "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_fa(fixed = true, start = 0.213571) "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_c4(fixed = true, start = 0.412867) "C4 degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_pro(fixed = true, start = 0.248744) "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_ac(fixed = true, start = 1.01593) "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_h2(fixed = true, start = 0.463351) "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
    //Particulate substrate
    Modelica.SIunits.MassConcentration X_c(fixed = true, start = 0.0) "Complex particulate concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_i(fixed = true, start = 45.1488) "Particulate inerts concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_ch(fixed = true, start = 1.09422) "Particulate carbohydrates concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_pr(fixed = true, start = 0.890377) "Particulate proteins concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_li(fixed = true, start = 0.325233) "Particulate lipids concentration in digestate [kgCOD/m3]";
    //Soluble substrate
    Modelica.SIunits.MassConcentration S_i(fixed = true, start = 2.06057e-08) "Soluble inerts concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_su(fixed = true, start = 0.0216284) "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_aa(fixed = true, start = 0.0545847) "Soluble amino acids concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_fa(fixed = true, start = 0.0414486) "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_va(fixed = true, start = 0.00201259) "Valeric acid concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_bu(fixed = true, start = 0.0031565) "Butyric concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_pro(fixed = true, start = 0.0156237) "Propionic acid concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_ac(fixed = true, start = 0.880519) "Acetic acid concentration in digestate [kgCOD/m3]";
    //Inorganic soluble components
    Modelica.SIunits.MassConcentration S_h2(fixed = true, start = 4.11532e-07) "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_ch4(fixed = true, start = 0.0474429) "Soluble methane concentration in digestate [kgCOD/m3]";
    Types.MolarDensity_M S_ic(fixed = true, start = 0.332713) "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_in(fixed = true, start = 0.242044) "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ip(fixed = true, start = 0.00659511,nominal = 1e-3) "8/10";
    //Inflow
    Modelica.SIunits.MassConcentration X_su_in(fixed = false, start = 0.171844477851955) "Monosaccharide degrading organisms concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_aa_in(fixed = false, start = 0.61923061050481) "Amino Acid degrading organisms concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_fa_in(fixed = false, start = 0.176756083950276) "Long chain fatty acid degrading organisms concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_c4_in(fixed = false, start = 0.236115793848027) "C4 degrading organisms concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_pro_in(fixed = false, start = 0.0707860907968375) "Propionate degrading organisms concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_ac_in(fixed = false, start = 0.44625608307655) "Acetate degrading organisms concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_h2_in(fixed = false, start = 0.21027420887601) "Hydrogen degrading organisms concentration in the feeding [kgCOD/m3]"; 
    Modelica.SIunits.MassConcentration X_c_in(fixed = false, start = 0.188523943307974) "Complex particulate concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_i_in(fixed = false, start = 8.82083748012884) "Particulate inerts concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_ch_in(fixed = false, start = 0.493907425992654) "Particulate carbohydrates concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_pr_in(fixed = false, start = 1.12771809418909) "Particulate proteins concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_li_in(fixed = false, start = 0.965732116587352) "Particulate lipids concentration in the feeding [kgCOD/m3]"; 
    Modelica.SIunits.MassConcentration S_i_in(fixed = false, start = 8.95946506102146e-07) "Soluble inerts concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_su_in(fixed = false, start = 0.0430230761137466) "Soluble monosaccharides concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_aa_in(fixed = false, start = 0.046267901457183) "Soluble amino acids concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_fa_in(fixed = false, start = 0.078270201571595) "Soluble long chain fatty acids  concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_va_in(fixed = false, start = 0) "Valeric acid concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_bu_in(fixed = false, start = 0.0223872727272727) "Butyric concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_pro_in(fixed = false, start = 0.0672) "Propionic acid concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_ac_in(fixed = false, start = 0.0674112) "Acetic acid concentration in the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_h2_in(fixed = false, start = 9.71595541886631e-07) "Soluble hydrogen concentration in   the feeding [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_ch4_in(fixed = false, start = 0.035718304294732) "Soluble methane concentration in the feeding [kgCOD/m3]";
    Types.MolarDensity_M S_ic_in(fixed = false, start = 0.103271599042417 * 1000) "Soluble inorganic carbon concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_in_in(fixed = false, start = 0.0404285714285714 * 1000) "Soluble inorganic nitrogen concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_ip_in(fixed = false, start = 0.0404285714285714 * 1000) "Soluble inorganic phosphorous concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_cat_in(fixed = false, start = 0.0708801468406167 * 1000) "Soluble cationic ion concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_ca_in(fixed = false, start = 0.0708801468406167 * 1000) "Soluble calcium ion concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_mg_in(fixed = false, start = 0.0708801468406167 * 1000) "Soluble magnesium ion concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_an_in(fixed = false, start = 0.020 * 1000) "Soluble anionic ions concentration in the feedinge [kmol/m3]";  
//Gas components
    Modelica.SIunits.MassConcentration S_gas_h2(fixed = false, start = 1.88676e-05);
    Modelica.SIunits.MassConcentration S_gas_ch4(fixed = true, start = 1.48839);
    Types.MolarDensity_M S_gas_co2(fixed = true, start = 0.0144672);
    Types.Pressure_bar p_gas_h2(fixed = false, start = 1.5e-05);
    Types.Pressure_bar  p_gas_ch4(fixed = false, start = 0.582185);
    Types.Pressure_bar  p_gas_co2(fixed = false, start = 0.382985);
    //Other variables
    //Real P_gas(fixed = true, start = 1.014);
    Real Q_gas(fixed = false, start = 1e-16);
    Real Q_gas_N(fixed = false, start = 0);
    Real CH4_cum(fixed = true, start = 0);
    //Temperature dependant parameters
    Real k_hyd_ch1_T;
    Real k_hyd_pr1_T;
    Real k_hyd_li1_T;
    Real k_hyd_ch2_T;
    Real k_hyd_pr2_T;
    Real k_hyd_li2_T;
    Real k_hyd_ch3_T;
    Real k_hyd_pr3_T;
    Real k_hyd_li3_T;
    Real k_m_su_T;
    Real k_m_aa_T;
    Real k_m_fa_T;
    Real k_m_pro_T;
    //Real k_m_c4_T; not found
    Real k_m_ac_T;
    Real k_m_h2_T;
    Real Ks_su_T;
    Real Ks_aa_T;
    Real Ks_fa_T;
    Real Ks_pro_T;
    //Real Ks_c4_T; not found
    Real Ks_ac_T;
    Real Ks_h2_T;
    Real k_dec_su_T;
    Real k_dec_aa_T;
    Real k_dec_fa_T;
    Real k_dec_pro_T;
    //Real k_dec_c4_T; not found
    Real k_dec_ac_T;
    Real k_dec_h2_T;
    Real KH_ch4(fixed = false, start = 0.00116);
    Real KH_co2(fixed = false, start = 0.0271);
    Real KH_h2(fixed = false, start = 7.38e-4);
    Real p_gas_h2o(fixed = false, start = 0.0557);
    // Inorganic carbon coefficients on processes
    Real v1;
    Real v2;
    Real v3;
    Real v4;
    Real v5;
    Real v6;
    Real v7;
    Real v8;
    Real v9;
    Real v10;
    Real v11;
    Real v12;
    Real v13;
    //Process rates
    Real r1(fixed = false, start = 0);
    Real r2_1(fixed = false, start = 0);
    Real r2_2(fixed = false, start = 0);
    Real r2_3(fixed = false, start = 0);
    Real r3_1(fixed = false, start = 0);
    Real r3_2(fixed = false, start = 0);
    Real r3_3(fixed = false, start = 0);
    Real r4_1(fixed = false, start = 0);
    Real r4_2(fixed = false, start = 0);
    Real r4_3(fixed = false, start = 0);
    Real r5(fixed = false, start = 0);
    Real r6(fixed = false, start = 0);
    Real r7(fixed = false, start = 0);
    Real r8(fixed = false, start = 0);
    Real r9(fixed = false, start = 0);
    Real r10(fixed = false, start = 0);
    Real r11(fixed = false, start = 0);
    Real r12(fixed = false, start = 0);
    Real r13(fixed = false, start = 0);
    Real r14(fixed = false, start = 0);
    Real r15(fixed = false, start = 0);
    Real r16(fixed = false, start = 0);
    Real r17(fixed = false, start = 0);
    Real r18(fixed = false, start = 0);
    Real r19(fixed = false, start = 0);
    Real rt8(fixed = false, start = 0);
    Real rt9(fixed = false, start = 0);
    Real rt10(fixed = false, start = 0);
    // Process inhibition
    Real I_5(fixed = false, start = 1);
    Real I_6(fixed = false, start = 1);
    Real I_7(fixed = false, start = 1);
    Real I_8(fixed = false, start = 1);
    Real I_9(fixed = false, start = 1);
    Real I_10(fixed = false, start = 1);
    Real I_11(fixed = false, start = 1);
    Real I_12(fixed = false, start = 1);
    Real I_pH_aa(fixed = false, start = 1);
    Real I_pH_ac(fixed = false, start = 1);
    Real I_pH_h2(fixed = false, start = 1);
    Real I_in_lim(fixed = false, start = 1);
    Real I_ip_lim(fixed = false, start = 1);
    Real I_h2_fa(fixed = false, start = 1);
    Real I_h2_c4(fixed = false, start = 1);
    Real I_h2_pro(fixed = false, start = 1);
    Real I_nh3(fixed = false, start = 1);
    //Co-digestion fractions
    Real f_ch1;
    Real f_ch2;
    Real f_ch3;
    Real f_pr1;
    Real f_pr2;
    Real f_pr3;
    Real f_li1;
    Real f_li2;
    Real f_li3;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_bio;
  record ParametersADM1_operational
    parameter Modelica.SIunits.Volume V_liq = 3350*4 "Single Digester usefull working volume [m3]";
    parameter Modelica.SIunits.Volume V_liq2 = 743 "Post-fermenter usefull working volume [m3]";
    parameter Modelica.SIunits.Volume V_gas = (26^2*7*3.14/4)*4-V_liq "Single Digester headspace as A*H-usefull working volume [m3]";
    parameter Modelica.SIunits.Volume V_gas2 = V_liq2 * 0.8 "Post-fermenter headspace [m3]";
    constant Real R(unit = "bar/(kmol/m3)/K") = 0.083145 "Gas law constant";
    parameter Modelica.SIunits.Temperature T0 = 298.15 "Reference temperature for normal conditions";
    parameter Modelica.SIunits.Temperature T_ref = 298.15 "Reference temperature for pKa and enthalpy values";
    parameter Modelica.SIunits.Temperature T_ref_k = 308.15 "Reference temperature for kinetic parameters";
    parameter Modelica.SIunits.Temperature T_op_mean = 315.15 "Mean operative temperature";
    parameter Modelica.SIunits.Conversions.NonSIunits.Pressure_bar P_atm = 1.013 "Pressure of atmosphere [bar]";
    parameter Types.Kinetic_d kla = 200 "Volume-specific liquid-gas transfer coefficient [1/d]";
    annotation(
      Documentation(info = "<html><p> This record contains the operational parameters and constants of the digester. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_operational;

  record ParametersADM1_conversion
    constant Real Ac_conv(unit = "kgCOD/kmol") = 64;
    constant Real Pro_conv(unit = "kgCOD/kmol") = 112;
    constant Real Bu_conv(unit = "kgCOD/kmol") = 160;
    constant Real Va_conv(unit = "kgCOD/kmol") = 208;
    constant Real ch4_conv(unit = "kgCOD/kmol") = 64;
    constant Real h2_conv(unit = "kgCOD/kmol") = 16;
    parameter Real COD_newbio(unit = "kgCOD/kgCOD") = 0.08 "percentage of COD resulting in new biomass during BMP tests";
    //Composition of feeding substrates
    parameter Real Feed1_aggr(unit = "kgCOD/kgCOD") = 0.10 "percentage of sludge entering the digester in the aggregated form, X_c";
    Real Feed1_dis(unit = "kgCOD/kgCOD") = 1 - Feed1_aggr "Percentage of sludge entering the digester already disintegrated into X_ch, X_pr, X_li, X_i, S_i";
    parameter Real Feed2_aggr(unit = "kgCOD/kgCOD") = 0 "Percentage of yogurt entering the digester in the aggregated form, X_c";
    Real Feed2_dis(unit = "kgCOD/kgCOD") = 1 - Feed2_aggr "Percentage of yogurt entering the digester already disintegrated into X_ch, X_pr, X_li, X_i, S_i";
    parameter Real S_an_input1(unit = "mol/L") = 0.02;
    parameter Real S_h2_input1(unit = "gCOD/L") = 1e-8;
    parameter Real S_ch4_input1(unit = "gCOD/L") = 1e-5;
    parameter Real S_su_input1(unit = "gCOD/L") = 0;
    parameter Real S_aa_input1(unit = "gCOD/L") = 0;
    parameter Real S_fa_input1(unit = "gCOD/L") = 0;
    parameter Real S_i_input1(unit = "gCOD/L") = 0;
    parameter Real X_su_input1(unit = "gCOD/L") = 0;
    parameter Real X_aa_input1(unit = "gCOD/L") = 0;
    parameter Real X_fa_input1(unit = "gCOD/L") = 0;
    parameter Real X_c4_input1(unit = "gCOD/L") = 0;
    parameter Real X_pro_input1(unit = "gCOD/L") = 0;
    parameter Real X_ac_input1(unit = "gCOD/L") = 0;
    parameter Real X_h2_input1(unit = "gCOD/L") = 0;
    parameter Real S_an_input2(unit = "mol/L") = 0.02;
    parameter Real S_h2_input2(unit = "gCOD/L") = 1e-8;
    parameter Real S_ch4_input2(unit = "gCOD/L") = 1e-5;
    //  parameter Real S_su_input2(unit = "gCOD/L") = 0;
    //  parameter Real S_aa_input2(unit = "gCOD/L") = 0;
    //  parameter Real S_fa_input2(unit = "gCOD/L") = 0;
    parameter Real S_i_input2(unit = "gCOD/L") = 0;
    parameter Real X_su_input2(unit = "gCOD/L") = 0;
    parameter Real X_aa_input2(unit = "gCOD/L") = 0;
    parameter Real X_fa_input2(unit = "gCOD/L") = 0;
    parameter Real X_c4_input2(unit = "gCOD/L") = 0;
    parameter Real X_pro_input2(unit = "gCOD/L") = 0;
    parameter Real X_ac_input2(unit = "gCOD/L") = 0;
    parameter Real X_h2_input2(unit = "gCOD/L") = 0;
    parameter Real S_an_input3(unit = "mol/L") = 0.02;
    parameter Real S_h2_input3(unit = "gCOD/L") = 1e-8;
    parameter Real S_ch4_input3(unit = "gCOD/L") = 1e-5;
    parameter Real S_su_input3(unit = "gCOD/L") = 0;
    parameter Real S_aa_input3(unit = "gCOD/L") = 0;
    parameter Real S_fa_input3(unit = "gCOD/L") = 0;
    parameter Real S_i_input3(unit = "gCOD/L") = 0;
    parameter Real X_su_input3(unit = "gCOD/L") = 0;
    parameter Real X_aa_input3(unit = "gCOD/L") = 0;
    parameter Real X_fa_input3(unit = "gCOD/L") = 0;
    parameter Real X_c4_input3(unit = "gCOD/L") = 0;
    parameter Real X_pro_input3(unit = "gCOD/L") = 0;
    parameter Real X_ac_input3(unit = "gCOD/L") = 0;
    parameter Real X_h2_input3(unit = "gCOD/L") = 0;
    //Composition of digestate
    parameter Real complexpart_CH(unit = "kgCOD/kgCOD") = 0.645 "Carbohydrates content in Xc";
    parameter Real complexpart_PR(unit = "kgCOD/kgCOD") = 0.35 "Proteins content in Xc";
    Real complexpart_LI(unit = "kgCOD/kgCOD") = 1 - complexpart_CH - complexpart_PR "Lipids content in Xc";
    parameter Real f_Xi_ch(unit = "kgCOD/kgCOD") = 0.60 "fraction of carbohydrates in Xi";
    parameter Real f_Xi_pr(unit = "kgCOD/kgCOD") = 0.40 "fraction of proteins Xi";
    Real f_Xi_li(unit = "kgCOD/kgCOD") = 1 - f_Xi_ch - f_Xi_pr "fraction of lipids in Xi";
    parameter Real f_Si_ch(unit = "kgCOD/kgCOD") = 0.6 "fraction of carbohydrates in Si";
    parameter Real f_Si_pr(unit = "kgCOD/kgCOD") = 0.4 "fraction of proteins Si";
    Real f_Si_li(unit = "kgCOD/kgCOD") = 1 - f_Si_ch - f_Si_pr "fraction of lipids in Si";
    parameter Real f_Xbiom_ch(unit = "kgCOD/kgCOD") = 0.195 "Carbohydrates content in biomass";
    parameter Real f_Xbiom_pr(unit = "kgCOD/kgCOD") = 0.8 "Proteins content in biomass";
    Real f_Xbiom_li(unit = "kgCOD/kgCOD") = 1 - f_Xbiom_ch - f_Xbiom_pr "Lipids content in biomass";
    parameter Real CH_conv_in(unit = "kgCOD/kgVS") = 32 * 6 / 180 "COD conversion factor for influent carbohydrates";
    parameter Real PR_conv_in(unit = "kgCOD/kgVS") = 1.45 "1.58 COD conversion factor for influent proteins";
    parameter Real LI_conv_in(unit = "kgCOD/kgVS") = 2.90 "COD conversion factor for influent lipids";
    parameter Real CH_conv_out(unit = "kgCOD/kgVS") = 32 * 6 / 180 "COD conversion factor for effluent carbohydrates";
    parameter Real PR_conv_out_BSA(unit = "kgCOD/kgVS") = 1.58 "COD conversion factor for effluent proteins measured with the BCA method";
    parameter Real PR_conv_out(unit = "kgCOD/kgVS") = 1.42 "COD conversion factor for effluent proteins measured with the TKN method";
    parameter Real N_PR_conv(unit = "kgVS/kgN") = 7.5 "conversion factor for effluent proteins to organic nitrogen";
    parameter Real LI_conv_out(unit = "kgCOD/kgVS") = 1.9 "COD conversion factor for effluent lipids";
    Real Xi_conv_out(unit = "kgCOD/kgVS") = CH_conv_out * f_Xi_ch + PR_conv_out * f_Xi_pr + LI_conv_out * f_Xi_li;
    Real Si_conv_out(unit = "kgCOD/kgVS") = CH_conv_out * f_Si_ch + PR_conv_out * f_Si_pr + LI_conv_out * f_Si_li;
  end ParametersADM1_conversion;

  record ParametersADM1_stoichiometric
    // Carbon, Nitrogen and Phosforous contents
    parameter Real P_i(unit = "kmolP/kgCOD") = 0.0002;
    parameter Real P_li(unit = "kmolP/kgCOD") = 0.0003;
    parameter Real P_bac(unit = "kmolP/kgCOD") = 0.0007;
    parameter Real N_xc(unit = "kmolN/kgCOD") = 0.0376 / 14 "nitrogen content of particulate degradable COD";
    parameter Real N_i(unit = "kmolN/kgCOD") = 0.06 / 14 "nitrogen content of inert COD: 6% on weight basis in benchmark ASM";
    parameter Real N_aa(unit = "kmolN/kgCOD") = 0.007 "nitrogen content of amino acids";
    parameter Real N_bac(unit = "kmolN/kgCOD") = 0.08 / 14 "nitrogen content of biomass: 8% on weight basis in benchmark ASM";
    parameter Real C_xc(unit = "kmolC/kgCOD") = 0.02786 "carbon content of complex particulate COD";
    parameter Real C_xi(unit = "kmolC/kgCOD") = 0.03 "carbon content of particulate inert COD";
    parameter Real C_si(unit = "kmolC/kgCOD") = 0.03 "carbon content of soluble inert COD";
    parameter Real C_ch(unit = "kmolC/kgCOD") = 0.0313 "carbon content of carbohydrates";
    parameter Real C_pr(unit = "kmolC/kgCOD") = 0.03 "carbon content of proteins";
    parameter Real C_li(unit = "kmolC/kgCOD") = 0.022 "carbon content of lipids";
    parameter Real C_su(unit = "kmolC/kgCOD") = 0.0313 "carbon content of sugars";
    parameter Real C_aa(unit = "kmolC/kgCOD") = 0.03 "carbon content of amino acids";
    parameter Real C_fa(unit = "kmolC/kgCOD") = 0.0217 "carbon content of long chain fatty acids";
    parameter Real C_va(unit = "kmolC/kgCOD") = 0.024 "carbon content of valerate";
    parameter Real C_bu(unit = "kmolC/kgCOD") = 0.025 "carbon content of butyrate";
    parameter Real C_pro(unit = "kmolC/kgCOD") = 0.0268 "carbon content of propionate";
    parameter Real C_ac(unit = "kmolC/kgCOD") = 0.0313 "carbon content of acetate";
    parameter Real C_ch4(unit = "kmolC/kgCOD") = 0.0156 "carbon content of methane";
    parameter Real C_bac(unit = "kmolC/kgCOD") = 0.0313 "carbon content of biomass: 8% on weight basis in benchmark ASM";
    //Fractions decay product_bacterial biomass (Flores 2016 values)
    parameter Real f_si_xb(unit = "kgCOD/kgCOD") = 0.0 "yield of soluble inerts from disintegration of complex particulates";
    parameter Real f_xi_xb(unit = "kgCOD/kgCOD") = 0.1 "yield of particulate inerts from disintegration of complex particulates";
    parameter Real f_ch_xb(unit = "kgCOD/kgCOD") = 0.275 "yield of carbohydrates from disintegration of complex particulates";
    parameter Real f_pr_xb(unit = "kgCOD/kgCOD") = 0.275 "yield of proteins from disintegration of complex particulates";
    parameter Real f_li_xb(unit = "kgCOD/kgCOD") = 0.350 "yield of lipids from disintegration of complex particulates";
    //
    parameter Real f_fa_li(unit = "kgCOD/kgCOD") = 0.95 "yield of long chain fatty acids (as opposed to glycerol) from lipids";
    parameter Real nu_1_su(unit = "kgCOD/kgCOD") = 0.495 "fraction of sucrose that degrades to acetate only";
    parameter Real nu_2_su(unit = "kgCOD/kgCOD") = 0.345 "fraction of sucrose that degrades to acetate and propionate";
    Real f_h2_su = 0.33 * nu_1_su + 0.17 * (1 - nu_1_su - nu_2_su) "unit = kgCOD/kgCOD - yield of hydrogen from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_bu_su = 0.83 * (1 - nu_1_su - nu_2_su) "unit = kgCOD/kgCOD - yield of butyrate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_pro_su = 0.78 * nu_2_su "unit = kgCOD/kgCOD - yield of propionate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_ac_su = 0.67 * nu_1_su + 0.22 * nu_2_su "unit = kgCOD/kgCOD - yield of actetate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    parameter Real f_h2_aa(unit = "kgCOD/kgCOD") = 0.06 "yield of hydrogen from amino acid degradation";
    parameter Real f_va_aa(unit = "kgCOD/kgCOD") = 0.23 "yield of valerate from amino acid degradation";
    parameter Real f_bu_aa(unit = "kgCOD/kgCOD") = 0.26 "yield of butyrate from amino acid degradation";
    parameter Real f_pro_aa(unit = "kgCOD/kgCOD") = 0.05 "yield of propionate from amino acid degradation";
    parameter Real f_ac_aa(unit = "kgCOD/kgCOD") = 0.4 "yield of acetate from amino acid degradation";
    // Yields of biomass on uptake of substrates
    parameter Real Y_su(unit = "kgCODx/kgCODs") = 0.1 "yield of biomass on uptake of monosaccharides";
    parameter Real Y_aa(unit = "kgCODx/kgCODs") = 0.08 "yield of biomass on uptake of amino acids";
    parameter Real Y_fa(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of long chain fatty acids";
    parameter Real Y_c4(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of valerate or butyrate";
    parameter Real Y_pro(unit = "kgCODx/kgCODs") = 0.04 "yield of biomass on uptake of propionate";
    parameter Real Y_ac(unit = "kgCODx/kgCODs") = 0.05 "0.05 yield of biomass on uptake of acetate";
    parameter Real Y_h2(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of elemental hydrogen";
    annotation(
      Documentation(info = "<html><p> This record contains the stoichiometric coefficients as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_stoichiometric;

  record ParametersADM1_kinetic
    parameter Real k_dis(unit = "1/d") = 1.54 "1.2 complex particulate disintegration first order constant";
    parameter Real k_hyd_ch1(unit = "1/d") = 0.31 "0.75 carbohydrate hydrolysis first order constant";
    parameter Real k_hyd_pr1(unit = "1/d") = 0.31 "0.2 0.6 protein hydrolysis first order constant";
    parameter Real k_hyd_li1(unit = "1/d") = 0.31 "0.3 lipid hydrolysis first order constant";
    parameter Real k_hyd_ch2(unit = "1/d") = 0.3 "0.75 carbohydrate hydrolysis first order constant";
    parameter Real k_hyd_pr2(unit = "1/d") = 0.2 "0.2 0.6 protein hydrolysis first order constant";
    parameter Real k_hyd_li2(unit = "1/d") = 0.3 "0.3 lipid hydrolysis first order constant";
    parameter Real k_hyd_ch3(unit = "1/d") = 0.6865 "0.75 carbohydrate hydrolysis first order constant";
    parameter Real k_hyd_pr3(unit = "1/d") = 0.2446 "0.2 0.6 protein hydrolysis first order constant";
    parameter Real k_hyd_li3(unit = "1/d") = 0.1216 "0.3 lipid hydrolysis first order constant";
    parameter Real k_m_su(unit = "kgCODs/kgCODx/d") = 8 " 38 30 maximum uptake rate for monosaccharide degrading organisms";
    parameter Real k_m_aa(unit = "kgCODs/kgCODx/d") = 8 "50 maximum uptake rate amino acid degrading organisms";
    parameter Real k_m_fa(unit = "kgCODs/kgCODx/d") = 6 "6 maximum uptake rate for long chain fatty acid degrading organisms";
    parameter Real k_m_c4(unit = "kgCODs/kgCODx/d") = 20 "20 maximum uptake rate for c4 degrading organisms";
    parameter Real k_m_pro(unit = "kgCODs/kgCODx/d") = 20 "13 maximum uptake rate for propionate degrading organisms";
    parameter Real k_m_ac(unit = "kgCODs/kgCODx/d") = 8 "maximum uptake rate for acetate degrading organisms";
    parameter Real k_m_h2(unit = "kgCODs/kgCODx/d") = 35 "maximum uptake rate for hydrogen degrading organisms";
    parameter Real Ks_su(unit = "kgCOD/m3") = 0.5 "half saturation constant for monosaccharidedegradation";
    parameter Real Ks_aa(unit = "kgCOD/m3") = 1 "0.3 half saturation constant for amino acid degradation";
    parameter Real Ks_fa(unit = "kgCOD/m3") = 0.4 "half saturation constant for long chain fatty acid degrading organisms";
    parameter Real Ks_c4(unit = "kgCOD/m3") = 0.1 "half saturation constant for c4 degrading organisms";
    parameter Real Ks_pro(unit = "kgCOD/m3") = 0.3 "0.3 half saturation constant for propionate degrading organisms";
    parameter Real Ks_ac(unit = "kgCOD/m3") = 0.15 "0.15 half saturation constant for acetate degrading organisms";
    parameter Real Ks_h2(unit = "kgCOD/m3") = 2.5e-5 "half saturation constant for hydrogen degrading organisms";
    parameter Real k_dec_su(unit = "1/d") = 0.02 "decay rate for monosaccharide degrading organisms";
    parameter Real k_dec_aa(unit = "1/d") = 0.02 "decay rate for amino acid degrading organisms";
    parameter Real k_dec_fa(unit = "1/d") = 0.02 "decay rate  for long chain fatty acid degrading organisms";
    parameter Real k_dec_c4(unit = "1/d") = 0.02 "decay rate  for c4 degrading organisms";
    parameter Real k_dec_pro(unit = "1/d") = 0.02 "decay rate for propionate degrading organisms";
    parameter Real k_dec_ac(unit = "1/d") = 0.02 "decay rate  for acetate degrading organisms";
    parameter Real k_dec_h2(unit = "1/d") = 0.02 "decay rate for hydrogen degrading organisms";
    parameter Real Ks_IN(unit = "M") = 1e-4 "inorganic nitrogen concentration at which growth ceases";
    parameter Real Ks_IP(unit = "M") = 1e-5 "inorganic phosforous concentration at which growth ceases";
    parameter Real Ki_h2_fa(unit = "kgCOD/m3") = 5e-6 "hydrogen inhibitory concentration for LCFA degrading organisms";
    parameter Real Ki_h2_c4(unit = "kgCOD/m3") = 1e-5 "hydrogen inhibitory concentration for C4 degrading organisms";
    parameter Real Ki_h2_pro(unit = "kgCOD/m3") = 3.5e-6 "hydrogen inhibitory concentration for propionate degrading organisms";
    parameter Real Ki_nh3_ac(unit = "M") = 0.0018 "inhibitory free ammonia concentration for acetate degrading organisms";
    parameter Real pH_UL_aa = 5.5 "pH level at where there is no inhibition of amino acid degrading organisms";
    parameter Real pH_LL_aa = 4 "pH level at where there is full inhibition of amino acid degrading organisms";
    parameter Real pH_UL_ac = 7 "pH level at where there is no inhibition of acetate degrading organisms";
    parameter Real pH_LL_ac = 6 "pH level at where there is full inhibition of acetate degrading organisms";
    parameter Real pH_UL_h2 = 6 "pH level at where there is no inhibition of hydrogen degrading organisms";
    parameter Real pH_LL_h2 = 5 "pH level at where there is full inhibition of hydrogen degrading organisms";
    parameter Real th_k_hyd = 0.024;
    parameter Real th_k_m_su = 0.069;
    parameter Real th_k_m_aa = 0.069;
    parameter Real th_k_m_fa = 0.055;
    parameter Real th_k_m_pro = 0.055;
    //parameter Real th_k_m_c4 = ?; not found
    parameter Real th_k_m_ac = 0.069;
    parameter Real th_k_m_h2 = 0.069;
    parameter Real th_Ks_su = 0.069;
    parameter Real th_Ks_aa = 0.069;
    parameter Real th_Ks_fa = 0.035;
    parameter Real th_Ks_pro = 0.10;
    //parameter Real th_Ks_c4 = ?; not found
    parameter Real th_Ks_ac = 0.10;
    parameter Real th_Ks_h2 = 0.08;
    parameter Real th_k_dec_su = 0.069;
    parameter Real th_k_dec_aa = 0.069;
    parameter Real th_k_dec_fa = 0.055;
    parameter Real th_k_dec_pro = 0.055;
    //parameter Real th_k_dec_c4 = ?; not found
    parameter Real th_k_dec_ac = 0.069;
    parameter Real th_k_dec_h2 = 0.069;
    constant Real epsilon = 1e-6;
    annotation(
      Documentation(info = "<html><p> This record contains the kinetic parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_kinetic;

  record ParametersADM1_physiochemical
    //General
    parameter Real pKa_va = 4.86 "- log10Ka valerate at 298K";
    parameter Real pKa_bu = 4.82 "- log10Ka butyrate at 298K";
    parameter Real pKa_pro = 4.88 "- log10Ka propionate at 298K";
    parameter Real pKa_ac = 4.76 "- log10Ka acetate at 298K";
    parameter Real pKa_co2 = 6.35 "- log10Ka CO2 at 298K";
    parameter Real pKa_nh3 = 9.25 "- log10ka NH4+ at 298K ";
    parameter Real pKa_h2o = 14 "- log10ka water at 298K ";
    parameter Real pKa_h2po4 = 7.21 "-log10kaH2PO4";
    parameter Real pKa_hpo4 = 12.67 "-log10kaHPO4";
    parameter Real pKa_h3po4 = 2.12 "-log10kaH3PO4";
    constant Real deltaH0_Ka_co2(unit = "J/kmol") = 7646 "enthalpy of reaction CO2->HCO3";
    constant Real deltaH0_Ka_nh4(unit = "J/kmol") = 51965 "enthalpy of reaction NH4->NH3";
    constant Real deltaH0_Ka_h2o(unit = "J/kmol") = 55900 "enthalpy of reaction H2O->OH+H+";
    constant Real deltaH0_KH_ch4(unit = "J/kmol") = -14240 "enthalpy of reaction of CH4gas->CH4liq";
    constant Real deltaH0_KH_co2(unit = "J/kmol") = -19410 "enthalpy of reaction of CO2gas->CO2liq";
    constant Real deltaH0_KH_h2(unit = "J/kmol") = -4180 "enthalpy of reaction of H2gas->H2liq";
    constant Real deltaH0_Ka_h2po4(unit = "J/kmol") = 4200 "enthalpy of reaction H2PO4->HPO4. To be verified!";
    constant Real deltaH0_Ka_hpo4(unit = "J/kmol") = 14700 "enthalpy of reaction HPO4->PO4. To be verified!";
    constant Real deltaH0_Ka_h3po4(unit = "J/kmol") = -41900 "enthalpy of reaction H3PO4->H2PO4. To be verified!";
    parameter Real coeffHch4(unit = "kmol/m3/bar") = 0.0014;
    parameter Real coeffHco2(unit = "kmol/m3/bar") = 0.035;
    parameter Real coeffHh2(unit = "kmol/m3/bar") = 0.00078;
    parameter Real coeffph20_T(unit = "K") = 5290;
    parameter Real coeffph20_p(unit = "bar") = 0.0313;
    // Acidity constants (previously defined as "Real")
    Real Ka_va = 10 ^ (-pKa_va) "valerate acidity constant without temperature correction - unit = M";
    Real Ka_bu = 10 ^ (-pKa_bu) "butyrate acidity constant without temperature correction - unit = M";
    Real Ka_pro = 10 ^ (-pKa_pro) "propionate acidity constant without temperature correction - unit = M";
    Real Ka_ac = 10 ^ (-pKa_ac) "acetate acidity constant without temperature correction - unit = M";
    // Kinetic constant for acid-base reactions: set to be at least three orders of magnitude higher than the fastest time constant of the system
    parameter Real k_AB_va(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_bu(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_pro(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_ac(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_co2(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_IN(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_IP(unit = "1/d/(kmol/m3)") = 1e10;
    // Conversion factors for UM
    parameter Real convKa(unit = "kmol/m3") = 1;
    annotation(
      Documentation(info = "<html><p> This record contains the physiochemical parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_physiochemical;

  record StateVariablesADM1
    //Biomass
    Modelica.SIunits.MassConcentration X_su(fixed = true, start = 1.60571) "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_aa(fixed = true, start = 0.541365) "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_fa(fixed = true, start = 0.213571) "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_c4(fixed = true, start = 0.412867) "C4 degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_pro(fixed = true, start = 0.248744) "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_ac(fixed = true, start = 1.01593) "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_h2(fixed = true, start = 0.463351) "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
    //Particulate substrate
    Modelica.SIunits.MassConcentration X_c(fixed = true, start = 0.0) "Complex particulate concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_i(fixed = true, start = 45.1488) "Particulate inerts concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_ch(fixed = true, start = 1.09422) "Particulate carbohydrates concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_pr(fixed = true, start = 0.890377) "Particulate proteins concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration X_li(fixed = true, start = 0.325233) "Particulate lipids concentration in digestate [kgCOD/m3]";
    //Soluble substrate
    Modelica.SIunits.MassConcentration S_i(fixed = true, start = 2.06057e-08) "Soluble inerts concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_su(fixed = true, start = 0.0216284) "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_aa(fixed = true, start = 0.0545847) "Soluble amino acids concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_fa(fixed = true, start = 0.0414486) "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_va(fixed = true, start = 0.00201259) "Valeric acid concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_bu(fixed = true, start = 0.0031565) "Butyric concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_pro(fixed = true, start = 0.0156237) "Propionic acid concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_ac(fixed = true, start = 0.880519) "Acetic acid concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_vam(fixed = true, start = 0.0020104) "Valerate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_bum(fixed = true, start = 0.00315335) "Butyrate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_prom(fixed = true, start = 0) "Propionate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_acm(fixed = true, start = 0.879755) "Acetate ion inerts concentration in digestate [kgCOD/m3]";
    //Inorganic soluble components
    Modelica.SIunits.MassConcentration S_h2(fixed = true, start = 4.11532e-07) "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_ch4(fixed = true, start = 0.0474429) "Soluble methane concentration in digestate [kgCOD/m3]";
    Types.MolarDensity_M S_ic(fixed = true, start = 0.332713) "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_in(fixed = true, start = 0.242044) "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ip(fixed = true, start = 0.00659511,nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_cat(fixed = true, start = 0.144689) "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ca(fixed = true, start = 0.000238053,nominal = 1e-4);
    Types.MolarDensity_M S_mg(fixed = true, start = 8.75745e-05,nominal = 1e-5);
    Types.MolarDensity_M S_an(fixed = false, start = 0.0197599);
    Types.MolarDensity_M S_hco3(fixed = false, start = 0.323025) "8/10";
    Types.MolarDensity_M S_nh3(fixed = true, start = 0.0187221,nominal = 1e-2) "8/10";
    Types.MolarDensity_M S_nh4(fixed = false, start = 0.223322,nominal = 1e-1) "8/10";
    Types.MolarDensity_M S_hpo4(fixed = false, start = 0.005365,nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_h2po4(fixed = true, start = 0.00123002, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_po4(fixed = true, start = 1.22302e-08, nominal = 1e-8) "8/10";
    Types.MolarDensity_M S_co2(fixed = true, start = 0.0096877) "8/10";
    Modelica.SIunits.PerUnit pH(fixed = false, start = 7.11, nominal = 7) "Digestate pH [-]";
    Types.MolarDensity_M S_h(fixed = true, start = 1.51014e-08, nominal = 1e-8, min = 1.48e-8, max = 1.6e-8) "8/10";
    Types.MolarDensity_M S_oh(fixed = false, start = 1.58449e-06) "8/10";
    Types.MolarDensity_M Theta(fixed = false, start = 0.02); 
//Gas components
    Modelica.SIunits.MassConcentration S_gas_h2(fixed = false, start = 1.88676e-05);
    Modelica.SIunits.MassConcentration S_gas_ch4(fixed = true, start = 1.48839);
    Types.MolarDensity_M S_gas_co2(fixed = true, start = 0.0144672);
    Types.Pressure_bar p_gas_h2(fixed = false, start = 1.5e-05);
    Types.Pressure_bar  p_gas_ch4(fixed = false, start = 0.582185);
    Types.Pressure_bar  p_gas_co2(fixed = false, start = 0.382985);
    //Other variables
    //Real P_gas(fixed = true, start = 1.014);
    Real Q_gas(fixed = false, start = 1e-16);
    Real Q_gas_N(fixed = false, start = 0);
    Real CH4_cum(fixed = true, start = 0);
    //Temperature dependant parameters
    Real k_hyd_ch1_T;
    Real k_hyd_pr1_T;
    Real k_hyd_li1_T;
    Real k_hyd_ch2_T;
    Real k_hyd_pr2_T;
    Real k_hyd_li2_T;
    Real k_hyd_ch3_T;
    Real k_hyd_pr3_T;
    Real k_hyd_li3_T;
    Real k_m_su_T;
    Real k_m_aa_T;
    Real k_m_fa_T;
    Real k_m_pro_T;
    //Real k_m_c4_T; not found
    Real k_m_ac_T;
    Real k_m_h2_T;
    Real Ks_su_T;
    Real Ks_aa_T;
    Real Ks_fa_T;
    Real Ks_pro_T;
    //Real Ks_c4_T; not found
    Real Ks_ac_T;
    Real Ks_h2_T;
    Real k_dec_su_T;
    Real k_dec_aa_T;
    Real k_dec_fa_T;
    Real k_dec_pro_T;
    //Real k_dec_c4_T; not found
    Real k_dec_ac_T;
    Real k_dec_h2_T;
    Real Ka_co2(fixed = false, start = 4.94e-7);
    Real Ka_nh4(fixed = false, start = 1.11e-9);
    Real Ka_h2o(fixed = false, start = 2.08e-14);
    Real Ka_h2po4(fixed = false, start = 6.20e-8);
    Real Ka_hpo4(fixed = false, start = 2.14e-13);
    Real Ka_h3po4(fixed = false, start = 2.14e-2);
    Real KH_ch4(fixed = false, start = 0.00116);
    Real KH_co2(fixed = false, start = 0.0271);
    Real KH_h2(fixed = false, start = 7.38e-4);
    Real p_gas_h2o(fixed = false, start = 0.0557);
    // Inorganic carbon coefficients on processes
    Real v1;
    Real v2;
    Real v3;
    Real v4;
    Real v5;
    Real v6;
    Real v7;
    Real v8;
    Real v9;
    Real v10;
    Real v11;
    Real v12;
    Real v13;
    //Process rates
    Real r1(fixed = false, start = 0);
    Real r2_1(fixed = false, start = 0);
    Real r2_2(fixed = false, start = 0);
    Real r2_3(fixed = false, start = 0);
    Real r3_1(fixed = false, start = 0);
    Real r3_2(fixed = false, start = 0);
    Real r3_3(fixed = false, start = 0);
    Real r4_1(fixed = false, start = 0);
    Real r4_2(fixed = false, start = 0);
    Real r4_3(fixed = false, start = 0);
    Real r5(fixed = false, start = 0);
    Real r6(fixed = false, start = 0);
    Real r7(fixed = false, start = 0);
    Real r8(fixed = false, start = 0);
    Real r9(fixed = false, start = 0);
    Real r10(fixed = false, start = 0);
    Real r11(fixed = false, start = 0);
    Real r12(fixed = false, start = 0);
    Real r13(fixed = false, start = 0);
    Real r14(fixed = false, start = 0);
    Real r15(fixed = false, start = 0);
    Real r16(fixed = false, start = 0);
    Real r17(fixed = false, start = 0);
    Real r18(fixed = false, start = 0);
    Real r19(fixed = false, start = 0);
    Real ra4(fixed = false, start = 0);
    Real ra5(fixed = false, start = 0);
    Real ra6(fixed = false, start = 0);
    Real ra7(fixed = false, start = 0);
    Real ra10(fixed = false, start = 0);
    Real ra11(fixed = false, start = 0);
    Real ra12(fixed = false, start = 0);
    Real ra13(fixed = false, start = 0);
    Real rt8(fixed = false, start = 0);
    Real rt9(fixed = false, start = 0);
    Real rt10(fixed = false, start = 0);
    // Process inhibition
    Real I_5(fixed = false, start = 1);
    Real I_6(fixed = false, start = 1);
    Real I_7(fixed = false, start = 1);
    Real I_8(fixed = false, start = 1);
    Real I_9(fixed = false, start = 1);
    Real I_10(fixed = false, start = 1);
    Real I_11(fixed = false, start = 1);
    Real I_12(fixed = false, start = 1);
    Real I_pH_aa(fixed = false, start = 1);
    Real I_pH_ac(fixed = false, start = 1);
    Real I_pH_h2(fixed = false, start = 1);
    Real I_in_lim(fixed = false, start = 1);
    Real I_ip_lim(fixed = false, start = 1);
    Real I_h2_fa(fixed = false, start = 1);
    Real I_h2_c4(fixed = false, start = 1);
    Real I_h2_pro(fixed = false, start = 1);
    Real I_nh3(fixed = false, start = 1);
    //Co-digestion fractions
    Real f_ch1;
    Real f_ch2;
    Real f_ch3;
    Real f_pr1;
    Real f_pr2;
    Real f_pr3;
    Real f_li1;
    Real f_li2;
    Real f_li3;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1;

  record OtherVariables_Feed1
    Real TS_in1(fixed = false, start = 0);
    Real VS_in1(fixed = false, start = 0);
    //  Real pVS_in1(fixed = false, start = 0);
    //  Real sVS_in1(fixed = false, start = 0);
    //  Real tCH_in1(fixed = false, start = 0);
    //  Real tPR_in1(fixed = false, start = 0);
    //  Real pLI_VS_in1(fixed = false, start = 0);
    //  Real ac_in1(fixed = false, start = 0);
    //  Real pro_in1(fixed = false, start = 0);
    //  Real isobu_in1(fixed = false, start = 0);
    //  Real bu_in1(fixed = false, start = 0);
    //  Real isova_in1(fixed = false, start = 0);
    //  Real va_in1(fixed = false, start = 0);
    Real tBMP_VS_in1(fixed = false, start = 0);
    Real pH_in1(fixed = false, start = 0);
    Real Alk_in1(fixed = false, start = 0);
    Real Ammonium_in1(fixed = false, start = 0);
    Real Fosfates_in1(fixed = false, start = 0);
    Real Ca_in1(fixed = false, start = 0);
    Real Mg_in1(fixed = false, start = 0);
    Real u_in1(fixed = false, start = 0);
    Real v_in1(fixed = false, start = 0);
    Real d_in1(fixed = false, start = 0);
    //  Real alpha_in1(fixed = false, start = 0);
    Real COD_VFA_in1(fixed = false, start = 0);
    //  Real pLI_pVS_in1(fixed = false, start = 0);
    //  Real tLI_in1(fixed = false, start = 0);
    Real tCOD_in1(fixed = false, start = 0);
    Real pCOD_in1(fixed = false, start = 0);
    Real tBMP_COD_in1(fixed = false, start = 0);
    //  Real degr_tCOD_in1(fixed = false, start = 0);
    //  Real undegr_tCOD_in1(fixed = false, start = 0);
    Real Ka_co2_in1(fixed = false, start = 0);
    Real Ka_nh4_in1(fixed = false, start = 0);
    Real Ka_h2o_in1(fixed = false, start = 0);
    Real Ka_h2po4_in1(fixed = false, start = 0);
    Real Ka_hpo4_in1(fixed = false, start = 0);
    Real S_h_in1(fixed = false, start = 0);
    Real S_oh_in1(fixed = false, start = 0);
    Real S_ac_mol_in1(fixed = false, start = 0);
    Real S_pro_mol_in1(fixed = false, start = 0);
    Real S_bu_mol_in1(fixed = false, start = 0);
    Real S_va_mol_in1(fixed = false, start = 0);
    Real S_ac_ion_in1(fixed = false, start = 0);
    Real S_pro_ion_in1(fixed = false, start = 0);
    Real S_bu_ion_in1(fixed = false, start = 0);
    Real S_va_ion_in1(fixed = false, start = 0);
    Real S_hpo4_in1(fixed = false, start = 0);
    Real S_po4_in1(fixed = false, start = 0);
    Real S_h2po4_in1(fixed = false, start = 0);
    Real Alk_mol_in1(fixed = false, start = 0);
    Real S_hco3_in1(fixed = false, start = 0);
    Real S_nh4_in1(fixed = false, start = 0);
  end OtherVariables_Feed1;

  record OtherVariables_Feed2
    Real TS_in2(fixed = false, start = 0);
    Real VS_in2(fixed = false, start = 0);
    //  Real pVS_in2(fixed = false, start = 0);
    //  Real sVS_in2(fixed = false, start = 0);
    //  Real sCOD_in2(fixed = false, start = 0);
    //  Real tCH_in2(fixed = false, start = 0);
    //  Real sCH_in2(fixed = false, start = 0);
    //  Real tPR_in2(fixed = false, start = 0);
    //  Real sPR_in2(fixed = false, start = 0);
    //  Real pLI_VS_in2(fixed = false, start = 0);
    //  Real ac_in2(fixed = false, start = 0);
    //  Real pro_in2(fixed = false, start = 0);
    //  Real isobu_in2(fixed = false, start = 0);
    //  Real bu_in2(fixed = false, start = 0);
    //  Real isova_in2(fixed = false, start = 0);
    //  Real va_in2(fixed = false, start = 0);
    Real tBMP_VS_in2(fixed = false, start = 0);
    Real pH_in2(fixed = false, start = 0);
    Real Alk_in2(fixed = false, start = 0);
    Real Ammonium_in2(fixed = false, start = 0);
    Real Fosfates_in2(fixed = false, start = 0);
    Real Ca_in2(fixed = false, start = 0);
    Real Mg_in2(fixed = false, start = 0);
    Real u_in2(fixed = false, start = 0);
    Real v_in2(fixed = false, start = 0);
    Real d_in2(fixed = false, start = 0);
    //  Real alpha_in2(fixed = false, start = 0);
    Real COD_VFA_in2(fixed = false, start = 0);
    //  Real pLI_pVS_in2(fixed = false, start = 0);
    //  Real tLI_in2(fixed = false, start = 0);
    Real tCOD_in2(fixed = false, start = 0);
    Real pCOD_in2(fixed = false, start = 0);
    Real tBMP_COD_in2(fixed = false, start = 0);
    Real Ka_co2_in2(fixed = false, start = 0);
    Real Ka_nh4_in2(fixed = false, start = 0);
    Real Ka_h2o_in2(fixed = false, start = 0);
    Real Ka_h2po4_in2(fixed = false, start = 0);
    Real Ka_hpo4_in2(fixed = false, start = 0);
    Real S_h_in2(fixed = false, start = 0);
    Real S_oh_in2(fixed = false, start = 0);
    Real S_ac_mol_in2(fixed = false, start = 0);
    Real S_pro_mol_in2(fixed = false, start = 0);
    Real S_bu_mol_in2(fixed = false, start = 0);
    Real S_va_mol_in2(fixed = false, start = 0);
    Real S_ac_ion_in2(fixed = false, start = 0);
    Real S_pro_ion_in2(fixed = false, start = 0);
    Real S_bu_ion_in2(fixed = false, start = 0);
    Real S_va_ion_in2(fixed = false, start = 0);
    Real S_hpo4_in2(fixed = false, start = 0);
    Real S_po4_in2(fixed = false, start = 0);
    Real S_h2po4_in2(fixed = false, start = 0);
    Real Alk_mol_in2(fixed = false, start = 0);
    Real S_hco3_in2(fixed = false, start = 0);
    Real S_nh4_in2(fixed = false, start = 0);
  end OtherVariables_Feed2;

  record OtherVariables_Feed3
    Real TS_in3(fixed = false, start = 0);
    Real VS_in3(fixed = false, start = 0);
    //  Real pVS_in3(fixed = false, start = 0);
    //  Real sVS_in3(fixed = false, start = 0);
    //  Real tCH_in3(fixed = false, start = 0);
    //  Real tPR_in3(fixed = false, start = 0);
    //  Real pLI_VS_in3(fixed = false, start = 0);
    //  Real ac_in3(fixed = false, start = 0);
    //  Real pro_in3(fixed = false, start = 0);
    //  Real isobu_in3(fixed = false, start = 0);
    //  Real bu_in3(fixed = false, start = 0);
    //  Real isova_in3(fixed = false, start = 0);
    //  Real va_in3(fixed = false, start = 0);
    Real tBMP_VS_in3(fixed = false, start = 0);
    Real pH_in3(fixed = false, start = 0);
    Real Alk_in3(fixed = false, start = 0);
    Real Ammonium_in3(fixed = false, start = 0);
    Real Fosfates_in3(fixed = false, start = 0);
    Real Ca_in3(fixed = false, start = 0);
    Real Mg_in3(fixed = false, start = 0);
    Real u_in3(fixed = false, start = 0);
    Real v_in3(fixed = false, start = 0);
    Real d_in3(fixed = false, start = 0);
    //    Real alpha_in3(fixed = false, start = 0);
    Real COD_VFA_in3(fixed = false, start = 0);
    //    Real pLI_pVS_in3(fixed = false, start = 0);
    //    Real tLI_in3(fixed = false, start = 0);
    Real tCOD_in3(fixed = false, start = 0);
    Real pCOD_in3(fixed = false, start = 0);
    Real tBMP_COD_in3(fixed = false, start = 0);
    //    Real degr_tCOD_in3(fixed = false, start = 0);
    //    Real undegr_tCOD_in3(fixed = false, start = 0);
    Real Ka_co2_in3(fixed = false, start = 0);
    Real Ka_nh4_in3(fixed = false, start = 0);
    Real Ka_h2o_in3(fixed = false, start = 0);
    Real Ka_h2po4_in3(fixed = false, start = 0);
    Real Ka_hpo4_in3(fixed = false, start = 0);
    Real S_h_in3(fixed = false, start = 0);
    Real S_oh_in3(fixed = false, start = 0);
    Real S_ac_mol_in3(fixed = false, start = 0);
    Real S_pro_mol_in3(fixed = false, start = 0);
    Real S_bu_mol_in3(fixed = false, start = 0);
    Real S_va_mol_in3(fixed = false, start = 0);
    Real S_ac_ion_in3(fixed = false, start = 0);
    Real S_pro_ion_in3(fixed = false, start = 0);
    Real S_bu_ion_in3(fixed = false, start = 0);
    Real S_va_ion_in3(fixed = false, start = 0);
    Real S_hpo4_in3(fixed = false, start = 0);
    Real S_po4_in3(fixed = false, start = 0);
    Real S_h2po4_in3(fixed = false, start = 0);
    Real Alk_mol_in3(fixed = false, start = 0);
    Real S_hco3_in3(fixed = false, start = 0);
    Real S_nh4_in3(fixed = false, start = 0);
  end OtherVariables_Feed3;

  record OtherVariables_MassBalance
    Real V_in_cum(fixed = true, start = 0);
    Real COD_S(fixed = false, start = 0);
    Real COD_X(fixed = false, start = 0);
    Real COD_balance_in(fixed = false, start = 0);
    Real COD_balance_in_cum(fixed = true, start = 0);
    Real COD_balance_out(fixed = false, start = 0);
    Real COD_balance_out_cum(fixed = true, start = 0);
    Real COD_balance_gas(fixed = false, start = 0);
    Real COD_balance_gas_cum(fixed = true, start = 0);
    Real IC_balance_in(fixed = false, start = 0);
    Real IC_balance_in_cum(fixed = true, start = 0);
    Real IC_balance_out(fixed = false, start = 0);
    Real IC_balance_out_cum(fixed = true, start = 0);
    Real IC_balance_gas(fixed = false, start = 0);
    Real IC_balance_gas_cum(fixed = true, start = 0);
    Real IN_balance_in(fixed = false, start = 0);
    Real IN_balance_in_cum(fixed = true, start = 0);
    Real IN_balance_out(fixed = false, start = 0);
    Real IN_balance_out_cum(fixed = true, start = 0);
    Real IP_balance_in(fixed = false, start = 0);
    Real IP_balance_in_cum(fixed = true, start = 0);
    Real IP_balance_out(fixed = false, start = 0);
    Real IP_balance_out_cum(fixed = true, start = 0);
    Real HRT(fixed = false, start = 0) "d";
    Real OLR(fixed = false, start = 0) "kgCOD/m3/d";
    Real Vcum(fixed = true, start = 0);
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating mass balances. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> January 22, 2021 </em></p></html>"));
  end OtherVariables_MassBalance;

  record OtherVariables_Discharge
    Real Alk(fixed = false, start = 0);
    Real VFA(fixed = false, start = 0);
    Real FOS_TAC(fixed = false, start = 0);
    Real VS(fixed = false, start = 0);
    Real N_NH4NH3(fixed = false, start = 0);
    Real COD_tot(fixed = false, start = 0);
    Real CH_tot(fixed = false, start = 0);
    Real PR_tot_BCA(fixed = false, start = 0);
    Real PR_tot_TKN(fixed = false, start = 0);
    Real LI_tot(fixed = false, start = 0);
    Real CH_sol(fixed = false, start = 0);
    Real PR_sol_BCA(fixed = false, start = 0);
    Real PR_sol_TKN(fixed = false, start = 0);
    Real LI_sol(fixed = false, start = 0);
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating output aggregated variables. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> January 22, 2021 </em></p></html>"));
  end OtherVariables_Discharge;

  record OtherVariables_GasMeter
    Real x_ch4(fixed = false, start = 0);
    Real x_co2(fixed = false, start = 0);
    Real x_h2(fixed = false, start = 0);
    Real Q_ch4_N(fixed = false, start = 0);
    Real Q_co2_N(fixed = false, start = 0);
    Real Q_h2_N(fixed = false, start = 0);
  end OtherVariables_GasMeter;

  package Interfaces
    connector Feed
      flow Real Q;
      Real S_su;
      Real S_aa;
      Real S_fa;
      Real S_va;
      Real S_bu;
      Real S_pro;
      Real S_ac;
      Real S_h2;
      Real S_ch4;
      Real S_ic;
      Real S_in;
      Real S_ip;
      Real S_i;
      Real S_cat;
      Real S_ca;
      Real S_mg;
      Real S_an;
      Real X_c;
      Real X_ch;
      Real X_pr;
      Real X_li;
      Real X_su;
      Real X_aa;
      Real X_fa;
      Real X_c4;
      Real X_pro;
      Real X_ac;
      Real X_h2;
      Real X_i;
      Real f_si_xc;
      Real f_xi_xc;
      Real f_ch_xc;
      Real f_pr_xc;
      Real f_li_xc;
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end Feed;

    connector Digestate
      flow Real Q;
      Real S_su;
      Real S_aa;
      Real S_fa;
      Real S_va;
      Real S_bu;
      Real S_pro;
      Real S_ac;
      Real S_h2;
      Real S_ch4;
      Real S_ic;
      Real S_in;
      Real S_ip;
      Real S_i;
      Real S_cat;
      Real S_ca;
      Real S_mg;
      Real S_an;
      Real X_c;
      Real X_ch;
      Real X_pr;
      Real X_li;
      Real X_su;
      Real X_aa;
      Real X_fa;
      Real X_c4;
      Real X_pro;
      Real X_ac;
      Real X_h2;
      Real X_i;
      Real S_hco3;
      Real S_co2;
      Real S_h;
      Real S_oh;
      Real S_nh3;
      Real S_nh4;
      Real S_hpo4;
      Real S_h2po4;
      Real S_acm;
      Real S_prom;
      Real S_bum;
      Real S_vam;
      Real S_gas_h2;
      Real S_gas_ch4;
      Real S_gas_co2;
      Real X_acp;
      Real X_stru;
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {255, 172, 108}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {255, 172, 108}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end Digestate;

    connector Gas
      flow Real Q_gas_N;
      Real p_gas_h2o;
      Real p_gas_h2;
      Real p_gas_ch4;
      Real p_gas_co2;
      Real P_gas;
      annotation(
        Diagram(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}),
        Icon(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}));
    end Gas;
  end Interfaces;

  package Icons
    partial block FeedSource1
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "CattleManure"), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {93, 45, 0}, fillColor = {71, 34, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-54, 54}, {56, -54}}), Rectangle(origin = {-2, 0}, lineColor = {90, 44, 0}, fillColor = {75, 36, 0}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-2.24365, -0.168094}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Polygon(origin = {0, 2}, lineColor = {98, 47, 0}, fillColor = {75, 36, 0}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end FeedSource1;

    partial block FeedSource2
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "CattleSlurry"), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-54, 54}, {56, -54}}), Line(origin = {-1.66045, 0.41511}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {255, 150, 75}, fillColor = {255, 150, 75}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Rectangle(origin = {-2, 0}, lineColor = {255, 150, 75}, fillColor = {255, 150, 75}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Polygon(origin = {0, 4}, lineColor = {255, 150, 75}, fillColor = {255, 150, 75}, fillPattern = FillPattern.Solid, points = {{0, -56}, {-14, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {0, -54}, {0, -56}})}));
    end FeedSource2;

    partial block FeedSource3
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "MaizeSilage"), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {255, 255, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-54, 54}, {56, -54}}), Rectangle(origin = {-2, 0}, lineColor = {255, 255, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-2.24365, -0.168094}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Polygon(origin = {0, 2}, lineColor = {255, 255, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end FeedSource3;

    partial block FeedingTank
      annotation(
        Icon(graphics = {Rectangle(lineColor = {98, 106, 124}, fillColor = {186, 204, 220}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-60, 80}, {60, -80}}), Rectangle(origin = {0, -90}, lineColor = {145, 145, 145}, fillColor = {222, 222, 222}, fillPattern = FillPattern.Solid, lineThickness = 0.5, borderPattern = BorderPattern.Engraved, extent = {{-80, 10}, {80, -10}}, radius = 3), Ellipse(origin = {-2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}}, endAngle = 360), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Ellipse(origin = {2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}, endAngle = 360), Line(origin = {0.326594, -0.653188}, points = {{0, -34}, {0, 40}, {0, 98}}, thickness = 1), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, thickness = 0.5), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}, endAngle = 360), Ellipse(origin = {0.25, -87.49}, lineColor = {88, 88, 88}, fillColor = {159, 159, 159}, fillPattern = FillPattern.Solid, extent = {{-18.25, 11.49}, {18.25, -11.49}}, endAngle = 360), Line(origin = {-2, -89.55}, points = {{2, -9}, {8, 11}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Line(origin = {-11.1441, -80.7082}, points = {{-1, 1}, {3, -3}}), Line(origin = {3.2058, -79.2899}, points = {{-3, 3}, {-3, -3}}), Line(origin = {-12.61, -85.62}, points = {{-5, -3}, {3, -3}}), Line(origin = {11.7335, -74.6764}, points = {{-3, -9}, {1, -5}}), Line(origin = {15.39, -85.62}, points = {{-5, -3}, {3, -3}})}));
    end FeedingTank;

    partial block Digester
      annotation(
        Icon(graphics = {Ellipse(origin = {0, 52}, lineColor = {154, 149, 124}, fillColor = {229, 220, 200}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-64, 36}, {64, -36}}, endAngle = 360), Polygon(origin = {-1, -24}, lineColor = {131, 65, 0}, fillColor = {214, 142, 106}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-63, 78}, {-63, -52}, {1, -70}, {65, -52}, {65, 64}, {65, 78}, {-63, 78}}), Ellipse(lineColor = {85, 0, 0}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}, endAngle = 360), Line(points = {{10, -36}, {2, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(origin = {0.33, -0.65}, points = {{0, -34}, {0, 40}, {0, 54}}, color = {85, 0, 0}, thickness = 1), Ellipse(origin = {2.69, 0}, lineColor = {85, 0, 0}, fillColor = {189, 107, 79}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}, endAngle = 360), Ellipse(origin = {-2.69, 0}, lineColor = {85, 0, 0}, fillColor = {189, 107, 79}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}}, endAngle = 360)}));
    end Digester;

    partial block SludgeDischarge
      annotation(
        Icon(graphics = {Rectangle(origin = {2, 34}, lineColor = {127, 61, 0}, fillColor = {163, 118, 80}, fillPattern = FillPattern.Solid, extent = {{-36, -43}, {97.5, -80}}), Polygon(origin = {6, 24}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-62, 18}, {-50, 26}, {-50, 10}, {-62, 18}}), Rectangle(origin = {-3.33, 24.67}, lineColor = {122, 122, 122}, fillColor = {192, 192, 192}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-76.67, 1.33}, {-30.67, -6.67}}), Line(origin = {3.27, 33.8}, points = {{-34, -14}, {-30, -14}, {-24, -16}, {-20, -20}, {-16, -26}, {-12, -34}, {-12, -42}}, color = {163, 118, 80}, thickness = 1.75), Polygon(origin = {4, 24}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-72, 26}, {-72, 10}, {-60, 18}, {-72, 26}}), Line(origin = {3.97819, 21.734}, points = {{-60, 20}, {-60, 4}}, thickness = 1), Line(origin = {2.06, 33.9318}, points = {{-36, -16}, {-36, -80}, {98, -80}, {98, -8}}, thickness = 0.5)}));
    end SludgeDischarge;

    partial block GasMeter
      annotation(
        Icon(graphics = {Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Ellipse(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, extent = {{-12, -12}, {12, 12}}, endAngle = 360), Ellipse(fillColor = {252, 255, 184}, fillPattern = FillPattern.Solid, extent = {{-70, -70}, {70, 70}}, endAngle = 360), Line(points = {{-22.9, 32.8}, {-40.2, 57.3}}), Ellipse(fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-7, -7}, {7, 7}}, endAngle = 360), Line(points = {{-37.6, 13.7}, {-65.8, 23.9}}), Line(visible = false, points = {{55, -85}, {-60, -85}}, color = {0, 128, 255}), Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Line(points = {{22.9, 32.8}, {40.2, 57.3}}), Line(points = {{37.6, 13.7}, {65.8, 23.9}}), Line(points = {{0, 70}, {0, 40}})}));
    end GasMeter;

    partial block ProbeT
      annotation(
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Line(origin = {0.195359, 0}, points = {{50, 0}, {88, 0}}, thickness = 0.5), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "T"), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5)}));
    end ProbeT;

    partial block ProbeP
      annotation(
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Line(origin = {0.195359, 0}, points = {{50, 0}, {88, 0}}, thickness = 0.5), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "P"), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5)}));
    end ProbeP;

    partial block Probe_measurements
      annotation(
        Diagram(graphics = {Line(points = {{0, -50}, {0, -90}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Text(extent = {{-36, -10}, {36, -32}}, textString = "Measured"), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5)}),
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, -50}, {0, -90}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "Measured"), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5)}));
    end Probe_measurements;
  end Icons;

  package BlockLibrary
    model Feed_Source_1
      extends ADM1_P.Icons.FeedSource1;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.OtherVariables_Feed1;
      ADM1_P.Interfaces.Feed Manure_Out annotation(
        Placement(visible = true, transformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable Sludge_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Conc_Feed1_ADM1_mag2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-30, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable Sludge_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Q_Feed1_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-72, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable Sludge_BMP(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_BMP_Feed1_ADM1_mag2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_BMP_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-28, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
//general inputs from Biernacki
      Manure_Out.Q = -21.92 "m3/d";
      TS_in1 = 230 "gTS/kg";
      VS_in1 = 0.8 * TS_in1 "gVS/kg";
      pH_in1 = 7.5 "-";
      Alk_in1 = 5000 "mgCaCO3/L";
      Ammonium_in1 = 1500 "mgN/L";
      Fosfates_in1 = 800 "mgP/L";
      tBMP_VS_in1 = 0.0 "NmLCH4/gVS";
      Ca_in1 = 0.007 "mol/L";
      Mg_in1 = 0.013 "mol/L";
//Computation of soluble gas
      Manure_Out.S_h2 = S_h2_input1 "gCOD/L";
      Manure_Out.S_ch4 = S_ch4_input1 "gCOD/L";
//Computation of biomasses
      Manure_Out.X_su = X_su_input1 "gCOD/L";
      Manure_Out.X_aa = X_aa_input1 "gCOD/L";
      Manure_Out.X_fa = X_fa_input1 "gCOD/L";
      Manure_Out.X_c4 = X_c4_input1 "gCOD/L";
      Manure_Out.X_pro = X_pro_input1 "gCOD/L";
      Manure_Out.X_ac = X_ac_input1 "gCOD/L";
      Manure_Out.X_h2 = X_h2_input1 "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      Manure_Out.S_ac = 18.29 "gCOD/L";
      Manure_Out.S_pro = 2.39 "gCOD/L";
      Manure_Out.S_bu = 7.11 "gCOD/L";
      Manure_Out.S_va = 2.61 "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      Manure_Out.S_su = S_su_input1 "gCOD/L";
      Manure_Out.S_aa = S_aa_input1 "gCOD/L";
      Manure_Out.S_fa = S_fa_input1 "gCOD/L";
      Manure_Out.S_i = S_i_input1 "gCOD/L";
//Computation of physical properties
      u_in1 = 1 - TS_in1 / 1000 "fraction of moisture content";
      v_in1 = VS_in1 / TS_in1 "fraction of volatile content";
      d_in1 = 1 / (u_in1 / 1000 + (1 - u_in1) * (v_in1 / 1050 + (1 - v_in1) / 2500)) "g/L, density";
      COD_VFA_in1 = Manure_Out.S_ac + Manure_Out.S_pro + Manure_Out.S_bu + Manure_Out.S_va "gCOD/L, COD associated to VFA";
//Computation of variables X_c and X_i (Biernacki)
      tBMP_COD_in1 = tBMP_VS_in1 / tCOD_in1 * VS_in1 * d_in1 / 1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
      Manure_Out.X_i = 128.62;
      Manure_Out.X_pr = 46.74;
      Manure_Out.X_li = 10.62;
      Manure_Out.X_ch = 66.71;
      Manure_Out.X_c = 0.0;
      Manure_Out.f_xi_xc = 0.0;
      Manure_Out.f_si_xc = 0.0;
      Manure_Out.f_pr_xc = 0.0;
      Manure_Out.f_li_xc = 0.0;
      Manure_Out.f_ch_xc = 0.0;
      tCOD_in1 = COD_VFA_in1 + Manure_Out.X_pr + Manure_Out.X_li + Manure_Out.X_ch + Manure_Out.X_i "gCOD/L, total COD as sum of total CH, PR, LI and VFA";
      pCOD_in1 = tCOD_in1 - COD_VFA_in1 "gCOD/L, particulate COD";
//Computation of ionic components
      Ka_co2_in1 = 10 ^ (-pKa_co2) * exp(deltaH0_Ka_co2 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4_in1 = 10 ^ (-pKa_nh3) * exp(deltaH0_Ka_nh4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o_in1 = 10 ^ (-pKa_h2o) * exp(deltaH0_Ka_h2o / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4_in1 = 10 ^ (-pKa_h2po4) * exp(deltaH0_Ka_h2po4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4_in1 = 10 ^ (-pKa_hpo4) * exp(deltaH0_Ka_hpo4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      S_h_in1 = 10 ^ (-pH_in1) "mol/L";
      S_oh_in1 = Ka_h2o_in1 / S_h_in1 "mol/L";
      S_ac_mol_in1 = Manure_Out.S_ac / Ac_conv "mol/L";
      S_pro_mol_in1 = Manure_Out.S_pro / Pro_conv "mol/L";
      S_bu_mol_in1 = Manure_Out.S_bu / Bu_conv "mol/L";
      S_va_mol_in1 = Manure_Out.S_va / Va_conv "mol/L";
      S_ac_ion_in1 = Ka_ac * S_ac_mol_in1 / (S_h_in1 + Ka_ac) "mol/L";
      S_pro_ion_in1 = Ka_pro * S_pro_mol_in1 / (S_h_in1 + Ka_pro) "mol/L";
      S_bu_ion_in1 = Ka_bu * S_bu_mol_in1 / (S_h_in1 + Ka_bu) "mol/L";
      S_va_ion_in1 = Ka_va * S_va_mol_in1 / (S_h_in1 + Ka_va) "mol/L";
      S_hpo4_in1 = Ka_h2po4_in1 * Manure_Out.S_ip / (Ka_h2po4_in1 + S_h_in1 + Ka_h2po4_in1 * Ka_hpo4_in1 / S_h_in1) "mol/L";
      S_po4_in1 = Ka_hpo4_in1 * Manure_Out.S_ip / (Ka_hpo4_in1 + S_h_in1 + S_h_in1 ^ 2 / Ka_h2po4_in1) "mol/L";
      S_h2po4_in1 = Manure_Out.S_ip - S_hpo4_in1 - S_po4_in1;
      Alk_mol_in1 = Alk_in1 / 100 * 2 / 1000 "mol/L";
      S_hco3_in1 = Alk_mol_in1 - (S_ac_ion_in1 + S_pro_ion_in1 + S_bu_ion_in1 + S_va_ion_in1) - S_oh_in1 - (Manure_Out.S_in - S_nh4_in1) + S_h_in1 - S_hpo4_in1 - 2 * S_po4_in1 "mol/L";
      Manure_Out.S_ic = S_hco3_in1 * (S_h_in1 + Ka_co2_in1) / Ka_co2_in1 "mol/L";
      Manure_Out.S_in = Ammonium_in1 / 14 / 1000 "mol/L";
      Manure_Out.S_ip = Fosfates_in1 / 31 / 1000 "mol/L";
      S_nh4_in1 = Manure_Out.S_in * S_h_in1 / (Ka_nh4_in1 + S_h_in1) "mol/L";
      Manure_Out.S_an = S_an_input1 "mol/L";
      Manure_Out.S_cat = (-S_nh4_in1) - S_h_in1 - 2 * Manure_Out.S_ca - 2 * Manure_Out.S_mg + Manure_Out.S_an + S_hco3_in1 + S_oh_in1 + S_ac_ion_in1 + S_pro_ion_in1 + S_bu_ion_in1 + S_va_ion_in1 + 2 * S_hpo4_in1 + S_h2po4_in1 + 3 * S_po4_in1 "mol/L";
      Manure_Out.S_ca = Ca_in1 "mol/L";
      Manure_Out.S_mg = Mg_in1 "mol/L";
//entra come totale o come ione? Analisi controioni? Trovo S_cat togliendo i cationi noti.
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        Diagram(graphics = {Rectangle(extent = {{-66, 2}, {-66, 2}})}),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_1;

    model Feed_Source_2
      extends ADM1_P.Icons.FeedSource2;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.OtherVariables_Feed2;
      ADM1_P.Interfaces.Feed Slurry_Out annotation(
        Placement(visible = true, transformation(origin = {90, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
//general inputs from Biernacki
      Slurry_Out.Q = -123.29 "m3/d";
      TS_in2 = 90 "gTS/kg";
      VS_in2 = 0.85 * TS_in2 "gVS/kg";
      pH_in2 = 7.9 "-";
      Alk_in2 = 17500 "mgCaCO3/L";
      Ammonium_in2 = 2400 "mgN/L";
      Fosfates_in2 = 800 "mgP/L";
      tBMP_VS_in2 = 0.0 "NmLCH4/gVS";
      Ca_in2 = 0.007 "mol/L";
      Mg_in2 = 0.013 "mol/L";
//Computation of soluble gas
      Slurry_Out.S_h2 = S_h2_input2 "gCOD/L";
      Slurry_Out.S_ch4 = S_ch4_input2 "gCOD/L";
//Computation of biomasses
      Slurry_Out.X_su = X_su_input2 "gCOD/L";
      Slurry_Out.X_aa = X_aa_input2 "gCOD/L";
      Slurry_Out.X_fa = X_fa_input2 "gCOD/L";
      Slurry_Out.X_c4 = X_c4_input2 "gCOD/L";
      Slurry_Out.X_pro = X_pro_input2 "gCOD/L";
      Slurry_Out.X_ac = X_ac_input2 "gCOD/L";
      Slurry_Out.X_h2 = X_h2_input2 "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      Slurry_Out.S_ac = 7.05 "gCOD/L";
      Slurry_Out.S_pro = 3.47 "gCOD/L";
      Slurry_Out.S_bu = 2.36 "gCOD/L";
      Slurry_Out.S_va = 1.12 "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      Slurry_Out.S_su = 3.44 "gCOD/L";
      Slurry_Out.S_aa = 1.43 "gCOD/L";
      Slurry_Out.S_fa = 3.88 "gCOD/L";
      Slurry_Out.S_i = S_i_input2 "gCOD/L";
//Computation of physical properties
      u_in2 = 1 - TS_in2 / 1000 "fraction of moisture content";
      v_in2 = VS_in2 / TS_in2 "fraction of volatile content";
      d_in2 = 1 / (u_in2 / 1000 + (1 - u_in2) * (v_in2 / 1050 + (1 - v_in2) / 2500)) "g/L, density";
      COD_VFA_in2 = Slurry_Out.S_ac + Slurry_Out.S_pro + Slurry_Out.S_bu + Slurry_Out.S_va "gCOD/L, COD associated to VFA";
//Computation of variables X_c and X_i (Biernacki)
      tBMP_COD_in2 = tBMP_VS_in2 / tCOD_in2 * VS_in2 * d_in2 / 1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
      Slurry_Out.X_i = 29.05;
      Slurry_Out.X_pr = 24.93;
      Slurry_Out.X_li = 3.32;
      Slurry_Out.X_ch = 26.18;
      Slurry_Out.X_c = 0;
      Slurry_Out.f_xi_xc = 0.0;
      Slurry_Out.f_si_xc = 0.0;
      Slurry_Out.f_pr_xc = 0.0;
      Slurry_Out.f_li_xc = 0.0;
      Slurry_Out.f_ch_xc = 0.0;
      tCOD_in2 = COD_VFA_in2 + Slurry_Out.X_pr + Slurry_Out.X_li + Slurry_Out.X_ch + Slurry_Out.X_i "gCOD/L, total COD as sum of total CH, PR, LI and VFA";
      pCOD_in2 = tCOD_in2 - COD_VFA_in2 "gCOD/L, particulate COD";
//Computation of ionic components
      Ka_co2_in2 = 10 ^ (-pKa_co2) * exp(deltaH0_Ka_co2 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4_in2 = 10 ^ (-pKa_nh3) * exp(deltaH0_Ka_nh4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o_in2 = 10 ^ (-pKa_h2o) * exp(deltaH0_Ka_h2o / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4_in2 = 10 ^ (-pKa_h2po4) * exp(deltaH0_Ka_h2po4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4_in2 = 10 ^ (-pKa_hpo4) * exp(deltaH0_Ka_hpo4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      S_h_in2 = 10 ^ (-pH_in2) "mol/L";
      S_oh_in2 = Ka_h2o_in2 / S_h_in2 "mol/L";
      S_ac_mol_in2 = Slurry_Out.S_ac / Ac_conv "mol/L";
      S_pro_mol_in2 = Slurry_Out.S_pro / Pro_conv "mol/L";
      S_bu_mol_in2 = Slurry_Out.S_bu / Bu_conv "mol/L";
      S_va_mol_in2 = Slurry_Out.S_va / Va_conv "mol/L";
      S_ac_ion_in2 = Ka_ac * S_ac_mol_in2 / (S_h_in2 + Ka_ac) "mol/L";
      S_pro_ion_in2 = Ka_pro * S_pro_mol_in2 / (S_h_in2 + Ka_pro) "mol/L";
      S_bu_ion_in2 = Ka_bu * S_bu_mol_in2 / (S_h_in2 + Ka_bu) "mol/L";
      S_va_ion_in2 = Ka_va * S_va_mol_in2 / (S_h_in2 + Ka_va) "mol/L";
      S_hpo4_in2 = Ka_h2po4_in2 * Slurry_Out.S_ip / (Ka_h2po4_in2 + S_h_in2 + Ka_h2po4_in2 * Ka_hpo4_in2 / S_h_in2) "mol/L";
      S_po4_in2 = Ka_hpo4_in2 * Slurry_Out.S_ip / (Ka_hpo4_in2 + S_h_in2 + S_h_in2 ^ 2 / Ka_h2po4_in2) "mol/L";
      S_h2po4_in2 = Slurry_Out.S_ip - S_hpo4_in2 - S_po4_in2;
      Alk_mol_in2 = Alk_in2 / 100 * 2 / 1000 "mol/L";
      S_hco3_in2 = Alk_mol_in2 - (S_ac_ion_in2 + S_pro_ion_in2 + S_bu_ion_in2 + S_va_ion_in2) - S_oh_in2 - (Slurry_Out.S_in - S_nh4_in2) + S_h_in2 - S_hpo4_in2 - 2 * S_po4_in2 "mol/L";
      Slurry_Out.S_ic = S_hco3_in2 * (S_h_in2 + Ka_co2_in2) / Ka_co2_in2 "mol/L";
      Slurry_Out.S_in = Ammonium_in2 / 14 / 1000 "mol/L";
      Slurry_Out.S_ip = Fosfates_in2 / 31 / 1000 "mol/L";
      S_nh4_in2 = Slurry_Out.S_in * S_h_in2 / (Ka_nh4_in2 + S_h_in2) "mol/L";
      Slurry_Out.S_an = S_an_input2 "mol/L";
      Slurry_Out.S_cat = (-S_nh4_in2) - S_h_in2 - 2 * Slurry_Out.S_ca - 2 * Slurry_Out.S_mg + Slurry_Out.S_an + S_hco3_in2 + S_oh_in2 + S_ac_ion_in2 + S_pro_ion_in2 + S_bu_ion_in2 + S_va_ion_in2 + 2 * S_hpo4_in2 + S_h2po4_in2 + 3 * S_po4_in2 "mol/L";
      Slurry_Out.S_ca = Ca_in2;
//entra come totale o come ione? Analisi controioni? Trovo S_cat togliendo i cationi noti.
      Slurry_Out.S_mg = Mg_in2;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Feed_Source_2;

    model Feed_Source_3
      extends ADM1_P.Icons.FeedSource3;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.OtherVariables_Feed3;
      ADM1_P.Interfaces.Feed MaizeSilage_Out annotation(
        Placement(visible = true, transformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      MaizeSilage_Out.Q = -8.22 "m3/d";
      TS_in3 = 340 "gTS/kg";
      VS_in3 = 0.955 * TS_in3 "gVS/kg";
      pH_in3 = 4.3 "-";
      Alk_in3 = 1000 "mgCaCO3/L";
      Ammonium_in3 = 764 "mgN/L";
      Fosfates_in3 = 800 "mgP/L";
      tBMP_VS_in3 = 0.0 "NmLCH4/gVS";
      Ca_in3 = 0.007 "mol/L";
      Mg_in3 = 0.013 "mol/L";
//Computation of soluble gas
      MaizeSilage_Out.S_h2 = S_h2_input3 "gCOD/L";
      MaizeSilage_Out.S_ch4 = S_ch4_input3 "gCOD/L";
//Computation of biomasses
      MaizeSilage_Out.X_su = X_su_input3 "gCOD/L";
      MaizeSilage_Out.X_aa = X_aa_input3 "gCOD/L";
      MaizeSilage_Out.X_fa = X_fa_input3 "gCOD/L";
      MaizeSilage_Out.X_c4 = X_c4_input3 "gCOD/L";
      MaizeSilage_Out.X_pro = X_pro_input3 "gCOD/L";
      MaizeSilage_Out.X_ac = X_ac_input3 "gCOD/L";
      MaizeSilage_Out.X_h2 = X_h2_input3 "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      MaizeSilage_Out.S_ac = 10.40 "gCOD/L";
      MaizeSilage_Out.S_pro = 0.414 "gCOD/L";
      MaizeSilage_Out.S_bu = 0.159 "gCOD/L";
      MaizeSilage_Out.S_va = 0.019 "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      MaizeSilage_Out.S_su = S_su_input3 "gCOD/L";
      MaizeSilage_Out.S_aa = S_aa_input3 "gCOD/L";
      MaizeSilage_Out.S_fa = S_fa_input3 "gCOD/L";
      MaizeSilage_Out.S_i = S_i_input3 "gCOD/L";
//Computation of physical properties
      u_in3 = 1 - TS_in3 / 1000 "fraction of moisture content";
      v_in3 = VS_in3 / TS_in3 "fraction of volatile content";
      d_in3 = 1 / (u_in3 / 1000 + (1 - u_in3) * (v_in3 / 1050 + (1 - v_in3) / 2500)) "g/L, density";
      COD_VFA_in3 = MaizeSilage_Out.S_ac + MaizeSilage_Out.S_pro + MaizeSilage_Out.S_bu + MaizeSilage_Out.S_va "gCOD/L, COD associated to VFA";
//Computation of variables X_c and X_i (Biernacki)
      tBMP_COD_in3 = tBMP_VS_in3 / tCOD_in3 * VS_in3 * d_in3 / 1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
      MaizeSilage_Out.X_c = 0;
      MaizeSilage_Out.f_xi_xc = 0;
      MaizeSilage_Out.f_si_xc = 0.0;
      MaizeSilage_Out.f_pr_xc = 0;
      MaizeSilage_Out.f_li_xc = 0.0;
      MaizeSilage_Out.f_ch_xc = 0.0;
      MaizeSilage_Out.X_i = 0.14 * 440.55;
      MaizeSilage_Out.X_pr = 0.11 * 440.55;
      MaizeSilage_Out.X_li = 0.055 * 440.55;
      MaizeSilage_Out.X_ch = 0.695 * 440.55;
      tCOD_in3 = COD_VFA_in3 + MaizeSilage_Out.X_pr + MaizeSilage_Out.X_li + MaizeSilage_Out.X_ch + MaizeSilage_Out.X_i "gCOD/L, total COD as sum of total CH, PR, LI and VFA";
      pCOD_in3 = tCOD_in3 - COD_VFA_in3 "gCOD/L, particulate COD";
//Computation of ionic components
      Ka_co2_in3 = 10 ^ (-pKa_co2) * exp(deltaH0_Ka_co2 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4_in3 = 10 ^ (-pKa_nh3) * exp(deltaH0_Ka_nh4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o_in3 = 10 ^ (-pKa_h2o) * exp(deltaH0_Ka_h2o / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4_in3 = 10 ^ (-pKa_h2po4) * exp(deltaH0_Ka_h2po4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4_in3 = 10 ^ (-pKa_hpo4) * exp(deltaH0_Ka_hpo4 / (R * 100) * (1 / T_ref - 1 / T_op_mean)) * convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      S_h_in3 = 10 ^ (-pH_in3) "mol/L";
      S_oh_in3 = Ka_h2o_in3 / S_h_in3 "mol/L";
      S_ac_mol_in3 = MaizeSilage_Out.S_ac / Ac_conv "mol/L";
      S_pro_mol_in3 = MaizeSilage_Out.S_pro / Pro_conv "mol/L";
      S_bu_mol_in3 = MaizeSilage_Out.S_bu / Bu_conv "mol/L";
      S_va_mol_in3 = MaizeSilage_Out.S_va / Va_conv "mol/L";
      S_ac_ion_in3 = Ka_ac * S_ac_mol_in3 / (S_h_in3 + Ka_ac) "mol/L";
      S_pro_ion_in3 = Ka_pro * S_pro_mol_in3 / (S_h_in3 + Ka_pro) "mol/L";
      S_bu_ion_in3 = Ka_bu * S_bu_mol_in3 / (S_h_in3 + Ka_bu) "mol/L";
      S_va_ion_in3 = Ka_va * S_va_mol_in3 / (S_h_in3 + Ka_va) "mol/L";
      S_hpo4_in3 = Ka_h2po4_in3 * MaizeSilage_Out.S_ip / (Ka_h2po4_in3 + S_h_in3 + Ka_h2po4_in3 * Ka_hpo4_in3 / S_h_in3) "mol/L";
      S_po4_in3 = Ka_hpo4_in3 * MaizeSilage_Out.S_ip / (Ka_hpo4_in3 + S_h_in3 + S_h_in3 ^ 2 / Ka_h2po4_in3) "mol/L";
      S_h2po4_in3 = MaizeSilage_Out.S_ip - S_hpo4_in3 - S_po4_in3;
      Alk_mol_in3 = Alk_in3 / 100 * 2 / 1000 "mol/L";
      S_hco3_in3 = Alk_mol_in3 - (S_ac_ion_in3 + S_pro_ion_in3 + S_bu_ion_in3 + S_va_ion_in3) - S_oh_in3 - (MaizeSilage_Out.S_in - S_nh4_in3) + S_h_in3 - S_hpo4_in3 - 2 * S_po4_in3 "mol/L";
      MaizeSilage_Out.S_ic = S_hco3_in3 * (S_h_in3 + Ka_co2_in3) / Ka_co2_in3 "mol/L";
      MaizeSilage_Out.S_in = Ammonium_in3 / 14 / 1000 "mol/L";
      MaizeSilage_Out.S_ip = Fosfates_in3 / 31 / 1000 "mol/L";
      S_nh4_in3 = MaizeSilage_Out.S_in * S_h_in3 / (Ka_nh4_in3 + S_h_in3) "mol/L";
      MaizeSilage_Out.S_an = S_an_input3 "mol/L";
      MaizeSilage_Out.S_cat = (-S_nh4_in3) - S_h_in3 - 2 * MaizeSilage_Out.S_ca - 2 * MaizeSilage_Out.S_mg + MaizeSilage_Out.S_an + S_hco3_in3 + S_oh_in3 + S_ac_ion_in3 + S_pro_ion_in3 + S_bu_ion_in3 + S_va_ion_in3 + 2 * S_hpo4_in3 + S_h2po4_in3 + 3 * S_po4_in3 "mol/L";
      MaizeSilage_Out.S_ca = Ca_in3;
//entra come totale o come ione? Analisi controioni? Trovo S_cat togliendo i cationi noti.
      MaizeSilage_Out.S_mg = Mg_in3;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        Diagram(graphics = {Rectangle(extent = {{-66, 2}, {-66, 2}})}));
    end Feed_Source_3;

    model Feeding_Tank
      extends ADM1_P.Icons.FeedingTank;
      ADM1_P.Interfaces.Feed Manure_In annotation(
        Placement(visible = true, transformation(origin = {-80, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-72, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed Slurry_In annotation(
        Placement(visible = true, transformation(origin = {-78, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-72, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed FeedMix_Out annotation(
        Placement(visible = true, transformation(origin = {80, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {74, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed MaizeSilage_In annotation(
        Placement(visible = true, transformation(origin = {-76, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-72, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Fractions_Out[9] annotation(
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {74, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real CODin;
      Real CODout;
    equation
      Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q + FeedMix_Out.Q = 0;
      (Manure_In.S_su * Manure_In.Q + Slurry_In.S_su * Slurry_In.Q + MaizeSilage_In.S_su * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_su;
      (Manure_In.S_aa * Manure_In.Q + Slurry_In.S_aa * Slurry_In.Q + MaizeSilage_In.S_aa * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_aa;
      (Manure_In.S_fa * Manure_In.Q + Slurry_In.S_fa * Slurry_In.Q + MaizeSilage_In.S_fa * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_fa;
      (Manure_In.S_va * Manure_In.Q + Slurry_In.S_va * Slurry_In.Q + MaizeSilage_In.S_va * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_va;
      (Manure_In.S_bu * Manure_In.Q + Slurry_In.S_bu * Slurry_In.Q + MaizeSilage_In.S_bu * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_bu;
      (Manure_In.S_pro * Manure_In.Q + Slurry_In.S_pro * Slurry_In.Q + MaizeSilage_In.S_pro * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_pro;
      (Manure_In.S_ac * Manure_In.Q + Slurry_In.S_ac * Slurry_In.Q + MaizeSilage_In.S_ac * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ac;
      (Manure_In.S_h2 * Manure_In.Q + Slurry_In.S_h2 * Slurry_In.Q + MaizeSilage_In.S_h2 * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_h2;
      (Manure_In.S_ch4 * Manure_In.Q + Slurry_In.S_ch4 * Slurry_In.Q + MaizeSilage_In.S_ch4 * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ch4;
      (Manure_In.S_ic * Manure_In.Q + Slurry_In.S_ic * Slurry_In.Q + MaizeSilage_In.S_ic * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ic;
      (Manure_In.S_in * Manure_In.Q + Slurry_In.S_in * Slurry_In.Q + MaizeSilage_In.S_in * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_in;
      (Manure_In.S_ip * Manure_In.Q + Slurry_In.S_ip * Slurry_In.Q + MaizeSilage_In.S_ip * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ip;
      (Manure_In.S_i * Manure_In.Q + Slurry_In.S_i * Slurry_In.Q + MaizeSilage_In.S_i * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_i;
      (Manure_In.S_cat * Manure_In.Q + Slurry_In.S_cat * Slurry_In.Q + MaizeSilage_In.S_cat * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_cat;
      (Manure_In.S_ca * Manure_In.Q + Slurry_In.S_ca * Slurry_In.Q + MaizeSilage_In.S_ca * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ca;
      (Manure_In.S_mg * Manure_In.Q + Slurry_In.S_mg * Slurry_In.Q + MaizeSilage_In.S_mg * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_mg;
      (Manure_In.S_an * Manure_In.Q + Slurry_In.S_an * Slurry_In.Q + MaizeSilage_In.S_an * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_an;
      (Manure_In.X_c * Manure_In.Q + Slurry_In.X_c * Slurry_In.Q + MaizeSilage_In.X_c * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_c;
      (Manure_In.X_ch * Manure_In.Q + Slurry_In.X_ch * Slurry_In.Q + MaizeSilage_In.X_ch * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_ch;
      (Manure_In.X_pr * Manure_In.Q + Slurry_In.X_pr * Slurry_In.Q + MaizeSilage_In.X_pr * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_pr;
      (Manure_In.X_li * Manure_In.Q + Slurry_In.X_li * Slurry_In.Q + MaizeSilage_In.X_li * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_li;
      (Manure_In.X_su * Manure_In.Q + Slurry_In.X_su * Slurry_In.Q + MaizeSilage_In.X_su * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_su;
      (Manure_In.X_aa * Manure_In.Q + Slurry_In.X_aa * Slurry_In.Q + MaizeSilage_In.X_aa * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_aa;
      (Manure_In.X_fa * Manure_In.Q + Slurry_In.X_fa * Slurry_In.Q + MaizeSilage_In.X_fa * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_fa;
      (Manure_In.X_c4 * Manure_In.Q + Slurry_In.X_c4 * Slurry_In.Q + MaizeSilage_In.X_c4 * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_c4;
      (Manure_In.X_pro * Manure_In.Q + Slurry_In.X_pro * Slurry_In.Q + MaizeSilage_In.X_pro * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_pro;
      (Manure_In.X_ac * Manure_In.Q + Slurry_In.X_ac * Slurry_In.Q + MaizeSilage_In.X_ac * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_ac;
      (Manure_In.X_h2 * Manure_In.Q + Slurry_In.X_h2 * Slurry_In.Q + MaizeSilage_In.X_h2 * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_h2;
      (Manure_In.X_i * Manure_In.Q + Slurry_In.X_i * Slurry_In.Q + MaizeSilage_In.X_i * MaizeSilage_In.Q) / (Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_i;
//  MaizeSilage_In.f_si_xc = FeedMix_Out.f_si_xc;
//  MaizeSilage_In.f_xi_xc = FeedMix_Out.f_xi_xc;
//  MaizeSilage_In.f_ch_xc = FeedMix_Out.f_ch_xc;
//  MaizeSilage_In.f_pr_xc = FeedMix_Out.f_pr_xc;
//  MaizeSilage_In.f_li_xc = FeedMix_Out.f_li_xc;
      0 = FeedMix_Out.f_si_xc;
      0 = FeedMix_Out.f_xi_xc;
      0 = FeedMix_Out.f_ch_xc;
      0 = FeedMix_Out.f_pr_xc;
      0 = FeedMix_Out.f_li_xc;
      Fractions_Out[1] = -Manure_In.X_ch * Manure_In.Q / (FeedMix_Out.X_ch * FeedMix_Out.Q);
      Fractions_Out[2] = -Slurry_In.X_ch * Slurry_In.Q / (FeedMix_Out.X_ch * FeedMix_Out.Q);
      Fractions_Out[3] = -MaizeSilage_In.X_ch * MaizeSilage_In.Q / (FeedMix_Out.X_ch * FeedMix_Out.Q);
      Fractions_Out[4] = -Manure_In.X_pr * Manure_In.Q / (FeedMix_Out.X_pr * FeedMix_Out.Q);
      Fractions_Out[5] = -Slurry_In.X_pr * Slurry_In.Q / (FeedMix_Out.X_pr * FeedMix_Out.Q);
      Fractions_Out[6] = -MaizeSilage_In.X_pr * MaizeSilage_In.Q / (FeedMix_Out.X_pr * FeedMix_Out.Q);
      Fractions_Out[7] = -Manure_In.X_li * Manure_In.Q / (FeedMix_Out.X_li * FeedMix_Out.Q);
      Fractions_Out[8] = -Slurry_In.X_li * Slurry_In.Q / (FeedMix_Out.X_li * FeedMix_Out.Q);
      Fractions_Out[9] = -MaizeSilage_In.X_li * MaizeSilage_In.Q / (FeedMix_Out.X_li * FeedMix_Out.Q);
//Verify balance
      CODout = FeedMix_Out.Q * (FeedMix_Out.S_aa + FeedMix_Out.S_ac + FeedMix_Out.S_bu + FeedMix_Out.S_ch4 + FeedMix_Out.S_fa + FeedMix_Out.S_h2 + FeedMix_Out.S_i + FeedMix_Out.S_pro + FeedMix_Out.S_su + FeedMix_Out.S_va + FeedMix_Out.X_aa + FeedMix_Out.X_ac + FeedMix_Out.X_c4 + FeedMix_Out.X_fa + FeedMix_Out.X_h2 + FeedMix_Out.X_pro + FeedMix_Out.X_su + FeedMix_Out.X_ch + FeedMix_Out.X_c + FeedMix_Out.X_i + FeedMix_Out.X_li + FeedMix_Out.X_pr);
      CODin = Manure_In.Q * (Manure_In.S_aa + Manure_In.S_ac + Manure_In.S_bu + Manure_In.S_ch4 + Manure_In.S_fa + FeedMix_Out.S_h2 + Manure_In.S_i + Manure_In.S_pro + Manure_In.S_su + Manure_In.S_va + Manure_In.X_aa + Manure_In.X_ac + Manure_In.X_c4 + Manure_In.X_fa + Manure_In.X_h2 + Manure_In.X_pro + Manure_In.X_su + Manure_In.X_ch + Manure_In.X_c + Manure_In.X_i + Manure_In.X_li + Manure_In.X_pr);
      annotation(
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Feeding_Tank;

    model Digester
      extends ADM1_P.Icons.Digester;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_kinetic;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.StateVariablesADM1;
      extends ADM1_P.OtherVariables_MassBalance;
      ADM1_P.Interfaces.Feed FeedMix_In annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Digestate Digestate_Out annotation(
        Placement(visible = true, transformation(origin = {72, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
      //MPP submodel
      Types.MolarDensity_M X_acp(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
      Types.MolarDensity_M X_stru(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
      Types.MolarDensity_M a_ca(nominal = 1e-5) "mol/L";
      Types.MolarDensity_M a_po4(nominal = 1e-9) "mol/L";
      Types.MolarDensity_M a_nh4(nominal = 1e-2) "mol/L";
      Types.MolarDensity_M a_mg(nominal = 1e-5) "mol/L";
      Real rp1;
      Real rp2;
      Modelica.SIunits.PerUnit SI_stru(nominal = 1);
      Modelica.SIunits.PerUnit SI_acp(nominal = 1);
      Real I;
      Real g_ca;
      Real g_po4;
      Real g_nh4;
      Real g_mg;
      Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
      Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
      constant Real z_ca = 2;
      constant Real z_po4 = -3;
      constant Real z_mg = 2;
      constant Real z_nh4 = 1;
      constant Real deltaH0_Ksp_stru(unit = "J/kmol") = 22600 "enthalpy of reaction of struvite formation. Rontenltap et al 2007 as 22.6 kJ/mol";
      constant Real deltaH0_Ksp_acp(unit = "J/kmol") = 22600 "enthalpy of reaction of calcium phosphate formation??";
      parameter Real pKsp_acp(unit = "conc") = 28.92 "New value from PCM?";
      parameter Real kcryst_acp(unit = "d-1") = 3 * (24 * 60);
      parameter Real pKsp_stru(unit = "conc") = 13.6 "New value from PCM? Also Ronteltap et al. 2007";
      parameter Real kcryst_stru(unit = "d-1") = 5 * (24 * 60);
  Modelica.Blocks.Interfaces.RealInput Fractions_In[9] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
//Inputs
      f_ch1 = Fractions_In[1];
      f_ch2 = Fractions_In[2];
      f_ch3 = Fractions_In[3];
      f_pr1 = Fractions_In[4];
      f_pr2 = Fractions_In[5];
      f_pr3 = Fractions_In[6];
      f_li1 = Fractions_In[7];
      f_li2 = Fractions_In[8];
      f_li3 = Fractions_In[9];
//MMP submodel
//I = 0.5*(S_ca*(z_ca)^2+S_po4*(z_po4)^2+S_nh4*(z_nh4)^2+S_mg*(z_mg)^2) "S_h and S_oh are included? Come faccio con S_cat e S_an? Che cariche hanno i VFA?";
      I = 0.5 * (S_ca * z_ca ^ 2 + S_po4 * z_po4 ^ 2 + S_nh4 * z_nh4 ^ 2 + S_mg * z_mg ^ 2 + S_hpo4 * 2 ^ 2 + S_h2po4 * 1 ^ 2 + S_hco3 * 1 ^ 2 + S_cat * 1 ^ 2 + S_an * 1 ^ 2);
      g_ca = 10 ^ (-0.5 * z_ca ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_po4 = 10 ^ (-0.5 * z_po4 ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_mg = 10 ^ (-0.5 * z_mg ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_nh4 = 10 ^ (-0.5 * z_nh4 ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      a_ca = g_ca * S_ca;
      a_po4 = g_po4 * S_po4;
      a_mg = g_mg * S_mg;
      a_nh4 = g_nh4 * S_nh4;
      Ksp_acp = 10 ^ (-pKsp_acp) * exp(deltaH0_Ksp_acp / (R * 100) * (1 / T_ref - 1 / T_op));
      Ksp_stru = 10 ^ (-pKsp_stru) * exp(deltaH0_Ksp_stru / (R * 100) * (1 / T_ref - 1 / T_op));
      SI_acp = log(a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp) / abs(log(a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp));
      SI_stru = log(a_nh4 * a_po4 * a_mg / Ksp_stru) / abs(log(a_nh4 * a_po4 * a_mg / Ksp_stru));
      rp1 = kcryst_acp * X_acp * ((a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp) ^ (1 / 5) - 1) ^ 2 * SI_acp;
      rp2 = kcryst_stru * X_stru * ((a_nh4 * a_po4 * a_mg / Ksp_stru) ^ (1 / 3) - 1) ^ 2 * SI_stru;
      24 * 3600 * der(X_acp) = FeedMix_In.Q / V_liq * (-X_acp) + rp1;
      24 * 3600 * der(X_stru) = FeedMix_In.Q / V_liq * (-X_stru) + rp2;
//
//TEMPERATURE DEPENDENT PARAMETERS
//Acidity constants with temperature correction
      Ka_co2 = 10 ^ (-pKa_co2) * exp(deltaH0_Ka_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10 ^ (-pKa_nh3) * exp(deltaH0_Ka_nh4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10 ^ (-pKa_h2o) * exp(deltaH0_Ka_h2o / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10 ^ (-pKa_h2po4) * exp(deltaH0_Ka_h2po4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10 ^ (-pKa_hpo4) * exp(deltaH0_Ka_hpo4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "HPO4 acidity constant with temperature correction - unit = M";
      Ka_h3po4 = 10 ^ (-pKa_h3po4) * exp(deltaH0_Ka_h3po4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "H3PO4 acidity constant with temperature correction - unit = M";
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4 * exp(deltaH0_KH_ch4 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2 * exp(deltaH0_KH_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2 * exp(deltaH0_KH_h2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
//Others with temperature correction
      p_gas_h2o = coeffph20_p * exp(coeffph20_T * (1 / T_ref - 1 / T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_hyd_ch1_T = k_hyd_ch1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr1_T = k_hyd_pr1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li1_T = k_hyd_li1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_ch2_T = k_hyd_ch2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr2_T = k_hyd_pr2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li2_T = k_hyd_li2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_ch3_T = k_hyd_ch3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr3_T = k_hyd_pr3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li3_T = k_hyd_li3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_m_su_T = k_m_su * exp(th_k_m_su * (T_op - T_ref_k));
      k_m_aa_T = k_m_aa * exp(th_k_m_aa * (T_op - T_ref_k));
      k_m_fa_T = k_m_fa * exp(th_k_m_fa * (T_op - T_ref_k));
      k_m_pro_T = k_m_pro * exp(th_k_m_pro * (T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac * exp(th_k_m_ac * (T_op - T_ref_k));
      k_m_h2_T = k_m_h2 * exp(th_k_m_h2 * (T_op - T_ref_k));
      Ks_su_T = Ks_su * exp(th_Ks_su * (T_op - T_ref_k));
      Ks_aa_T = Ks_aa * exp(th_Ks_aa * (T_op - T_ref_k));
      Ks_fa_T = Ks_fa * exp(th_Ks_fa * (T_op - T_ref_k));
      Ks_pro_T = Ks_pro * exp(th_Ks_pro * (T_op - T_ref_k));
//Ks_c4_T = Ks_c4 * exp(th_Ks_c4*(T_op - T_ref_k)); not found
      Ks_ac_T = Ks_ac * exp(th_Ks_ac * (T_op - T_ref_k));
      Ks_h2_T = Ks_h2 * exp(th_Ks_h2 * (T_op - T_ref_k));
      k_dec_su_T = k_dec_su * exp(th_k_dec_su * (T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa * exp(th_k_dec_aa * (T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa * exp(th_k_dec_fa * (T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro * exp(th_k_dec_pro * (T_op - T_ref_k));
//k_dec_c4_T = k_dec_c4 * exp(th_k_dec_c4*(T_op - T_ref_k)); not found
      k_dec_ac_T = k_dec_ac * exp(th_k_dec_ac * (T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2 * exp(th_k_dec_h2 * (T_op - T_ref_k));
//
//INHIBITION
      pH = -log10(S_h);
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3 * ((pH - pH_UL_aa) / (pH_UL_aa - pH_LL_aa)) ^ 2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3 * ((pH - pH_UL_ac) / (pH_UL_ac - pH_LL_ac)) ^ 2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3 * ((pH - pH_UL_h2) / (pH_UL_h2 - pH_LL_h2)) ^ 2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1 / (1 + Ks_IN / S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1 / (1 + Ks_IP / S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1 / (1 + S_h2 / Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1 / (1 + S_h2 / Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1 / (1 + S_h2 / Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1 / (1 + S_nh3 / Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa * I_in_lim * I_ip_lim;
      I_6 = I_pH_aa * I_in_lim * I_ip_lim;
      I_7 = I_pH_aa * I_in_lim * I_h2_fa * I_ip_lim;
      I_8 = I_pH_aa * I_in_lim * I_h2_c4 * I_ip_lim;
      I_9 = I_pH_aa * I_in_lim * I_h2_c4 * I_ip_lim;
      I_10 = I_pH_aa * I_in_lim * I_h2_pro * I_ip_lim;
      I_11 = I_pH_ac * I_in_lim * I_nh3 * I_ip_lim;
      I_12 = I_pH_h2 * I_in_lim * I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-C_xc) + FeedMix_In.f_si_xc * C_si + FeedMix_In.f_ch_xc * C_ch + FeedMix_In.f_pr_xc * C_pr + FeedMix_In.f_li_xc * C_li + FeedMix_In.f_xi_xc * C_xi;
      v2 = (-C_ch) + C_su;
      v3 = (-C_pr) + C_aa;
      v4 = (-C_li) + (1 - f_fa_li) * C_su + f_fa_li * C_fa;
      v5 = (-C_su) + (1 - Y_su) * (f_bu_su * C_bu + f_pro_su * C_pro + f_ac_su * C_ac) + Y_su * C_bac;
      v6 = (-C_aa) + (1 - Y_aa) * (f_va_aa * C_va + f_bu_aa * C_bu + f_pro_aa * C_aa + f_ac_aa * C_aa) + Y_aa * C_bac;
      v7 = (-C_fa) + (1 - Y_fa) * 0.7 * C_ac + Y_fa * C_bac;
      v8 = (-C_va) + (1 - Y_c4) * 0.54 * C_pro + (1 - Y_c4) * 0.31 * C_ac + Y_c4 * C_bac;
      v9 = (-C_bu) + (1 - Y_c4) * 0.8 * C_ac + Y_c4 * C_bac;
      v10 = (-C_pro) + (1 - Y_pro) * 0.57 * C_ac + Y_pro * C_bac;
      v11 = (-C_ac) + (1 - Y_ac) * C_ch4 + Y_ac * C_bac;
      v12 = (1 - Y_h2) * C_ch4 + Y_h2 * C_bac;
      v13 = (-C_bac) + C_pr * f_pr_xb + C_ch * f_ch_xb + C_li * f_li_xb + C_xi * f_xi_xb + C_si * f_si_xb;
//RATES
//Biochemical process rates
      r1 = 0 "k_dis * X_c";
      r2_1 = f_ch1 * k_hyd_ch1_T * X_ch;
      r2_2 = f_ch2 * k_hyd_ch2_T * X_ch;
      r2_3 = f_ch3 * k_hyd_ch3_T * X_ch;
      r3_1 = f_pr1 * k_hyd_pr1_T * X_pr;
      r3_2 = f_pr2 * k_hyd_pr2_T * X_pr;
      r3_3 = f_pr3 * k_hyd_pr3_T * X_pr;
      r4_1 = f_li1 * k_hyd_li1_T * X_li;
      r4_2 = f_li2 * k_hyd_li2_T * X_li;
      r4_3 = f_li3 * k_hyd_li3_T * X_li;
      r5 = k_m_su_T * S_su / (S_su + Ks_su_T) * X_su * I_5;
      r6 = k_m_aa_T * S_aa / (S_aa + Ks_aa_T) * X_aa * I_6;
      r7 = k_m_fa_T * S_fa / (S_fa + Ks_fa_T) * X_fa * I_7;
      r8 = k_m_c4 * S_va / (S_va + Ks_c4) * X_c4 * S_va / (S_bu + S_va + epsilon) * I_8;
      r9 = k_m_c4 * S_bu / (S_bu + Ks_c4) * X_c4 * S_bu / (S_bu + S_va + epsilon) * I_9;
      r10 = k_m_pro_T * S_pro / (S_pro + Ks_pro_T) * X_pro * I_10;
      r11 = k_m_ac_T * S_ac / (S_ac + Ks_ac_T) * X_ac * I_11;
      r12 = k_m_h2_T * S_h2 / (S_h2 + Ks_h2_T) * X_h2 * I_12;
      r13 = k_dec_su_T * X_su;
      r14 = k_dec_aa_T * X_aa;
      r15 = k_dec_fa_T * X_fa;
      r16 = k_dec_c4 * X_c4;
      r17 = k_dec_pro_T * X_pro;
      r18 = k_dec_ac_T * X_ac;
      r19 = k_dec_h2_T * X_h2;
//
//Acid-base rates
      ra4 = k_AB_va * (S_vam * (Ka_va + S_h) - Ka_va * S_va);
      ra5 = k_AB_bu * (S_bum * (Ka_bu + S_h) - Ka_bu * S_bu);
      ra6 = k_AB_pro * (S_prom * (Ka_pro + S_h) - Ka_pro * S_pro);
      ra7 = k_AB_ac * (S_acm * (Ka_ac + S_h) - Ka_ac * S_ac);
      ra10 = k_AB_co2 * (S_hco3 * (Ka_co2 + S_h) - Ka_co2 * S_ic);
      ra11 = k_AB_IN * (S_nh3 * (Ka_nh4 + S_h) - Ka_nh4 * S_in);
      ra12 = k_AB_IP * (S_hpo4 * (Ka_h2po4 + S_h + Ka_h2po4 * Ka_hpo4 / S_h) - Ka_h2po4 * S_ip);
      ra13 = k_AB_IP * (S_po4 * (Ka_hpo4 + S_h + S_h ^ 2 / Ka_h2po4) - Ka_hpo4 * S_ip);
//
//Gas transfer rates
      rt8 = kla * (S_h2 - 16 * KH_h2 * p_gas_h2);
      rt9 = kla * (S_ch4 - 64 * KH_ch4 * p_gas_ch4);
      rt10 = kla * (S_co2 - KH_co2 * p_gas_co2);
//
//WATER PHASE EQUATIONS
      FeedMix_In.Q + Digestate_Out.Q = 0;
//
//Particulate matter
      24 * 3600 * der(X_c) = FeedMix_In.Q / V_liq * (FeedMix_In.X_c - X_c) - r1 "+ r13 + r14 + r15 + r16 + r17 + r18 + r19";
      24 * 3600 * der(X_ch) = FeedMix_In.Q / V_liq * (FeedMix_In.X_ch - X_ch) + FeedMix_In.f_ch_xc * r1 - r2_1 - r2_2 - r2_3 + f_ch_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_pr) = FeedMix_In.Q / V_liq * (FeedMix_In.X_pr - X_pr) + FeedMix_In.f_pr_xc * r1 - r3_1 - r3_2 - r3_2 + f_pr_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_li) = FeedMix_In.Q / V_liq * (FeedMix_In.X_li - X_li) + FeedMix_In.f_li_xc * r1 - r4_1 - r4_2 - r4_3 + f_li_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_i) = FeedMix_In.Q / V_liq * (FeedMix_In.X_i - X_i) + FeedMix_In.f_xi_xc * r1 + f_xi_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
//
//Soluble matter
      24 * 3600 * der(S_i) = FeedMix_In.Q / V_liq * (FeedMix_In.S_i - S_i) + FeedMix_In.f_si_xc * r1 + f_si_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(S_su) = FeedMix_In.Q / V_liq * (FeedMix_In.S_su - S_su) + r2_1 + r2_2 + r2_3 + (1 - f_fa_li) * (r4_1 + r4_2 + r4_3) - r5;
      24 * 3600 * der(S_aa) = FeedMix_In.Q / V_liq * (FeedMix_In.S_aa - S_aa) + r3_1 + r3_2 + r3_3 - r6;
      24 * 3600 * der(S_fa) = FeedMix_In.Q / V_liq * (FeedMix_In.S_fa - S_fa) + f_fa_li * (r4_1 + r4_2 + r4_3) - r7;
      24 * 3600 * der(S_va) = FeedMix_In.Q / V_liq * (FeedMix_In.S_va - S_va) + (1 - Y_aa) * f_va_aa * r6 - r8;
      24 * 3600 * der(S_bu) = FeedMix_In.Q / V_liq * (FeedMix_In.S_bu - S_bu) + (1 - Y_su) * f_bu_su * r5 + (1 - Y_aa) * f_bu_aa * r6 - r9;
      24 * 3600 * der(S_pro) = FeedMix_In.Q / V_liq * (FeedMix_In.S_pro - S_pro) + (1 - Y_su) * f_pro_su * r5 + (1 - Y_aa) * f_pro_aa * r6 + (1 - Y_c4) * 0.54 * r8 - r10;
      24 * 3600 * der(S_ac) = FeedMix_In.Q / V_liq * (FeedMix_In.S_ac - S_ac) + (1 - Y_su) * f_ac_su * r5 + (1 - Y_aa) * f_ac_aa * r6 + (1 - Y_fa) * 0.7 * r7 + (1 - Y_c4) * 0.31 * r8 + (1 - Y_c4) * 0.8 * r9 + (1 - Y_pro) * 0.57 * r10 - r11;
      24 * 3600 * der(S_h2) = FeedMix_In.Q / V_liq * (FeedMix_In.S_h2 - S_h2) + (1 - Y_su) * f_h2_su * r5 + (1 - Y_aa) * f_h2_aa * r6 + (1 - Y_fa) * 0.3 * r7 + (1 - Y_c4) * 0.15 * r8 + (1 - Y_c4) * 0.2 * r9 + (1 - Y_pro) * 0.43 * r10 - r12 - rt8;
      24 * 3600 * der(S_ch4) = FeedMix_In.Q / V_liq * (FeedMix_In.S_ch4 - S_ch4) + (1 - Y_ac) * r11 + (1 - Y_h2) * r12 - rt9;
      24 * 3600 * der(S_ic) = FeedMix_In.Q / V_liq * (FeedMix_In.S_ic - S_ic) - (v1 * r1 + v2 * (r2_1 + r2_2 + r2_3) + v3 * (r3_1 + r3_2 + r3_3) + v4 * (r4_1 + r4_2 + r4_3) + v5 * r5 + v6 * r6 + v7 * r7 + v8 * r8 + v9 * r9 + v10 * r10 + v11 * r11 + v12 * r12 + v13 * (r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10;
      24 * 3600 * der(S_in) = FeedMix_In.Q / V_liq * (FeedMix_In.S_in - S_in) - Y_su * N_bac * r5 + (N_aa - Y_aa * N_bac) * r6 - Y_fa * N_bac * r7 - Y_c4 * N_bac * r8 - Y_c4 * N_bac * r9 - Y_pro * N_bac * r10 - Y_ac * N_bac * r11 - Y_h2 * N_bac * r12 + (N_bac - N_i * f_xi_xb - N_aa * f_pr_xb) * (r13 + r14 + r15 + r16 + r17 + r18 + r19) - rp2;
      24 * 3600 * der(S_ip) = FeedMix_In.Q / V_liq * (FeedMix_In.S_ip - S_ip) + P_li * (r4_1 + r4_2 + r4_3) - Y_su * P_bac * r5 - Y_aa * P_bac * r6 - Y_fa * P_bac * r7 - Y_c4 * P_bac * r8 - Y_c4 * P_bac * r9 - Y_pro * P_bac * r10 - Y_ac * P_bac * r11 - Y_h2 * P_bac * r12 + (P_bac - P_i * f_xi_xb - P_li * f_li_xb) * (r13 + r14 + r15 + r16 + r17 + r18 + r19) - 2 * rp1 - rp2;
//
//Biomasses
      24 * 3600 * der(X_su) = FeedMix_In.Q / V_liq * (FeedMix_In.X_su - X_su) + Y_su * r5 - r13;
      24 * 3600 * der(X_aa) = FeedMix_In.Q / V_liq * (FeedMix_In.X_aa - X_aa) + Y_aa * r6 - r14;
      24 * 3600 * der(X_fa) = FeedMix_In.Q / V_liq * (FeedMix_In.X_fa - X_fa) + Y_fa * r7 - r15;
      24 * 3600 * der(X_c4) = FeedMix_In.Q / V_liq * (FeedMix_In.X_c4 - X_c4) + Y_c4 * r8 + Y_c4 * r9 - r16;
      24 * 3600 * der(X_pro) = FeedMix_In.Q / V_liq * (FeedMix_In.X_pro - X_pro) + Y_pro * r10 - r17;
      24 * 3600 * der(X_ac) = FeedMix_In.Q / V_liq * (FeedMix_In.X_ac - X_ac) + Y_ac * r11 - r18;
      24 * 3600 * der(X_h2) = FeedMix_In.Q / V_liq * (FeedMix_In.X_h2 - X_h2) + Y_h2 * r12 - r19;
//
//Cations and anions
      24 * 3600 * der(S_cat) = FeedMix_In.Q / V_liq * (FeedMix_In.S_cat - S_cat);
      24 * 3600 * der(S_ca) = FeedMix_In.Q / V_liq * (FeedMix_In.S_ca - S_ca) - 3 * rp1;
      24 * 3600 * der(S_mg) = FeedMix_In.Q / V_liq * (FeedMix_In.S_mg - S_mg) - rp2;
      24 * 3600 * der(S_an) = FeedMix_In.Q / V_liq * (FeedMix_In.S_an - S_an);
      24 * 3600 * der(S_vam) = -ra4;
      24 * 3600 * der(S_bum) = -ra5;
      24 * 3600 * der(S_prom) = -ra6;
      24 * 3600 * der(S_acm) = -ra7;
      24 * 3600 * der(S_hco3) = -ra10;
      24 * 3600 * der(S_nh3) = -ra11;
      24 * 3600 * der(S_hpo4) = -ra12;
      24 * 3600 * der(S_po4) = -ra13;
      S_nh4 = S_in - S_nh3;
      S_co2 = S_ic - S_hco3;
      S_oh = Ka_h2o * convKa / S_h;
      S_h2po4 = S_ip - S_hpo4 - S_po4;
//AE
    //  S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
    //  Theta = S_cat + S_nh4 + 2 * S_ca + 2 * S_mg - S_hco3 - S_acm / Ac_conv - S_prom / Pro_conv - S_bum / Bu_conv - S_vam / Va_conv - S_an - 2 * S_hpo4 - S_h2po4 - 3 * S_po4;
//ODE;
      Theta = 0;
      der(S_h) = (der(S_an) + Ka_nh4 / (Ka_nh4 + S_h) * der(S_in) + Ka_co2 / (Ka_co2 + S_h) * der(S_ic) + 1 / Ac_conv * Ka_ac / (Ka_ac + S_h) * der(S_ac) + 1 / Pro_conv * Ka_pro / (Ka_pro + S_h) * der(S_pro) + 1 / Bu_conv * Ka_bu / (Ka_bu + S_h) * der(S_bu) + 1 / Va_conv * Ka_va / (Ka_va + S_h) * der(S_va) + 2*(Ka_h2po4*der(S_ip)/(Ka_h2po4+S_h+Ka_h2po4*Ka_hpo4/S_h)) + (Ka_h3po4*der(S_ip)/(Ka_h3po4+Ka_h2po4*Ka_h3po4/S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h)^2)) + 3*(Ka_hpo4*der(S_ip)/(Ka_hpo4+S_h+(S_h)^2/Ka_h2po4)) - der(S_in) - der(S_cat)- 2 * der(S_mg) - 2 * der(S_ca)) / (1 + Ka_nh4 * S_in / (Ka_nh4 + S_h) ^ 2 + Ka_co2 * S_ic / (Ka_co2 + S_h) ^ 2 + 1 / Ac_conv * Ka_ac * S_ac / (Ka_ac + S_h) ^ 2 + 1 / Pro_conv * Ka_pro * S_pro / (Ka_pro + S_h) ^ 2 + 1 / Bu_conv * Ka_bu * S_bu / (Ka_bu + S_h) ^ 2 + 1 / Va_conv * Ka_va * S_va / (Ka_va + S_h) ^ 2 + Ka_h2o / S_h ^ 2 + 2*(Ka_h2po4*S_ip-Ka_h2po4^2*Ka_hpo4*S_ip/(S_h)^2/(Ka_h2po4+S_h+Ka_h2po4*Ka_hpo4/S_h)^2) + (-Ka_h3po4^2*S_ip*Ka_h2po4/(S_h)^2-Ka_h3po4^2*Ka_h2po4*Ka_hpo4*S_ip/(S_h)^3/(Ka_h3po4+Ka_h3po4*Ka_h2po4/S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h)^2)^2) + 3*(Ka_hpo4*S_ip+Ka_hpo4*S_ip*2/Ka_h2po4*S_h));
//
//GAS PHASE EQUATIONS
      24 * 3600 * der(S_gas_h2) = (-S_gas_h2 * Q_gas / V_gas) + rt8 * V_liq / V_gas;
      24 * 3600 * der(S_gas_ch4) = (-S_gas_ch4 * Q_gas / V_gas) + rt9 * V_liq / V_gas;
      24 * 3600 * der(S_gas_co2) = (-S_gas_co2 * Q_gas / V_gas) + rt10 * V_liq / V_gas;
      p_gas_h2 = S_gas_h2 * R * T_op / h2_conv;
      p_gas_ch4 = S_gas_ch4 * R * T_op / ch4_conv;
      p_gas_co2 = S_gas_co2 * R * T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
//Q_gas = k_p * (P_gas - P_atm)
      Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas * 273.15 / T_op / P_atm * P_gas "Biogas rate [m3/d] at standard conditions";
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq / FeedMix_In.Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in / V_liq "Organic Loading Rate [kgCOD/m3/d]";
//
//CONVERSION FOR INTERFACE "DIGESTATE"
      Digestate_Out.S_su = S_su;
      Digestate_Out.S_aa = S_aa;
      Digestate_Out.S_fa = S_fa;
      Digestate_Out.S_va = S_va;
      Digestate_Out.S_bu = S_bu;
      Digestate_Out.S_pro = S_pro;
      Digestate_Out.S_ac = S_ac;
      Digestate_Out.S_h2 = S_h2;
      Digestate_Out.S_ch4 = S_ch4;
      Digestate_Out.S_ic = S_ic;
      Digestate_Out.S_in = S_in;
      Digestate_Out.S_ip = S_ip;
      Digestate_Out.S_i = S_i;
      Digestate_Out.S_cat = S_cat;
      Digestate_Out.S_ca = S_ca;
      Digestate_Out.S_mg = S_mg;
      Digestate_Out.S_an = S_an;
      Digestate_Out.X_c = X_c;
      Digestate_Out.X_ch = X_ch;
      Digestate_Out.X_pr = X_pr;
      Digestate_Out.X_li = X_li;
      Digestate_Out.X_su = X_su;
      Digestate_Out.X_aa = X_aa;
      Digestate_Out.X_fa = X_fa;
      Digestate_Out.X_c4 = X_c4;
      Digestate_Out.X_pro = X_pro;
      Digestate_Out.X_ac = X_ac;
      Digestate_Out.X_h2 = X_h2;
      Digestate_Out.X_i = X_i;
      Digestate_Out.S_hco3 = S_hco3;
      Digestate_Out.S_co2 = S_co2;
      Digestate_Out.S_h = S_h;
      Digestate_Out.S_oh = S_oh;
      Digestate_Out.S_nh3 = S_nh3;
      Digestate_Out.S_nh4 = S_nh4;
      Digestate_Out.S_h2po4 = S_h2po4;
      Digestate_Out.S_hpo4 = S_hpo4;
      Digestate_Out.S_acm = S_acm;
      Digestate_Out.S_prom = S_prom;
      Digestate_Out.S_bum = S_bum;
      Digestate_Out.S_vam = S_vam;
      Digestate_Out.S_gas_h2 = S_gas_h2;
      Digestate_Out.S_gas_ch4 = S_gas_ch4;
      Digestate_Out.S_gas_co2 = S_gas_co2;
      Digestate_Out.X_acp = X_acp;
      Digestate_Out.X_stru = X_stru;
//
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.P_gas = P_gas;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
//MASS BALANCES
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_aa + X_ac + X_c4 + X_ch + X_fa + X_h2 + X_i + X_li + X_pr + X_pro + X_su "+X_c; Particulate COD concentration";
      COD_balance_in = FeedMix_In.Q * (FeedMix_In.S_aa + FeedMix_In.S_ac + FeedMix_In.S_bu + FeedMix_In.S_ch4 + FeedMix_In.S_fa + FeedMix_In.S_h2 + FeedMix_In.S_i + FeedMix_In.S_pro + FeedMix_In.S_su + FeedMix_In.S_va + FeedMix_In.X_aa + FeedMix_In.X_ac + FeedMix_In.X_c4 + FeedMix_In.X_fa + FeedMix_In.X_h2 + FeedMix_In.X_pro + FeedMix_In.X_su + FeedMix_In.X_ch + FeedMix_In.X_c + FeedMix_In.X_i + FeedMix_In.X_li + FeedMix_In.X_pr);
      COD_balance_out = Digestate_Out.Q * (COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N * (p_gas_ch4 / (P_gas - p_gas_h2o) / (R / 64 * 273.15 / 1.01325) + p_gas_h2 / (P_gas - p_gas_h2o) / (R / 16 * 273.15 / 1.01325));
      24 * 3600 * der(CH4_cum) = ((1 - Y_ac) * r11 + (1 - Y_h2) * r12) * V_liq;
      24 * 3600 * der(V_in_cum) = FeedMix_In.Q;
      24 * 3600 * der(COD_balance_in_cum) = COD_balance_in;
      24 * 3600 * der(COD_balance_out_cum) = COD_balance_out;
      24 * 3600 * der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = FeedMix_In.Q * (FeedMix_In.S_ic + C_xc * FeedMix_In.X_c + C_si * FeedMix_In.S_i + C_xi * FeedMix_In.X_i + C_ch * FeedMix_In.X_ch + C_pr * FeedMix_In.X_pr + C_li * FeedMix_In.X_li + C_su * FeedMix_In.S_su + C_aa * FeedMix_In.S_aa + C_fa * FeedMix_In.S_fa + C_va * FeedMix_In.S_va + C_bu * FeedMix_In.S_bu + C_pro * FeedMix_In.S_pro + C_ac * FeedMix_In.S_ac + C_ch4 * FeedMix_In.S_ch4 + C_bac * (FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IC_balance_out = Digestate_Out.Q * (S_ic + C_si * S_i + C_xi * X_i + C_ch * X_ch + C_pr * X_pr + C_li * X_li + C_su * S_su + C_aa * S_aa + C_fa * S_fa + C_va * S_va + C_bu * S_bu + C_pro * S_pro + C_ac * S_ac + C_ch4 * S_ch4 + C_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)) "+C_xc * X_c";
      IC_balance_gas = Biogas_Out.Q_gas_N * (C_ch4 * p_gas_ch4 / (P_gas - p_gas_h2o) / (R / 64 * 273.15 / 1.01325) + p_gas_co2 / (P_gas - p_gas_h2o) / R / 273.15 * 1.01325);
      24 * 3600 * der(IC_balance_in_cum) = IC_balance_in;
      24 * 3600 * der(IC_balance_out_cum) = IC_balance_out;
      24 * 3600 * der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = FeedMix_In.Q * (FeedMix_In.S_in + N_i * (FeedMix_In.S_i + FeedMix_In.X_i) + N_aa * (FeedMix_In.S_aa + FeedMix_In.X_pr) + N_bac * (FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IN_balance_out = Digestate_Out.Q * (S_in + N_i * (S_i + X_i) + N_aa * (S_aa + X_pr) + N_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru);
      24 * 3600 * der(IN_balance_in_cum) = IN_balance_in;
      24 * 3600 * der(IN_balance_out_cum) = IN_balance_out;
//Inorganic Phosforous Balance
      IP_balance_in = FeedMix_In.Q * (FeedMix_In.S_ip + P_i * (FeedMix_In.S_i + FeedMix_In.X_i) + P_li * FeedMix_In.X_li + P_bac * (FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IP_balance_out = Digestate_Out.Q * (S_ip + P_i * (S_i + X_i) + P_li * X_li + P_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2 * X_acp + X_stru);
      24 * 3600 * der(IP_balance_in_cum) = IP_balance_in;
      24 * 3600 * der(IP_balance_out_cum) = IP_balance_out;
      24 * 3600 * der(Vcum) = FeedMix_In.Q;
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
    end Digester;
    
    model Postfermenter
      extends ADM1_P.Icons.Digester;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_kinetic;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.StateVariablesADM1;
      extends ADM1_P.OtherVariables_MassBalance;
      ADM1_P.Interfaces.Digestate Digestate_Out annotation(
        Placement(visible = true, transformation(origin = {72, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
      //MPP submodel
      Types.MolarDensity_M X_acp(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
      Types.MolarDensity_M X_stru(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
      Types.MolarDensity_M a_ca(nominal = 1e-5) "mol/L";
      Types.MolarDensity_M a_po4(nominal = 1e-9) "mol/L";
      Types.MolarDensity_M a_nh4(nominal = 1e-2) "mol/L";
      Types.MolarDensity_M a_mg(nominal = 1e-5) "mol/L";
      Real rp1;
      Real rp2;
      Modelica.SIunits.PerUnit SI_stru(nominal = 1);
      Modelica.SIunits.PerUnit SI_acp(nominal = 1);
      Real I;
      Real g_ca;
      Real g_po4;
      Real g_nh4;
      Real g_mg;
      Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
      Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
      constant Real z_ca = 2;
      constant Real z_po4 = -3;
      constant Real z_mg = 2;
      constant Real z_nh4 = 1;
      constant Real deltaH0_Ksp_stru(unit = "J/kmol") = 22600 "enthalpy of reaction of struvite formation. Rontenltap et al 2007 as 22.6 kJ/mol";
      constant Real deltaH0_Ksp_acp(unit = "J/kmol") = 22600 "enthalpy of reaction of calcium phosphate formation??";
      parameter Real pKsp_acp(unit = "conc") = 28.92 "New value from PCM?";
      parameter Real kcryst_acp(unit = "d-1") = 3 * (24 * 60);
      parameter Real pKsp_stru(unit = "conc") = 13.6 "New value from PCM? Also Ronteltap et al. 2007";
      parameter Real kcryst_stru(unit = "d-1") = 5 * (24 * 60);
  Modelica.Blocks.Interfaces.RealInput Fractions_In[9] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
      f_ch1 = Fractions_In[1];
      f_ch2 = Fractions_In[2];
      f_ch3 = Fractions_In[3];
      f_pr1 = Fractions_In[4];
      f_pr2 = Fractions_In[5];
      f_pr3 = Fractions_In[6];
      f_li1 = Fractions_In[7];
      f_li2 = Fractions_In[8];
      f_li3 = Fractions_In[9];
//MMP submodel
//I = 0.5*(S_ca*(z_ca)^2+S_po4*(z_po4)^2+S_nh4*(z_nh4)^2+S_mg*(z_mg)^2) "S_h and S_oh are included? Come faccio con S_cat e S_an? Che cariche hanno i VFA?";
      I = 0.5 * (S_ca * z_ca ^ 2 + S_po4 * z_po4 ^ 2 + S_nh4 * z_nh4 ^ 2 + S_mg * z_mg ^ 2 + S_hpo4 * 2 ^ 2 + S_h2po4 * 1 ^ 2 + S_hco3 * 1 ^ 2 + S_cat * 1 ^ 2 + S_an * 1 ^ 2);
//I = 0.5 * (S_ca * z_ca ^ 2 + S_po4 * z_po4 ^ 2 + S_nh4 * z_nh4 ^ 2 + S_mg * z_mg ^ 2 + S_hpo4 * 2 ^ 2 + S_h2po4 * 1 ^ 2 + S_hco3 * 1 ^ 2);
      g_ca = 10 ^ (-0.5 * z_ca ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_po4 = 10 ^ (-0.5 * z_po4 ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_mg = 10 ^ (-0.5 * z_mg ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_nh4 = 10 ^ (-0.5 * z_nh4 ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      a_ca = g_ca * S_ca;
      a_po4 = g_po4 * S_po4;
      a_mg = g_mg * S_mg;
      a_nh4 = g_nh4 * S_nh4;
      Ksp_acp = 10 ^ (-pKsp_acp) * exp(deltaH0_Ksp_acp / (R * 100) * (1 / T_ref - 1 / T_op));
      Ksp_stru = 10 ^ (-pKsp_stru) * exp(deltaH0_Ksp_stru / (R * 100) * (1 / T_ref - 1 / T_op));
      SI_acp = log(a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp) / abs(log(a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp));
      SI_stru = log(a_nh4 * a_po4 * a_mg / Ksp_stru) / abs(log(a_nh4 * a_po4 * a_mg / Ksp_stru));
      rp1 = kcryst_acp * X_acp * ((a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp) ^ (1 / 5) - 1) ^ 2 * SI_acp;
      rp2 = kcryst_stru * X_stru * ((a_nh4 * a_po4 * a_mg / Ksp_stru) ^ (1 / 3) - 1) ^ 2 * SI_stru;
      24 * 3600 * der(X_acp) = FeedMix_In.Q / V_liq2 * (-X_acp) + rp1;
      24 * 3600 * der(X_stru) = FeedMix_In.Q / V_liq2 * (-X_stru) + rp2;
//
//TEMPERATURE DEPENDENT PARAMETERS
//Acidity constants with temperature correction
      Ka_co2 = 10 ^ (-pKa_co2) * exp(deltaH0_Ka_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10 ^ (-pKa_nh3) * exp(deltaH0_Ka_nh4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10 ^ (-pKa_h2o) * exp(deltaH0_Ka_h2o / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10 ^ (-pKa_h2po4) * exp(deltaH0_Ka_h2po4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10 ^ (-pKa_hpo4) * exp(deltaH0_Ka_hpo4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "H2PO4 acidity constant with temperature correction - unit = M";
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4 * exp(deltaH0_KH_ch4 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2 * exp(deltaH0_KH_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2 * exp(deltaH0_KH_h2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
//Others with temperature correction
      p_gas_h2o = coeffph20_p * exp(coeffph20_T * (1 / T_ref - 1 / T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_hyd_ch1_T = k_hyd_ch1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr1_T = k_hyd_pr1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li1_T = k_hyd_li1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_ch2_T = k_hyd_ch2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr2_T = k_hyd_pr2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li2_T = k_hyd_li2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_ch3_T = k_hyd_ch3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr3_T = k_hyd_pr3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li3_T = k_hyd_li3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_m_su_T = k_m_su * exp(th_k_m_su * (T_op - T_ref_k));
      k_m_aa_T = k_m_aa * exp(th_k_m_aa * (T_op - T_ref_k));
      k_m_fa_T = k_m_fa * exp(th_k_m_fa * (T_op - T_ref_k));
      k_m_pro_T = k_m_pro * exp(th_k_m_pro * (T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac * exp(th_k_m_ac * (T_op - T_ref_k));
      k_m_h2_T = k_m_h2 * exp(th_k_m_h2 * (T_op - T_ref_k));
      Ks_su_T = Ks_su * exp(th_Ks_su * (T_op - T_ref_k));
      Ks_aa_T = Ks_aa * exp(th_Ks_aa * (T_op - T_ref_k));
      Ks_fa_T = Ks_fa * exp(th_Ks_fa * (T_op - T_ref_k));
      Ks_pro_T = Ks_pro * exp(th_Ks_pro * (T_op - T_ref_k));
//Ks_c4_T = Ks_c4 * exp(th_Ks_c4*(T_op - T_ref_k)); not found
      Ks_ac_T = Ks_ac * exp(th_Ks_ac * (T_op - T_ref_k));
      Ks_h2_T = Ks_h2 * exp(th_Ks_h2 * (T_op - T_ref_k));
      k_dec_su_T = k_dec_su * exp(th_k_dec_su * (T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa * exp(th_k_dec_aa * (T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa * exp(th_k_dec_fa * (T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro * exp(th_k_dec_pro * (T_op - T_ref_k));
//k_dec_c4_T = k_dec_c4 * exp(th_k_dec_c4*(T_op - T_ref_k)); not found
      k_dec_ac_T = k_dec_ac * exp(th_k_dec_ac * (T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2 * exp(th_k_dec_h2 * (T_op - T_ref_k));
//
//INHIBITION
      pH = -log10(S_h);
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3 * ((pH - pH_UL_aa) / (pH_UL_aa - pH_LL_aa)) ^ 2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3 * ((pH - pH_UL_ac) / (pH_UL_ac - pH_LL_ac)) ^ 2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3 * ((pH - pH_UL_h2) / (pH_UL_h2 - pH_LL_h2)) ^ 2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1 / (1 + Ks_IN / S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1 / (1 + Ks_IP / S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1 / (1 + S_h2 / Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1 / (1 + S_h2 / Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1 / (1 + S_h2 / Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1 / (1 + S_nh3 / Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa * I_in_lim * I_ip_lim;
      I_6 = I_pH_aa * I_in_lim * I_ip_lim;
      I_7 = I_pH_aa * I_in_lim * I_h2_fa * I_ip_lim;
      I_8 = I_pH_aa * I_in_lim * I_h2_c4 * I_ip_lim;
      I_9 = I_pH_aa * I_in_lim * I_h2_c4 * I_ip_lim;
      I_10 = I_pH_aa * I_in_lim * I_h2_pro * I_ip_lim;
      I_11 = I_pH_ac * I_in_lim * I_nh3 * I_ip_lim;
      I_12 = I_pH_h2 * I_in_lim * I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-C_xc) + FeedMix_In.f_si_xc * C_si + FeedMix_In.f_ch_xc * C_ch + FeedMix_In.f_pr_xc * C_pr + FeedMix_In.f_li_xc * C_li + FeedMix_In.f_xi_xc * C_xi;
      v2 = (-C_ch) + C_su;
      v3 = (-C_pr) + C_aa;
      v4 = (-C_li) + (1 - f_fa_li) * C_su + f_fa_li * C_fa;
      v5 = (-C_su) + (1 - Y_su) * (f_bu_su * C_bu + f_pro_su * C_pro + f_ac_su * C_ac) + Y_su * C_bac;
      v6 = (-C_aa) + (1 - Y_aa) * (f_va_aa * C_va + f_bu_aa * C_bu + f_pro_aa * C_aa + f_ac_aa * C_aa) + Y_aa * C_bac;
      v7 = (-C_fa) + (1 - Y_fa) * 0.7 * C_ac + Y_fa * C_bac;
      v8 = (-C_va) + (1 - Y_c4) * 0.54 * C_pro + (1 - Y_c4) * 0.31 * C_ac + Y_c4 * C_bac;
      v9 = (-C_bu) + (1 - Y_c4) * 0.8 * C_ac + Y_c4 * C_bac;
      v10 = (-C_pro) + (1 - Y_pro) * 0.57 * C_ac + Y_pro * C_bac;
      v11 = (-C_ac) + (1 - Y_ac) * C_ch4 + Y_ac * C_bac;
      v12 = (1 - Y_h2) * C_ch4 + Y_h2 * C_bac;
      v13 = (-C_bac) + C_pr * f_pr_xb + C_ch * f_ch_xb + C_li * f_li_xb + C_xi * f_xi_xb + C_si * f_si_xb;
//RATES
//Biochemical process rates
      r1 = 0 "k_dis * X_c";
      r2_1 = f_ch1 * k_hyd_ch1_T * X_ch;
      r2_2 = f_ch2 * k_hyd_ch2_T * X_ch;
      r2_3 = f_ch3 * k_hyd_ch3_T * X_ch;
      r3_1 = f_pr1 * k_hyd_pr1_T * X_pr;
      r3_2 = f_pr2 * k_hyd_pr2_T * X_pr;
      r3_3 = f_pr3 * k_hyd_pr3_T * X_pr;
      r4_1 = f_li1 * k_hyd_li1_T * X_li;
      r4_2 = f_li2 * k_hyd_li2_T * X_li;
      r4_3 = f_li3 * k_hyd_li3_T * X_li;
      r5 = k_m_su_T * S_su / (S_su + Ks_su_T) * X_su * I_5;
      r6 = k_m_aa_T * S_aa / (S_aa + Ks_aa_T) * X_aa * I_6;
      r7 = k_m_fa_T * S_fa / (S_fa + Ks_fa_T) * X_fa * I_7;
      r8 = k_m_c4 * S_va / (S_va + Ks_c4) * X_c4 * S_va / (S_bu + S_va + epsilon) * I_8;
      r9 = k_m_c4 * S_bu / (S_bu + Ks_c4) * X_c4 * S_bu / (S_bu + S_va + epsilon) * I_9;
      r10 = k_m_pro_T * S_pro / (S_pro + Ks_pro_T) * X_pro * I_10;
      r11 = k_m_ac_T * S_ac / (S_ac + Ks_ac_T) * X_ac * I_11;
      r12 = k_m_h2_T * S_h2 / (S_h2 + Ks_h2_T) * X_h2 * I_12;
      r13 = k_dec_su_T * X_su;
      r14 = k_dec_aa_T * X_aa;
      r15 = k_dec_fa_T * X_fa;
      r16 = k_dec_c4 * X_c4;
      r17 = k_dec_pro_T * X_pro;
      r18 = k_dec_ac_T * X_ac;
      r19 = k_dec_h2_T * X_h2;
//
//Acid-base rates
      ra4 = k_AB_va * (S_vam * (Ka_va + S_h) - Ka_va * S_va);
      ra5 = k_AB_bu * (S_bum * (Ka_bu + S_h) - Ka_bu * S_bu);
      ra6 = k_AB_pro * (S_prom * (Ka_pro + S_h) - Ka_pro * S_pro);
      ra7 = k_AB_ac * (S_acm * (Ka_ac + S_h) - Ka_ac * S_ac);
      ra10 = k_AB_co2 * (S_hco3 * (Ka_co2 + S_h) - Ka_co2 * S_ic);
      ra11 = k_AB_IN * (S_nh3 * (Ka_nh4 + S_h) - Ka_nh4 * S_in);
      ra12 = k_AB_IP * (S_hpo4 * (Ka_h2po4 + S_h + Ka_h2po4 * Ka_hpo4 / S_h) - Ka_h2po4 * S_ip);
      ra13 = k_AB_IP * (S_po4 * (Ka_hpo4 + S_h + S_h ^ 2 / Ka_h2po4) - Ka_hpo4 * S_ip);
//
//Gas transfer rates
      rt8 = kla * (S_h2 - 16 * KH_h2 * p_gas_h2);
      rt9 = kla * (S_ch4 - 64 * KH_ch4 * p_gas_ch4);
      rt10 = kla * (S_co2 - KH_co2 * p_gas_co2);
//
//WATER PHASE EQUATIONS
      FeedMix_In.Q + Digestate_Out.Q = 0;
//
//Particulate matter
      24 * 3600 * der(X_c) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_c - X_c) - r1 "+ r13 + r14 + r15 + r16 + r17 + r18 + r19";
      24 * 3600 * der(X_ch) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_ch - X_ch) + FeedMix_In.f_ch_xc * r1 - r2_1 - r2_2 - r2_3 + f_ch_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_pr) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_pr - X_pr) + FeedMix_In.f_pr_xc * r1 - r3_1 - r3_2 - r3_2 + f_pr_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_li) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_li - X_li) + FeedMix_In.f_li_xc * r1 - r4_1 - r4_2 - r4_3 + f_li_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_i) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_i - X_i) + FeedMix_In.f_xi_xc * r1 + f_xi_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
//
//Soluble matter
      24 * 3600 * der(S_i) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_i - S_i) + FeedMix_In.f_si_xc * r1 + f_si_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(S_su) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_su - S_su) + r2_1 + r2_2 + r2_3 + (1 - f_fa_li) * (r4_1 + r4_2 + r4_3) - r5;
      24 * 3600 * der(S_aa) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_aa - S_aa) + r3_1 + r3_2 + r3_3 - r6;
      24 * 3600 * der(S_fa) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_fa - S_fa) + f_fa_li * (r4_1 + r4_2 + r4_3) - r7;
      24 * 3600 * der(S_va) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_va - S_va) + (1 - Y_aa) * f_va_aa * r6 - r8;
      24 * 3600 * der(S_bu) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_bu - S_bu) + (1 - Y_su) * f_bu_su * r5 + (1 - Y_aa) * f_bu_aa * r6 - r9;
      24 * 3600 * der(S_pro) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_pro - S_pro) + (1 - Y_su) * f_pro_su * r5 + (1 - Y_aa) * f_pro_aa * r6 + (1 - Y_c4) * 0.54 * r8 - r10;
      24 * 3600 * der(S_ac) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_ac - S_ac) + (1 - Y_su) * f_ac_su * r5 + (1 - Y_aa) * f_ac_aa * r6 + (1 - Y_fa) * 0.7 * r7 + (1 - Y_c4) * 0.31 * r8 + (1 - Y_c4) * 0.8 * r9 + (1 - Y_pro) * 0.57 * r10 - r11;
      24 * 3600 * der(S_h2) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_h2 - S_h2) + (1 - Y_su) * f_h2_su * r5 + (1 - Y_aa) * f_h2_aa * r6 + (1 - Y_fa) * 0.3 * r7 + (1 - Y_c4) * 0.15 * r8 + (1 - Y_c4) * 0.2 * r9 + (1 - Y_pro) * 0.43 * r10 - r12 - rt8;
      24 * 3600 * der(S_ch4) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_ch4 - S_ch4) + (1 - Y_ac) * r11 + (1 - Y_h2) * r12 - rt9;
      24 * 3600 * der(S_ic) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_ic - S_ic) - (v1 * r1 + v2 * (r2_1 + r2_2 + r2_3) + v3 * (r3_1 + r3_2 + r3_3) + v4 * (r4_1 + r4_2 + r4_3) + v5 * r5 + v6 * r6 + v7 * r7 + v8 * r8 + v9 * r9 + v10 * r10 + v11 * r11 + v12 * r12 + v13 * (r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10;
      24 * 3600 * der(S_in) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_in - S_in) - Y_su * N_bac * r5 + (N_aa - Y_aa * N_bac) * r6 - Y_fa * N_bac * r7 - Y_c4 * N_bac * r8 - Y_c4 * N_bac * r9 - Y_pro * N_bac * r10 - Y_ac * N_bac * r11 - Y_h2 * N_bac * r12 + (N_bac - N_i * f_xi_xb - N_aa * f_pr_xb) * (r13 + r14 + r15 + r16 + r17 + r18 + r19) - rp2;
      24 * 3600 * der(S_ip) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_ip - S_ip) + P_li * (r4_1 + r4_2 + r4_3) - Y_su * P_bac * r5 - Y_aa * P_bac * r6 - Y_fa * P_bac * r7 - Y_c4 * P_bac * r8 - Y_c4 * P_bac * r9 - Y_pro * P_bac * r10 - Y_ac * P_bac * r11 - Y_h2 * P_bac * r12 + (P_bac - P_i * f_xi_xb - P_li * f_li_xb) * (r13 + r14 + r15 + r16 + r17 + r18 + r19) - 2 * rp1 - rp2;
//
//Biomasses
      24 * 3600 * der(X_su) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_su - X_su) + Y_su * r5 - r13;
      24 * 3600 * der(X_aa) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_aa - X_aa) + Y_aa * r6 - r14;
      24 * 3600 * der(X_fa) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_fa - X_fa) + Y_fa * r7 - r15;
      24 * 3600 * der(X_c4) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_c4 - X_c4) + Y_c4 * r8 + Y_c4 * r9 - r16;
      24 * 3600 * der(X_pro) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_pro - X_pro) + Y_pro * r10 - r17;
      24 * 3600 * der(X_ac) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_ac - X_ac) + Y_ac * r11 - r18;
      24 * 3600 * der(X_h2) = FeedMix_In.Q / V_liq2 * (FeedMix_In.X_h2 - X_h2) + Y_h2 * r12 - r19;
//
//Cations and anions
      24 * 3600 * der(S_cat) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_cat - S_cat);
      24 * 3600 * der(S_ca) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_ca - S_ca) - 3 * rp1;
      24 * 3600 * der(S_mg) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_mg - S_mg) - rp2;
      24 * 3600 * der(S_an) = FeedMix_In.Q / V_liq2 * (FeedMix_In.S_an - S_an);
      24 * 3600 * der(S_vam) = -ra4;
      24 * 3600 * der(S_bum) = -ra5;
      24 * 3600 * der(S_prom) = -ra6;
      24 * 3600 * der(S_acm) = -ra7;
      24 * 3600 * der(S_hco3) = -ra10;
      24 * 3600 * der(S_nh3) = -ra11;
      24 * 3600 * der(S_hpo4) = -ra12;
      24 * 3600 * der(S_po4) = -ra13;
      S_nh4 = S_in - S_nh3;
      S_co2 = S_ic - S_hco3;
      S_oh = Ka_h2o * convKa / S_h;
      S_h2po4 = S_ip - S_hpo4 - S_po4;
//AE
    //  S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
    //  Theta = S_cat + S_nh4 + 2 * S_ca + 2 * S_mg - S_hco3 - S_acm / Ac_conv - S_prom / Pro_conv - S_bum / Bu_conv - S_vam / Va_conv - S_an - 2 * S_hpo4 - S_h2po4 - 3 * S_po4;
    //ODE;
      Theta = 0;
      der(S_h) = (der(S_an) + Ka_nh4 / (Ka_nh4 + S_h) * der(S_in) + Ka_co2 / (Ka_co2 + S_h) * der(S_ic) + 1 / Ac_conv * Ka_ac / (Ka_ac + S_h) * der(S_ac) + 1 / Pro_conv * Ka_pro / (Ka_pro + S_h) * der(S_pro) + 1 / Bu_conv * Ka_bu / (Ka_bu + S_h) * der(S_bu) + 1 / Va_conv * Ka_va / (Ka_va + S_h) * der(S_va) + 2*(Ka_h2po4*der(S_ip)/(Ka_h2po4+S_h+Ka_h2po4*Ka_hpo4/S_h)) + (Ka_h3po4*der(S_ip)/(Ka_h3po4+Ka_h2po4*Ka_h3po4/S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h)^2)) + 3*(Ka_hpo4*der(S_ip)/(Ka_hpo4+S_h+(S_h)^2/Ka_h2po4)) - der(S_in) - der(S_cat)- 2 * der(S_mg) - 2 * der(S_ca)) / (1 + Ka_nh4 * S_in / (Ka_nh4 + S_h) ^ 2 + Ka_co2 * S_ic / (Ka_co2 + S_h) ^ 2 + 1 / Ac_conv * Ka_ac * S_ac / (Ka_ac + S_h) ^ 2 + 1 / Pro_conv * Ka_pro * S_pro / (Ka_pro + S_h) ^ 2 + 1 / Bu_conv * Ka_bu * S_bu / (Ka_bu + S_h) ^ 2 + 1 / Va_conv * Ka_va * S_va / (Ka_va + S_h) ^ 2 + Ka_h2o / S_h ^ 2 + 2*(Ka_h2po4*S_ip-Ka_h2po4^2*Ka_hpo4*S_ip/(S_h)^2/(Ka_h2po4+S_h+Ka_h2po4*Ka_hpo4/S_h)^2) + (-Ka_h3po4^2*S_ip*Ka_h2po4/(S_h)^2-Ka_h3po4^2*Ka_h2po4*Ka_hpo4*S_ip/(S_h)^3/(Ka_h3po4+Ka_h3po4*Ka_h2po4/S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h)^2)^2) + 3*(Ka_hpo4*S_ip+Ka_hpo4*S_ip*2/Ka_h2po4*S_h));
//
//GAS PHASE EQUATIONS
      24 * 3600 * der(S_gas_h2) = (-S_gas_h2 * Q_gas / V_gas2) + rt8 * V_liq2 / V_gas2;
      24 * 3600 * der(S_gas_ch4) = (-S_gas_ch4 * Q_gas / V_gas2) + rt9 * V_liq2 / V_gas2;
      24 * 3600 * der(S_gas_co2) = (-S_gas_co2 * Q_gas / V_gas2) + rt10 * V_liq2 / V_gas2;
      p_gas_h2 = S_gas_h2 * R * T_op / h2_conv;
      p_gas_ch4 = S_gas_ch4 * R * T_op / ch4_conv;
      p_gas_co2 = S_gas_co2 * R * T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
//Q_gas = k_p * (P_gas - P_atm)
      Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas * 273.15 / T_op / P_atm * P_gas "Biogas rate [m3/d] at standard conditions";
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq2 / FeedMix_In.Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in / V_liq2 "Organic Loading Rate [kgCOD/m3/d]";
//
//CONVERSION FOR INTERFACE "DIGESTATE"
      Digestate_Out.S_su = S_su;
      Digestate_Out.S_aa = S_aa;
      Digestate_Out.S_fa = S_fa;
      Digestate_Out.S_va = S_va;
      Digestate_Out.S_bu = S_bu;
      Digestate_Out.S_pro = S_pro;
      Digestate_Out.S_ac = S_ac;
      Digestate_Out.S_h2 = S_h2;
      Digestate_Out.S_ch4 = S_ch4;
      Digestate_Out.S_ic = S_ic;
      Digestate_Out.S_in = S_in;
      Digestate_Out.S_ip = S_ip;
      Digestate_Out.S_i = S_i;
      Digestate_Out.S_cat = S_cat;
      Digestate_Out.S_ca = S_ca;
      Digestate_Out.S_mg = S_mg;
      Digestate_Out.S_an = S_an;
      Digestate_Out.X_c = X_c;
      Digestate_Out.X_ch = X_ch;
      Digestate_Out.X_pr = X_pr;
      Digestate_Out.X_li = X_li;
      Digestate_Out.X_su = X_su;
      Digestate_Out.X_aa = X_aa;
      Digestate_Out.X_fa = X_fa;
      Digestate_Out.X_c4 = X_c4;
      Digestate_Out.X_pro = X_pro;
      Digestate_Out.X_ac = X_ac;
      Digestate_Out.X_h2 = X_h2;
      Digestate_Out.X_i = X_i;
      Digestate_Out.S_hco3 = S_hco3;
      Digestate_Out.S_co2 = S_co2;
      Digestate_Out.S_h = S_h;
      Digestate_Out.S_oh = S_oh;
      Digestate_Out.S_nh3 = S_nh3;
      Digestate_Out.S_nh4 = S_nh4;
      Digestate_Out.S_h2po4 = S_h2po4;
      Digestate_Out.S_hpo4 = S_hpo4;
      Digestate_Out.S_acm = S_acm;
      Digestate_Out.S_prom = S_prom;
      Digestate_Out.S_bum = S_bum;
      Digestate_Out.S_vam = S_vam;
      Digestate_Out.S_gas_h2 = S_gas_h2;
      Digestate_Out.S_gas_ch4 = S_gas_ch4;
      Digestate_Out.S_gas_co2 = S_gas_co2;
      Digestate_Out.X_acp = X_acp;
      Digestate_Out.X_stru = X_stru;
//
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.P_gas = P_gas;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
//MASS BALANCES
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_aa + X_ac + X_c4 + X_ch + X_fa + X_h2 + X_i + X_li + X_pr + X_pro + X_su "+X_c; Particulate COD concentration";
      COD_balance_in = FeedMix_In.Q * (FeedMix_In.S_aa + FeedMix_In.S_ac + FeedMix_In.S_bu + FeedMix_In.S_ch4 + FeedMix_In.S_fa + FeedMix_In.S_h2 + FeedMix_In.S_i + FeedMix_In.S_pro + FeedMix_In.S_su + FeedMix_In.S_va + FeedMix_In.X_aa + FeedMix_In.X_ac + FeedMix_In.X_c4 + FeedMix_In.X_fa + FeedMix_In.X_h2 + FeedMix_In.X_pro + FeedMix_In.X_su + FeedMix_In.X_ch + FeedMix_In.X_c + FeedMix_In.X_i + FeedMix_In.X_li + FeedMix_In.X_pr);
      COD_balance_out = Digestate_Out.Q * (COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N * (p_gas_ch4 / (P_gas - p_gas_h2o) / (R / 64 * 273.15 / 1.01325) + p_gas_h2 / (P_gas - p_gas_h2o) / (R / 16 * 273.15 / 1.01325));
      24 * 3600 * der(CH4_cum) = ((1 - Y_ac) * r11 + (1 - Y_h2) * r12) * V_liq2;
      24 * 3600 * der(V_in_cum) = FeedMix_In.Q;
      24 * 3600 * der(COD_balance_in_cum) = COD_balance_in;
      24 * 3600 * der(COD_balance_out_cum) = COD_balance_out;
      24 * 3600 * der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = FeedMix_In.Q * (FeedMix_In.S_ic + C_xc * FeedMix_In.X_c + C_si * FeedMix_In.S_i + C_xi * FeedMix_In.X_i + C_ch * FeedMix_In.X_ch + C_pr * FeedMix_In.X_pr + C_li * FeedMix_In.X_li + C_su * FeedMix_In.S_su + C_aa * FeedMix_In.S_aa + C_fa * FeedMix_In.S_fa + C_va * FeedMix_In.S_va + C_bu * FeedMix_In.S_bu + C_pro * FeedMix_In.S_pro + C_ac * FeedMix_In.S_ac + C_ch4 * FeedMix_In.S_ch4 + C_bac * (FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IC_balance_out = Digestate_Out.Q * (S_ic + C_si * S_i + C_xi * X_i + C_ch * X_ch + C_pr * X_pr + C_li * X_li + C_su * S_su + C_aa * S_aa + C_fa * S_fa + C_va * S_va + C_bu * S_bu + C_pro * S_pro + C_ac * S_ac + C_ch4 * S_ch4 + C_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)) "+C_xc * X_c";
      IC_balance_gas = Biogas_Out.Q_gas_N * (C_ch4 * p_gas_ch4 / (P_gas - p_gas_h2o) / (R / 64 * 273.15 / 1.01325) + p_gas_co2 / (P_gas - p_gas_h2o) / R / 273.15 * 1.01325);
      24 * 3600 * der(IC_balance_in_cum) = IC_balance_in;
      24 * 3600 * der(IC_balance_out_cum) = IC_balance_out;
      24 * 3600 * der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = FeedMix_In.Q * (FeedMix_In.S_in + N_i * (FeedMix_In.S_i + FeedMix_In.X_i) + N_aa * (FeedMix_In.S_aa + FeedMix_In.X_pr) + N_bac * (FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IN_balance_out = Digestate_Out.Q * (S_in + N_i * (S_i + X_i) + N_aa * (S_aa + X_pr) + N_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru);
      24 * 3600 * der(IN_balance_in_cum) = IN_balance_in;
      24 * 3600 * der(IN_balance_out_cum) = IN_balance_out;
//Inorganic Phosforous Balance
      IP_balance_in = FeedMix_In.Q * (FeedMix_In.S_ip + P_i * (FeedMix_In.S_i + FeedMix_In.X_i) + P_li * FeedMix_In.X_li + P_bac * (FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IP_balance_out = Digestate_Out.Q * (S_ip + P_i * (S_i + X_i) + P_li * X_li + P_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2 * X_acp + X_stru);
      24 * 3600 * der(IP_balance_in_cum) = IP_balance_in;
      24 * 3600 * der(IP_balance_out_cum) = IP_balance_out;
      24 * 3600 * der(Vcum) = FeedMix_In.Q;
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
    end Postfermenter;

    model Sludge_Discharge
      extends ADM1_P.Icons.SludgeDischarge;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.OtherVariables_Discharge;
      ADM1_P.Interfaces.Digestate Digestate_In annotation(
        Placement(visible = true, transformation(origin = {-92, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
// Carachteristics of digestate
//Alk = (Digestate_In.S_hco3 + Digestate_In.S_oh + Digestate_In.S_acm / Ac_conv + Digestate_In.S_prom / Pro_conv + Digestate_In.S_bum / Bu_conv + Digestate_In.S_vam / Va_conv) * 50 * 1000 "Alkalinity as mgCaCO3/L";
      Alk = (Digestate_In.S_hco3 + Digestate_In.S_oh + Digestate_In.S_acm / Ac_conv + Digestate_In.S_prom / Pro_conv + Digestate_In.S_bum / Bu_conv + Digestate_In.S_vam / Va_conv - Digestate_In.S_h + Digestate_In.S_nh3 + Digestate_In.S_hpo4) * 50 * 1000 "Alkalinity as mgCaCO3/L";
      VFA = (Digestate_In.S_ac / Ac_conv + Digestate_In.S_pro / Pro_conv + Digestate_In.S_bu / Bu_conv + Digestate_In.S_va / Va_conv) * 60 * 1000 "VFA as mgCH3COOH/L";
      FOS_TAC = VFA / Alk "Ratio between acidity and alkalinity";
      VS = (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2) * f_Xbiom_ch / CH_conv_out + (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2) * f_Xbiom_pr / PR_conv_out + (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2) * f_Xbiom_li / LI_conv_out + (Digestate_In.S_su + Digestate_In.X_ch) / CH_conv_out + (Digestate_In.S_aa + Digestate_In.X_pr) / PR_conv_out + (Digestate_In.S_fa + Digestate_In.X_li) / LI_conv_out + Digestate_In.S_i / Si_conv_out + Digestate_In.X_i / Xi_conv_out + Digestate_In.X_c * complexpart_CH / CH_conv_out + Digestate_In.X_c * complexpart_PR / PR_conv_out + Digestate_In.X_c * complexpart_LI / LI_conv_out "Volatile Solid content in the digester as gVS/L";
      N_NH4NH3 = Digestate_In.S_in * 14 * 1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = Digestate_In.S_aa + Digestate_In.S_ac + Digestate_In.S_bu + Digestate_In.S_ch4 + Digestate_In.S_fa + Digestate_In.S_h2 + Digestate_In.S_i + Digestate_In.S_pro + Digestate_In.S_su + Digestate_In.S_va + Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c + Digestate_In.X_c4 + Digestate_In.X_ch + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_i + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su "Total COD concentration as gCOD/L";
      CH_tot = (Digestate_In.S_su + Digestate_In.X_ch + Digestate_In.X_c * complexpart_CH + Digestate_In.S_i * f_Si_ch + Digestate_In.X_i * f_Xi_ch + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su) * f_Xbiom_ch) / CH_conv_out "Total CH concentration as gGlu/L";
      PR_tot_BCA = (Digestate_In.S_aa + Digestate_In.X_pr + Digestate_In.X_c * complexpart_PR + Digestate_In.S_i * f_Si_pr + Digestate_In.X_i * f_Xi_pr + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su) * f_Xbiom_pr) / PR_conv_out_BSA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (Digestate_In.S_aa + Digestate_In.X_pr + Digestate_In.X_c * complexpart_PR + Digestate_In.S_i * f_Si_pr + Digestate_In.X_i * f_Xi_pr + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su) * f_Xbiom_pr) / PR_conv_out / N_PR_conv "Total PR concentration as gN/L";
      LI_tot = (Digestate_In.S_fa + Digestate_In.X_li + Digestate_In.X_c * complexpart_LI + Digestate_In.S_i * f_Si_li + Digestate_In.X_i * f_Xi_li + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su) * f_Xbiom_li) / LI_conv_out "Total LI concentration as glipid/L";
      CH_sol = (Digestate_In.S_su + Digestate_In.S_i * f_Si_ch) / CH_conv_out "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (Digestate_In.S_aa + Digestate_In.S_i * f_Si_pr) / PR_conv_out_BSA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (Digestate_In.S_aa + Digestate_In.S_i * f_Si_pr) / PR_conv_out / N_PR_conv "Soluble PR concentration as gN/L";
      LI_sol = (Digestate_In.S_fa + Digestate_In.S_i * f_Si_li) / LI_conv_out "Soluble LI concentration as glipid/L";
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Sludge_Discharge;

    model Gas_Meter
      extends ADM1_P.Icons.GasMeter;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.OtherVariables_GasMeter;
      ADM1_P.Interfaces.Gas Biogas_In annotation(
        Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput CH4_perc_exp annotation(
        Placement(visible = true, transformation(origin = {-44, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {-27, 79}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput CO2_perc_exp annotation(
        Placement(visible = true, transformation(origin = {30, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {27, 79}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
    equation
      x_ch4 = Biogas_In.p_gas_ch4 / (Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_co2 = Biogas_In.p_gas_co2 / (Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_h2 = Biogas_In.p_gas_h2 / (Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      Q_ch4_N = Biogas_In.Q_gas_N * x_ch4 * 1000 "Methane rate [L/d] at standard conditions";
      Q_co2_N = Biogas_In.Q_gas_N * x_co2 * 1000 "Carbon dioxide rate [L/d] at standard conditions";
      Q_h2_N = Biogas_In.Q_gas_N * x_h2 * 1000 "Hydrogen rate [L/d] at standard conditions";
    end Gas_Meter;

    model Probe_T
      extends ADM1_P.Icons.ProbeT;
      Modelica.Blocks.Interfaces.RealOutput y_T annotation(
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_T_ADM1_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-70, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(temperature.y[1], y_T) annotation(
        Line(points = {{-63, -44}, {2, -44}, {2, 0}, {96, 0}}, color = {0, 0, 127}));
    end Probe_T;

    model Probe_P
      extends ADM1_P.Icons.ProbeP;
      Modelica.Blocks.Interfaces.RealOutput y_P annotation(
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable pressure(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_P_ADM1_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-70, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(pressure.y[1], y_P) annotation(
        Line(points = {{-63, -44}, {2, -44}, {2, 0}, {96, 0}}, color = {0, 0, 127}));
      annotation(
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Probe_P;

    model Probe_VS
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Interfaces.RealOutput y_VS annotation(
        Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Sources.CombiTimeTable VS_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeVS_meas_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVS_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-76, 52}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(VS_measured.y[1], y_VS) annotation(
        Line(points = {{-70, 52}, {70, 52}, {70, -70}}, color = {0, 0, 127}));
    end Probe_VS;

    model Probe_Alk
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable Alk_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeAlk_meas_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeAlk_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-84, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_Alk annotation(
        Placement(visible = true, transformation(origin = {-28, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(Alk_measured.y[1], y_Alk) annotation(
        Line(points = {{-72, 10}, {-28, 10}, {-28, -42}}, color = {0, 0, 127}));
    end Probe_Alk;

    model Probe_VFA
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable VFA_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeVFA_meas_new.txt", startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVFA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {0, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_VFA annotation(
        Placement(visible = true, transformation(origin = {88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(y_VFA, VFA_measured.y[1]) annotation(
        Line(points = {{88, 0}, {12, 0}, {12, 84}}, color = {0, 0, 127}));
    end Probe_VFA;

    model Probe_pH
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable pH_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbepH_meas_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-80, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_pH annotation(
        Placement(visible = true, transformation(origin = {0, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(pH_measured.y[1], y_pH) annotation(
        Line(points = {{-68, 58}, {0, 58}, {0, -94}}, color = {0, 0, 127}));
    end Probe_pH;

    model Probe_NH4_kit
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable NH4_kit_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeNH4kit_meas_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeNH4kit_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-80, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_NH4 annotation(
        Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(NH4_kit_measured.y[1], y_NH4) annotation(
        Line(points = {{-68, 62}, {0, 62}, {0, -100}}, color = {0, 0, 127}));
    end Probe_NH4_kit;

    model Probe_COD_BCA
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable COD_BCA_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeCOD_BCA_meas_new_release.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCOD_BCA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_COD_BCA annotation(
        Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(COD_BCA_measured.y[1], y_COD_BCA) annotation(
        Line(points = {{-78, 60}, {54, 60}, {54, -96}, {0, -96}}, color = {0, 0, 127}));
      annotation(
        Diagram);
    end Probe_COD_BCA;

    model Probe_COD_TKN
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable COD_TKN_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeCOD_TKN_meas_new_release.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCOD_TKN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_COD_TKN annotation(
        Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(COD_TKN_measured.y[1], y_COD_TKN) annotation(
        Line(points = {{-78, 60}, {54, 60}, {54, -96}, {0, -96}}, color = {0, 0, 127}));
      annotation(
        Diagram);
    end Probe_COD_TKN;

    model Probe_COD_SM
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable COD_SM_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeCOD_SM_meas_new_release.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCOD_SM_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_COD_SM annotation(
        Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(COD_SM_measured.y[1], y_COD_SM) annotation(
        Line(points = {{-78, 60}, {54, 60}, {54, -96}, {0, -96}}, color = {0, 0, 127}));
      annotation(
        Diagram);
    end Probe_COD_SM;

    model Probe_CH_tot
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable CH_tot_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeCHtot_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCHtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_CH_tot annotation(
        Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(CH_tot_measured.y[1], y_CH_tot) annotation(
        Line(points = {{-78, 60}, {54, 60}, {54, -96}, {0, -96}}, color = {0, 0, 127}));
      annotation(
        Diagram);
    end Probe_CH_tot;

    model Probe_PR_tot_TKN
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable PR_tot_TKN_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbePRtot_meas_TKN.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbePRtot_TKN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_PR_tot_TKN annotation(
        Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(PR_tot_TKN_measured.y[1], y_PR_tot_TKN) annotation(
        Line(points = {{-78, 60}, {54, 60}, {54, -96}, {0, -96}}, color = {0, 0, 127}));
      annotation(
        Diagram);
    end Probe_PR_tot_TKN;

    model Probe_PR_tot_BCA
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable PR_tot_BCA_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbePRtot_meas_BCA.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbePRtot_BCA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_PR_tot_BCA annotation(
        Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(PR_tot_BCA_measured.y[1], y_PR_tot_BCA) annotation(
        Line(points = {{-78, 60}, {54, 60}, {54, -96}, {0, -96}}, color = {0, 0, 127}));
      annotation(
        Diagram);
    end Probe_PR_tot_BCA;

    model Probe_LI_tot
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable LI_tot_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeLItot_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeLItot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_LI_tot annotation(
        Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(LI_tot_measured.y[1], y_LI_tot) annotation(
        Line(points = {{-78, 60}, {54, 60}, {54, -96}, {0, -96}}, color = {0, 0, 127}));
      annotation(
        Diagram);
    end Probe_LI_tot;

    model Probe_CH4_perc
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Interfaces.RealOutput y_CH4 annotation(
        Placement(visible = true, transformation(origin = {0, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Sources.CombiTimeTable CH4_perc_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeCH4perc_meas_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCH4perc_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(y_CH4, CH4_perc_measured.y[1]) annotation(
        Line(points = {{0, -92}, {-80, -92}, {-80, 6}}, color = {0, 0, 127}));
    end Probe_CH4_perc;

    model Probe_CO2_perc
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Interfaces.RealOutput y_CO2 annotation(
        Placement(visible = true, transformation(origin = {0, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Sources.CombiTimeTable CO2_perc_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeCO2perc_meas_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCO2perc_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-86, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(y_CO2, CO2_perc_measured.y[1]) annotation(
        Line(points = {{0, -94}, {-75, -94}, {-75, 24}}, color = {0, 0, 127}));
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Probe_CO2_perc;

    model Probe_SingleVFAs
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable SingleVFAs_measured(columns = integer({2, 3, 4, 5}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeSingleVFAs_meas_new_release.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeSingleVFAs_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-86, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_Hac_meas annotation(
        Placement(visible = true, transformation(origin = {0, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(extent = {{-40, -106}, {-20, -86}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_HPro_meas annotation(
        Placement(visible = true, transformation(origin = {18, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-10, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_HBu_meas annotation(
        Placement(visible = true, transformation(origin = {36, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {10, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_HVa_meas annotation(
        Placement(visible = true, transformation(origin = {54, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {30, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(y_Hac_meas, SingleVFAs_measured.y[1]) annotation(
        Line(points = {{0, -94}, {-75, -94}, {-75, 24}}, color = {0, 0, 127}));
      connect(y_HPro_meas, SingleVFAs_measured.y[2]) annotation(
        Line(points = {{18, -94}, {0, -94}}, color = {0, 0, 127}));
      connect(y_HBu_meas, SingleVFAs_measured.y[3]) annotation(
        Line(points = {{36, -94}, {-75, -94}, {-75, 24}}, color = {0, 0, 127}));
      connect(y_HVa_meas, SingleVFAs_measured.y[4]) annotation(
        Line(points = {{54, -94}, {0, -94}}, color = {0, 0, 127}));
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Probe_SingleVFAs;

    model pH_AE
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      Modelica.Blocks.Interfaces.RealOutput Out[22] annotation(
        Placement(visible = true, transformation(origin = {56, -46}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {88, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput In[13] annotation(
        Placement(visible = true, transformation(origin = {72, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-82, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      //Inputs from biological
      Real T_op;
      Real Q;
      Real S_ip;
      Real S_ic;
      Real S_in;
      Real S_va;
      Real S_bu;
      Real S_pro;
      Real S_ac;
      Real S_cat_in;
      Real S_an_in;
      Real S_ca_in;
      Real S_mg_in;
      //Acid-base dynamics
      Modelica.SIunits.MassConcentration S_vam(fixed = true, start = 0.0020104) "Valerate ion concentration in digestate [kgCOD/m3]";
      Modelica.SIunits.MassConcentration S_bum(fixed = true, start = 0.00315335) "Butyrate ion concentration in digestate [kgCOD/m3]";
      Modelica.SIunits.MassConcentration S_prom(fixed = true, start = 0) "Propionate ion concentration in digestate [kgCOD/m3]";
      Modelica.SIunits.MassConcentration S_acm(fixed = true, start = 0.879755) "Acetate ion inerts concentration in digestate [kgCOD/m3]";
      Types.MolarDensity_M S_cat(fixed = true, start = 0.144689) "Soluble cationic ion concentration in digestate [kmol/m3]";
      Types.MolarDensity_M S_ca(fixed = true, start = 0.000238053,nominal = 1e-4);
      Types.MolarDensity_M S_mg(fixed = true, start = 8.75745e-05,nominal = 1e-5);
      Types.MolarDensity_M S_an(fixed = false, start = 0.0197599);
      Types.MolarDensity_M S_hco3(fixed = false, start = 0.323025) "8/10";
      Types.MolarDensity_M S_nh3(fixed = true, start = 0.0187221,nominal = 1e-2) "8/10";
      Types.MolarDensity_M S_nh4(fixed = false, start = 0.223322,nominal = 1e-1) "8/10";
      Types.MolarDensity_M S_hpo4(fixed = false, start = 0.005365,nominal = 1e-3) "8/10";
      Types.MolarDensity_M S_h2po4(fixed = true, start = 0.00123002, nominal = 1e-3) "8/10";
      Types.MolarDensity_M S_po4(fixed = true, start = 1.22302e-08, nominal = 1e-8) "8/10";
      Types.MolarDensity_M S_co2(fixed = true, start = 0.0096877) "8/10";
      Modelica.SIunits.PerUnit pH(fixed = false, start = 7.11, nominal = 7) "Digestate pH [-]";
      Types.MolarDensity_M S_h(fixed = true, start = 1.51014e-08, nominal = 1e-8, min = 1.48e-8, max = 1.6e-8) "8/10";
      Types.MolarDensity_M S_oh(fixed = false, start = 1.58449e-06) "8/10";
      Types.MolarDensity_M Theta(fixed = false, start = 0.02);
      //Rates
      Real ra4(fixed = false, start = 0);
      Real ra5(fixed = false, start = 0);
      Real ra6(fixed = false, start = 0);
      Real ra7(fixed = false, start = 0);
      Real ra10(fixed = false, start = 0);
      Real ra11(fixed = false, start = 0);
      Real ra12(fixed = false, start = 0);
      Real ra13(fixed = false, start = 0);
      //Acidity constants
      Real Ka_co2(fixed = false, start = 4.94e-7);
      Real Ka_nh4(fixed = false, start = 1.11e-9);
      Real Ka_h2o(fixed = false, start = 2.08e-14);
      Real Ka_h2po4(fixed = false, start = 6.20e-8);
      Real Ka_hpo4(fixed = false, start = 2.14e-13);
      //MPP submodel
      Types.MolarDensity_M X_acp(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
      Types.MolarDensity_M X_stru(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
      Types.MolarDensity_M a_ca(nominal = 1e-5) "mol/L";
      Types.MolarDensity_M a_po4(nominal = 1e-9) "mol/L";
      Types.MolarDensity_M a_nh4(nominal = 1e-2) "mol/L";
      Types.MolarDensity_M a_mg(nominal = 1e-5) "mol/L";
      Real rp1;
      Real rp2;
      Modelica.SIunits.PerUnit SI_stru(nominal = 1);
      Modelica.SIunits.PerUnit SI_acp(nominal = 1);
      Real I;
      Real g_ca;
      Real g_po4;
      Real g_nh4;
      Real g_mg;
      Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
      Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
      constant Real z_ca = 2;
      constant Real z_po4 = -3;
      constant Real z_mg = 2;
      constant Real z_nh4 = 1;
      constant Real deltaH0_Ksp_stru(unit = "J/kmol") = 22600 "enthalpy of reaction of struvite formation. Rontenltap et al 2007 as 22.6 kJ/mol";
      constant Real deltaH0_Ksp_acp(unit = "J/kmol") = 22600 "enthalpy of reaction of calcium phosphate formation??";
      parameter Real pKsp_acp(unit = "conc") = 28.92 "New value from PCM?";
      parameter Real kcryst_acp(unit = "d-1") = 3 * (24 * 60);
      parameter Real pKsp_stru(unit = "conc") = 13.6 "New value from PCM? Also Ronteltap et al. 2007";
      parameter Real kcryst_stru(unit = "d-1") = 5 * (24 * 60);
    equation
//Inputs from biological
      T_op = In[1];
      Q = In[2];
      S_ip = In[3];
      S_ic = In[4];
      S_in = In[5];
      S_va = In[6];
      S_bu = In[7];
      S_pro = In[8];
      S_ac = In[9];
      S_cat_in = In[10];
      S_an_in = In[11];
      S_ca_in = In[12];
      S_mg_in = In[13];
//Acidity constants with temperature correction
      Ka_co2 = 10 ^ (-pKa_co2) * exp(deltaH0_Ka_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10 ^ (-pKa_nh3) * exp(deltaH0_Ka_nh4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10 ^ (-pKa_h2o) * exp(deltaH0_Ka_h2o / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10 ^ (-pKa_h2po4) * exp(deltaH0_Ka_h2po4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10 ^ (-pKa_hpo4) * exp(deltaH0_Ka_hpo4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "H2PO4 acidity constant with temperature correction - unit = M";
//MMP submodel
//I = 0.5*(S_ca*(z_ca)^2+S_po4*(z_po4)^2+S_nh4*(z_nh4)^2+S_mg*(z_mg)^2) "S_h and S_oh are included? Come faccio con S_cat e S_an? Che cariche hanno i VFA?";
      I = 0.5 * (S_ca * z_ca ^ 2 + S_po4 * z_po4 ^ 2 + S_nh4 * z_nh4 ^ 2 + S_mg * z_mg ^ 2 + S_hpo4 * 2 ^ 2 + S_h2po4 * 1 ^ 2 + S_hco3 * 1 ^ 2 + S_cat * 1 ^ 2 + S_an * 1 ^ 2);
//I = 0.5 * (S_ca * z_ca ^ 2 + S_po4 * z_po4 ^ 2 + S_nh4 * z_nh4 ^ 2 + S_mg * z_mg ^ 2 + S_hpo4 * 2 ^ 2 + S_h2po4 * 1 ^ 2 + S_hco3 * 1 ^ 2);
      g_ca = 10 ^ (-0.5 * z_ca ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_po4 = 10 ^ (-0.5 * z_po4 ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_mg = 10 ^ (-0.5 * z_mg ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      g_nh4 = 10 ^ (-0.5 * z_nh4 ^ 2 * (I ^ 0.5 / (1 + I ^ 0.5) - 0.3 * I));
      a_ca = g_ca * S_ca;
      a_po4 = g_po4 * S_po4;
      a_mg = g_mg * S_mg;
      a_nh4 = g_nh4 * S_nh4;
      Ksp_acp = 10 ^ (-pKsp_acp) * exp(deltaH0_Ksp_acp / (R * 100) * (1 / T_ref - 1 / T_op));
      Ksp_stru = 10 ^ (-pKsp_stru) * exp(deltaH0_Ksp_stru / (R * 100) * (1 / T_ref - 1 / T_op));
      SI_acp = log(a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp) / abs(log(a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp));
      SI_stru = log(a_nh4 * a_po4 * a_mg / Ksp_stru) / abs(log(a_nh4 * a_po4 * a_mg / Ksp_stru));
      rp1 = kcryst_acp * X_acp * ((a_ca ^ 3 * a_po4 ^ 2 / Ksp_acp) ^ (1 / 5) - 1) ^ 2 * SI_acp;
      rp2 = kcryst_stru * X_stru * ((a_nh4 * a_po4 * a_mg / Ksp_stru) ^ (1 / 3) - 1) ^ 2 * SI_stru;
      24 * 3600 * der(X_acp) = Q / V_liq * (-X_acp) + rp1;
      24 * 3600 * der(X_stru) = Q / V_liq * (-X_stru) + rp2;
//Acid-base dynamics
      ra4 = k_AB_va * (S_vam * (Ka_va + S_h) - Ka_va * S_va);
      ra5 = k_AB_bu * (S_bum * (Ka_bu + S_h) - Ka_bu * S_bu);
      ra6 = k_AB_pro * (S_prom * (Ka_pro + S_h) - Ka_pro * S_pro);
      ra7 = k_AB_ac * (S_acm * (Ka_ac + S_h) - Ka_ac * S_ac);
      ra10 = k_AB_co2 * (S_hco3 * (Ka_co2 + S_h) - Ka_co2 * S_ic);
      ra11 = k_AB_IN * (S_nh3 * (Ka_nh4 + S_h) - Ka_nh4 * S_in);
      ra12 = k_AB_IP * (S_hpo4 * (Ka_h2po4 + S_h + Ka_h2po4 * Ka_hpo4 / S_h) - Ka_h2po4 * S_ip);
      ra13 = k_AB_IP * (S_po4 * (Ka_hpo4 + S_h + S_h ^ 2 / Ka_h2po4) - Ka_hpo4 * S_ip);
//Cations and anions
      24 * 3600 * der(S_cat) = Q / V_liq * (S_cat_in - S_cat);
      24 * 3600 * der(S_ca) = Q / V_liq * (S_ca_in - S_ca) - 3 * rp1;
      24 * 3600 * der(S_mg) = Q / V_liq * (S_mg_in - S_mg) - rp2;
      24 * 3600 * der(S_an) = Q / V_liq * (S_an_in - S_an);
      24 * 3600 * der(S_vam) = -ra4;
      24 * 3600 * der(S_bum) = -ra5;
      24 * 3600 * der(S_prom) = -ra6;
      24 * 3600 * der(S_acm) = -ra7;
      24 * 3600 * der(S_hco3) = -ra10;
      24 * 3600 * der(S_nh3) = -ra11;
      24 * 3600 * der(S_hpo4) = -ra12;
      24 * 3600 * der(S_po4) = -ra13;
      S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
      Theta = S_cat + S_nh4 + 2 * S_ca + 2 * S_mg - S_hco3 - S_acm / Ac_conv - S_prom / Pro_conv - S_bum / Bu_conv - S_vam / Va_conv - S_an - 2 * S_hpo4 - S_h2po4 - 3 * S_po4;
      S_nh4 = S_in - S_nh3;
      S_co2 = S_ic - S_hco3;
      S_oh = Ka_h2o * convKa / S_h;
      S_h2po4 = S_ip - S_hpo4 - S_po4;
      pH = -log10(S_h);
//Outputs
      Out[1] = pH;
      Out[2]=S_cat;
      Out[3]=S_an;
      Out[4]=S_ca;
      Out[5]=S_mg;
      Out[6]=S_vam;
      Out[7]=S_bum;
      Out[8]=S_prom;
      Out[9]=S_acm;
      Out[10]=S_hco3;
      Out[11]=S_nh3;
      Out[12]=S_hpo4;
      Out[13]=S_po4;
      Out[14]=S_nh4;
      Out[15]=S_co2;
      Out[16]=S_oh;
      Out[17]=S_h;
      Out[18]=S_h2po4;
      Out[19]=rp1;
      Out[20]=rp2;
      Out[21]=X_acp;
      Out[22]=X_stru;
    end pH_AE;
    
    model Fermenter
      extends ADM1_P.Icons.Digester;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_kinetic;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.StateVariablesADM1_bio;
      extends ADM1_P.OtherVariables_MassBalance;
      ADM1_P.Interfaces.Feed FeedMix_In annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Digestate Digestate_Out annotation(
        Placement(visible = true, transformation(origin = {72, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
        Modelica.Blocks.Interfaces.RealInput InF[22] annotation(
        Placement(visible = true, transformation(origin = {6, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-33, -87}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealOutput OutF[13] annotation(
        Placement(visible = true, transformation(origin = {98, -46}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {40, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput Fractions_In[9] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //Inputs from pH
      Real rp1;
      Real rp2;
      Real X_acp;
      Real X_stru;
      Real pH;
      Real S_cat;
      Real S_an;
      Real S_ca;
      Real S_mg;
      Real S_vam;
      Real S_bum;
      Real S_prom;
      Real S_acm;
      Real S_hco3;
      Real S_nh3;
      Real S_hpo4;
      Real S_po4;
      Real S_nh4;
      Real S_co2;
      Real S_oh;
      Real S_h;
      Real S_h2po4;
    equation
//Inputs
      f_ch1 = Fractions_In[1];
      f_ch2 = Fractions_In[2];
      f_ch3 = Fractions_In[3];
      f_pr1 = Fractions_In[4];
      f_pr2 = Fractions_In[5];
      f_pr3 = Fractions_In[6];
      f_li1 = Fractions_In[7];
      f_li2 = Fractions_In[8];
      f_li3 = Fractions_In[9];
      S_su_in = FeedMix_In.S_su;
      S_aa_in = FeedMix_In.S_aa;
      S_fa_in = FeedMix_In.S_fa;
      S_va_in = FeedMix_In.S_va;
      S_bu_in = FeedMix_In.S_bu; 
      S_pro_in = FeedMix_In.S_pro;
      S_ac_in = FeedMix_In.S_ac;
      S_h2_in = FeedMix_In.S_h2;
      S_ch4_in = FeedMix_In.S_ch4;
      S_ic_in = FeedMix_In.S_ic;
      S_in_in = FeedMix_In.S_in;
      S_ip_in = FeedMix_In.S_in;
      S_i_in = FeedMix_In.S_i;
      S_cat_in = FeedMix_In.S_cat;
      S_ca_in = FeedMix_In.S_ca;
      S_mg_in = FeedMix_In.S_mg;
      S_an_in = FeedMix_In.S_an;
      X_c_in = FeedMix_In.X_c;
      X_ch_in = FeedMix_In.X_ch;
      X_pr_in = FeedMix_In.X_pr;
      X_li_in = FeedMix_In.X_li;
      X_su_in = FeedMix_In.X_su;
      X_aa_in = FeedMix_In.X_aa;
      X_fa_in = FeedMix_In.X_fa; 
      X_c4_in = FeedMix_In.X_c4; 
      X_pro_in = FeedMix_In.X_pro;
      X_ac_in = FeedMix_In.X_ac;
      X_h2_in = FeedMix_In.X_h2;
      X_i_in = FeedMix_In.X_i;
      InF[1]=pH;
      InF[2]=S_cat;
      InF[3]=S_an;
      InF[4]=S_ca;
      InF[5]=S_mg;
      InF[6]=S_vam;
      InF[7]=S_bum;
      InF[8]=S_prom;
      InF[9]=S_acm;
      InF[10]=S_hco3;
      InF[11]=S_nh3;
      InF[12]=S_hpo4;
      InF[13]=S_po4;
      InF[14]=S_nh4;
      InF[15]=S_co2;
      InF[16]=S_oh;
      InF[17]=S_h;
      InF[18]=S_h2po4;
      InF[19]=rp1;
      InF[20]=rp2;
      InF[21]=X_acp;
      InF[22]=X_stru;
//
//TEMPERATURE DEPENDENT PARAMETERS
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4 * exp(deltaH0_KH_ch4 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2 * exp(deltaH0_KH_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2 * exp(deltaH0_KH_h2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
//Others with temperature correction
      p_gas_h2o = coeffph20_p * exp(coeffph20_T * (1 / T_ref - 1 / T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_hyd_ch1_T = k_hyd_ch1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr1_T = k_hyd_pr1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li1_T = k_hyd_li1 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_ch2_T = k_hyd_ch2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr2_T = k_hyd_pr2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li2_T = k_hyd_li2 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_ch3_T = k_hyd_ch3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr3_T = k_hyd_pr3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_li3_T = k_hyd_li3 * exp(th_k_hyd * (T_op - T_ref_k));
      k_m_su_T = k_m_su * exp(th_k_m_su * (T_op - T_ref_k));
      k_m_aa_T = k_m_aa * exp(th_k_m_aa * (T_op - T_ref_k));
      k_m_fa_T = k_m_fa * exp(th_k_m_fa * (T_op - T_ref_k));
      k_m_pro_T = k_m_pro * exp(th_k_m_pro * (T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac * exp(th_k_m_ac * (T_op - T_ref_k));
      k_m_h2_T = k_m_h2 * exp(th_k_m_h2 * (T_op - T_ref_k));
      Ks_su_T = Ks_su * exp(th_Ks_su * (T_op - T_ref_k));
      Ks_aa_T = Ks_aa * exp(th_Ks_aa * (T_op - T_ref_k));
      Ks_fa_T = Ks_fa * exp(th_Ks_fa * (T_op - T_ref_k));
      Ks_pro_T = Ks_pro * exp(th_Ks_pro * (T_op - T_ref_k));
//Ks_c4_T = Ks_c4 * exp(th_Ks_c4*(T_op - T_ref_k)); not found
      Ks_ac_T = Ks_ac * exp(th_Ks_ac * (T_op - T_ref_k));
      Ks_h2_T = Ks_h2 * exp(th_Ks_h2 * (T_op - T_ref_k));
      k_dec_su_T = k_dec_su * exp(th_k_dec_su * (T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa * exp(th_k_dec_aa * (T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa * exp(th_k_dec_fa * (T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro * exp(th_k_dec_pro * (T_op - T_ref_k));
//k_dec_c4_T = k_dec_c4 * exp(th_k_dec_c4*(T_op - T_ref_k)); not found
      k_dec_ac_T = k_dec_ac * exp(th_k_dec_ac * (T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2 * exp(th_k_dec_h2 * (T_op - T_ref_k));
//
//INHIBITION
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3 * ((pH - pH_UL_aa) / (pH_UL_aa - pH_LL_aa)) ^ 2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3 * ((pH - pH_UL_ac) / (pH_UL_ac - pH_LL_ac)) ^ 2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3 * ((pH - pH_UL_h2) / (pH_UL_h2 - pH_LL_h2)) ^ 2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1 / (1 + Ks_IN / S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1 / (1 + Ks_IP / S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1 / (1 + S_h2 / Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1 / (1 + S_h2 / Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1 / (1 + S_h2 / Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1 / (1 + S_nh3 / Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa * I_in_lim * I_ip_lim;
      I_6 = I_pH_aa * I_in_lim * I_ip_lim;
      I_7 = I_pH_aa * I_in_lim * I_h2_fa * I_ip_lim;
      I_8 = I_pH_aa * I_in_lim * I_h2_c4 * I_ip_lim;
      I_9 = I_pH_aa * I_in_lim * I_h2_c4 * I_ip_lim;
      I_10 = I_pH_aa * I_in_lim * I_h2_pro * I_ip_lim;
      I_11 = I_pH_ac * I_in_lim * I_nh3 * I_ip_lim;
      I_12 = I_pH_h2 * I_in_lim * I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-C_xc) + FeedMix_In.f_si_xc * C_si + FeedMix_In.f_ch_xc * C_ch + FeedMix_In.f_pr_xc * C_pr + FeedMix_In.f_li_xc * C_li + FeedMix_In.f_xi_xc * C_xi;
      v2 = (-C_ch) + C_su;
      v3 = (-C_pr) + C_aa;
      v4 = (-C_li) + (1 - f_fa_li) * C_su + f_fa_li * C_fa;
      v5 = (-C_su) + (1 - Y_su) * (f_bu_su * C_bu + f_pro_su * C_pro + f_ac_su * C_ac) + Y_su * C_bac;
      v6 = (-C_aa) + (1 - Y_aa) * (f_va_aa * C_va + f_bu_aa * C_bu + f_pro_aa * C_aa + f_ac_aa * C_aa) + Y_aa * C_bac;
      v7 = (-C_fa) + (1 - Y_fa) * 0.7 * C_ac + Y_fa * C_bac;
      v8 = (-C_va) + (1 - Y_c4) * 0.54 * C_pro + (1 - Y_c4) * 0.31 * C_ac + Y_c4 * C_bac;
      v9 = (-C_bu) + (1 - Y_c4) * 0.8 * C_ac + Y_c4 * C_bac;
      v10 = (-C_pro) + (1 - Y_pro) * 0.57 * C_ac + Y_pro * C_bac;
      v11 = (-C_ac) + (1 - Y_ac) * C_ch4 + Y_ac * C_bac;
      v12 = (1 - Y_h2) * C_ch4 + Y_h2 * C_bac;
      v13 = (-C_bac) + C_pr * f_pr_xb + C_ch * f_ch_xb + C_li * f_li_xb + C_xi * f_xi_xb + C_si * f_si_xb;
//RATES
//Biochemical process rates
      r1 = 0 "k_dis * X_c";
      r2_1 = f_ch1 * k_hyd_ch1_T * X_ch;
      r2_2 = f_ch2 * k_hyd_ch2_T * X_ch;
      r2_3 = f_ch3 * k_hyd_ch3_T * X_ch;
      r3_1 = f_pr1 * k_hyd_pr1_T * X_pr;
      r3_2 = f_pr2 * k_hyd_pr2_T * X_pr;
      r3_3 = f_pr3 * k_hyd_pr3_T * X_pr;
      r4_1 = f_li1 * k_hyd_li1_T * X_li;
      r4_2 = f_li2 * k_hyd_li2_T * X_li;
      r4_3 = f_li3 * k_hyd_li3_T * X_li;
      r5 = k_m_su_T * S_su / (S_su + Ks_su_T) * X_su * I_5;
      r6 = k_m_aa_T * S_aa / (S_aa + Ks_aa_T) * X_aa * I_6;
      r7 = k_m_fa_T * S_fa / (S_fa + Ks_fa_T) * X_fa * I_7;
      r8 = k_m_c4 * S_va / (S_va + Ks_c4) * X_c4 * S_va / (S_bu + S_va + epsilon) * I_8;
      r9 = k_m_c4 * S_bu / (S_bu + Ks_c4) * X_c4 * S_bu / (S_bu + S_va + epsilon) * I_9;
      r10 = k_m_pro_T * S_pro / (S_pro + Ks_pro_T) * X_pro * I_10;
      r11 = k_m_ac_T * S_ac / (S_ac + Ks_ac_T) * X_ac * I_11;
      r12 = k_m_h2_T * S_h2 / (S_h2 + Ks_h2_T) * X_h2 * I_12;
      r13 = k_dec_su_T * X_su;
      r14 = k_dec_aa_T * X_aa;
      r15 = k_dec_fa_T * X_fa;
      r16 = k_dec_c4 * X_c4;
      r17 = k_dec_pro_T * X_pro;
      r18 = k_dec_ac_T * X_ac;
      r19 = k_dec_h2_T * X_h2;
//
//Gas transfer rates
      rt8 = kla * (S_h2 - 16 * KH_h2 * p_gas_h2);
      rt9 = kla * (S_ch4 - 64 * KH_ch4 * p_gas_ch4);
      rt10 = kla * (S_co2 - KH_co2 * p_gas_co2);
//
//WATER PHASE EQUATIONS
      FeedMix_In.Q + Digestate_Out.Q = 0;
//
//Particulate matter
      24 * 3600 * der(X_c) = FeedMix_In.Q / V_liq * (X_c_in - X_c) - r1 "+ r13 + r14 + r15 + r16 + r17 + r18 + r19";
      24 * 3600 * der(X_ch) = FeedMix_In.Q / V_liq * (X_ch_in - X_ch) + FeedMix_In.f_ch_xc * r1 - r2_1 - r2_2 - r2_3 + f_ch_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_pr) = FeedMix_In.Q / V_liq * (X_pr_in - X_pr) + FeedMix_In.f_pr_xc * r1 - r3_1 - r3_2 - r3_2 + f_pr_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_li) = FeedMix_In.Q / V_liq * (X_li_in - X_li) + FeedMix_In.f_li_xc * r1 - r4_1 - r4_2 - r4_3 + f_li_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(X_i) = FeedMix_In.Q / V_liq * (X_i_in - X_i) + FeedMix_In.f_xi_xc * r1 + f_xi_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
//
//Soluble matter
      24 * 3600 * der(S_i) = FeedMix_In.Q / V_liq * (S_i_in - S_i) + FeedMix_In.f_si_xc * r1 + f_si_xb * (r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24 * 3600 * der(S_su) = FeedMix_In.Q / V_liq * (S_su_in - S_su) + r2_1 + r2_2 + r2_3 + (1 - f_fa_li) * (r4_1 + r4_2 + r4_3) - r5;
      24 * 3600 * der(S_aa) = FeedMix_In.Q / V_liq * (S_aa_in - S_aa) + r3_1 + r3_2 + r3_3 - r6;
      24 * 3600 * der(S_fa) = FeedMix_In.Q / V_liq * (S_fa_in - S_fa) + f_fa_li * (r4_1 + r4_2 + r4_3) - r7;
      24 * 3600 * der(S_va) = FeedMix_In.Q / V_liq * (S_va_in - S_va) + (1 - Y_aa) * f_va_aa * r6 - r8;
      24 * 3600 * der(S_bu) = FeedMix_In.Q / V_liq * (S_bu_in - S_bu) + (1 - Y_su) * f_bu_su * r5 + (1 - Y_aa) * f_bu_aa * r6 - r9;
      24 * 3600 * der(S_pro) = FeedMix_In.Q / V_liq * (S_pro_in - S_pro) + (1 - Y_su) * f_pro_su * r5 + (1 - Y_aa) * f_pro_aa * r6 + (1 - Y_c4) * 0.54 * r8 - r10;
      24 * 3600 * der(S_ac) = FeedMix_In.Q / V_liq * (S_ac_in - S_ac) + (1 - Y_su) * f_ac_su * r5 + (1 - Y_aa) * f_ac_aa * r6 + (1 - Y_fa) * 0.7 * r7 + (1 - Y_c4) * 0.31 * r8 + (1 - Y_c4) * 0.8 * r9 + (1 - Y_pro) * 0.57 * r10 - r11;
      24 * 3600 * der(S_h2) = FeedMix_In.Q / V_liq * (S_h2_in - S_h2) + (1 - Y_su) * f_h2_su * r5 + (1 - Y_aa) * f_h2_aa * r6 + (1 - Y_fa) * 0.3 * r7 + (1 - Y_c4) * 0.15 * r8 + (1 - Y_c4) * 0.2 * r9 + (1 - Y_pro) * 0.43 * r10 - r12 - rt8;
      24 * 3600 * der(S_ch4) = FeedMix_In.Q / V_liq * (S_ch4_in - S_ch4) + (1 - Y_ac) * r11 + (1 - Y_h2) * r12 - rt9;
      24 * 3600 * der(S_ic) = FeedMix_In.Q / V_liq * (S_ic_in - S_ic) - (v1 * r1 + v2 * (r2_1 + r2_2 + r2_3) + v3 * (r3_1 + r3_2 + r3_3) + v4 * (r4_1 + r4_2 + r4_3) + v5 * r5 + v6 * r6 + v7 * r7 + v8 * r8 + v9 * r9 + v10 * r10 + v11 * r11 + v12 * r12 + v13 * (r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10;
      24 * 3600 * der(S_in) = FeedMix_In.Q / V_liq * (S_in_in - S_in) - Y_su * N_bac * r5 + (N_aa - Y_aa * N_bac) * r6 - Y_fa * N_bac * r7 - Y_c4 * N_bac * r8 - Y_c4 * N_bac * r9 - Y_pro * N_bac * r10 - Y_ac * N_bac * r11 - Y_h2 * N_bac * r12 + (N_bac - N_i * f_xi_xb - N_aa * f_pr_xb) * (r13 + r14 + r15 + r16 + r17 + r18 + r19) - rp2;
      24 * 3600 * der(S_ip) = FeedMix_In.Q / V_liq * (S_ip_in - S_ip) + P_li * (r4_1 + r4_2 + r4_3) - Y_su * P_bac * r5 - Y_aa * P_bac * r6 - Y_fa * P_bac * r7 - Y_c4 * P_bac * r8 - Y_c4 * P_bac * r9 - Y_pro * P_bac * r10 - Y_ac * P_bac * r11 - Y_h2 * P_bac * r12 + (P_bac - P_i * f_xi_xb - P_li * f_li_xb) * (r13 + r14 + r15 + r16 + r17 + r18 + r19) - 2 * rp1 - rp2;
//
//Biomasses
      24 * 3600 * der(X_su) = FeedMix_In.Q / V_liq * (X_su_in - X_su) + Y_su * r5 - r13;
      24 * 3600 * der(X_aa) = FeedMix_In.Q / V_liq * (X_aa_in - X_aa) + Y_aa * r6 - r14;
      24 * 3600 * der(X_fa) = FeedMix_In.Q / V_liq * (X_fa_in - X_fa) + Y_fa * r7 - r15;
      24 * 3600 * der(X_c4) = FeedMix_In.Q / V_liq * (X_c4_in - X_c4) + Y_c4 * r8 + Y_c4 * r9 - r16;
      24 * 3600 * der(X_pro) = FeedMix_In.Q / V_liq * (X_pro_in - X_pro) + Y_pro * r10 - r17;
      24 * 3600 * der(X_ac) = FeedMix_In.Q / V_liq * (X_ac_in - X_ac) + Y_ac * r11 - r18;
      24 * 3600 * der(X_h2) = FeedMix_In.Q / V_liq * (X_h2_in - X_h2) + Y_h2 * r12 - r19;
//
//GAS PHASE EQUATIONS
      24 * 3600 * der(S_gas_h2) = (-S_gas_h2 * Q_gas / V_gas) + rt8 * V_liq / V_gas;
      24 * 3600 * der(S_gas_ch4) = (-S_gas_ch4 * Q_gas / V_gas) + rt9 * V_liq / V_gas;
      24 * 3600 * der(S_gas_co2) = (-S_gas_co2 * Q_gas / V_gas) + rt10 * V_liq / V_gas;
      p_gas_h2 = S_gas_h2 * R * T_op / h2_conv;
      p_gas_ch4 = S_gas_ch4 * R * T_op / ch4_conv;
      p_gas_co2 = S_gas_co2 * R * T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
//Q_gas = k_p * (P_gas - P_atm)
      Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas * 273.15 / T_op / P_atm * P_gas "Biogas rate [m3/d] at standard conditions";
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq / FeedMix_In.Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in / V_liq "Organic Loading Rate [kgCOD/m3/d]";
//
//CONVERSION FOR INTERFACE "DIGESTATE"
      Digestate_Out.S_su = S_su;
      Digestate_Out.S_aa = S_aa;
      Digestate_Out.S_fa = S_fa;
      Digestate_Out.S_va = S_va;
      Digestate_Out.S_bu = S_bu;
      Digestate_Out.S_pro = S_pro;
      Digestate_Out.S_ac = S_ac;
      Digestate_Out.S_h2 = S_h2;
      Digestate_Out.S_ch4 = S_ch4;
      Digestate_Out.S_ic = S_ic;
      Digestate_Out.S_in = S_in;
      Digestate_Out.S_ip = S_ip;
      Digestate_Out.S_i = S_i;
      Digestate_Out.S_cat = S_cat;
      Digestate_Out.S_ca = S_ca;
      Digestate_Out.S_mg = S_mg;
      Digestate_Out.S_an = S_an;
      Digestate_Out.X_c = X_c;
      Digestate_Out.X_ch = X_ch;
      Digestate_Out.X_pr = X_pr;
      Digestate_Out.X_li = X_li;
      Digestate_Out.X_su = X_su;
      Digestate_Out.X_aa = X_aa;
      Digestate_Out.X_fa = X_fa;
      Digestate_Out.X_c4 = X_c4;
      Digestate_Out.X_pro = X_pro;
      Digestate_Out.X_ac = X_ac;
      Digestate_Out.X_h2 = X_h2;
      Digestate_Out.X_i = X_i;
      Digestate_Out.S_hco3 = S_hco3;
      Digestate_Out.S_co2 = S_co2;
      Digestate_Out.S_h = S_h;
      Digestate_Out.S_oh = S_oh;
      Digestate_Out.S_nh3 = S_nh3;
      Digestate_Out.S_nh4 = S_nh4;
      Digestate_Out.S_h2po4 = S_h2po4;
      Digestate_Out.S_hpo4 = S_hpo4;
      Digestate_Out.S_acm = S_acm;
      Digestate_Out.S_prom = S_prom;
      Digestate_Out.S_bum = S_bum;
      Digestate_Out.S_vam = S_vam;
      Digestate_Out.S_gas_h2 = S_gas_h2;
      Digestate_Out.S_gas_ch4 = S_gas_ch4;
      Digestate_Out.S_gas_co2 = S_gas_co2;
      Digestate_Out.X_acp = X_acp;
      Digestate_Out.X_stru = X_stru;
//
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.P_gas = P_gas;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
//MASS BALANCES
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_aa + X_ac + X_c4 + X_ch + X_fa + X_h2 + X_i + X_li + X_pr + X_pro + X_su "+X_c; Particulate COD concentration";
      COD_balance_in = FeedMix_In.Q * (S_aa_in + S_ac_in + S_bu_in + S_ch4_in + S_fa_in + S_h2_in + S_i_in + S_pro_in + S_su_in + S_va_in + X_aa_in + X_ac_in + X_c4_in + X_fa_in + X_h2_in + X_pro_in + X_su_in + X_ch_in + X_c_in + X_i_in + X_li_in + X_pr_in);
      COD_balance_out = Digestate_Out.Q * (COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N * (p_gas_ch4 / (P_gas - p_gas_h2o) / (R / 64 * 273.15 / 1.01325) + p_gas_h2 / (P_gas - p_gas_h2o) / (R / 16 * 273.15 / 1.01325));
      24 * 3600 * der(CH4_cum) = ((1 - Y_ac) * r11 + (1 - Y_h2) * r12) * V_liq;
      24 * 3600 * der(V_in_cum) = FeedMix_In.Q;
      24 * 3600 * der(COD_balance_in_cum) = COD_balance_in;
      24 * 3600 * der(COD_balance_out_cum) = COD_balance_out;
      24 * 3600 * der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = FeedMix_In.Q * (S_ic_in + C_xc * X_c_in + C_si * S_i_in + C_xi * X_i_in + C_ch * X_ch_in + C_pr * X_pr_in + C_li * X_li_in + C_su * S_su_in + C_aa * S_aa_in + C_fa * S_fa_in + C_va * S_va_in + C_bu * S_bu_in + C_pro * S_pro_in + C_ac * S_ac_in + C_ch4 * S_ch4_in + C_bac * (X_su_in + X_aa_in + X_fa_in + X_c4_in + X_pro_in + X_ac_in + X_h2_in));
      IC_balance_out = Digestate_Out.Q * (S_ic + C_si * S_i + C_xi * X_i + C_ch * X_ch + C_pr * X_pr + C_li * X_li + C_su * S_su + C_aa * S_aa + C_fa * S_fa + C_va * S_va + C_bu * S_bu + C_pro * S_pro + C_ac * S_ac + C_ch4 * S_ch4 + C_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)) "+C_xc * X_c";
      IC_balance_gas = Biogas_Out.Q_gas_N * (C_ch4 * p_gas_ch4 / (P_gas - p_gas_h2o) / (R / 64 * 273.15 / 1.01325) + p_gas_co2 / (P_gas - p_gas_h2o) / R / 273.15 * 1.01325);
      24 * 3600 * der(IC_balance_in_cum) = IC_balance_in;
      24 * 3600 * der(IC_balance_out_cum) = IC_balance_out;
      24 * 3600 * der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = FeedMix_In.Q * (S_in_in + N_xc * X_c_in + N_i * (S_i_in + X_i_in) + N_aa * (S_aa_in + X_pr_in) + N_bac * (X_su_in + X_aa_in + X_fa_in + X_c4_in + X_pro_in + X_ac_in + X_h2_in));
      IN_balance_out = Digestate_Out.Q * (S_in + N_i * (S_i + X_i) + N_aa * (S_aa + X_pr) + N_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru);
      24 * 3600 * der(IN_balance_in_cum) = IN_balance_in;
      24 * 3600 * der(IN_balance_out_cum) = IN_balance_out;
//Inorganic Phosforous Balance
      IP_balance_in = FeedMix_In.Q * (S_ip_in + P_i * (S_i_in + X_i_in) + P_li * X_li + P_bac * (X_su_in + X_aa_in + X_fa_in + X_c4_in + X_pro_in + X_ac_in + X_h2_in));
      IP_balance_out = Digestate_Out.Q * (S_ip + P_i * (S_i + X_i) + P_li * X_li + P_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2 * X_acp + X_stru);
      24 * 3600 * der(IP_balance_in_cum) = IP_balance_in;
      24 * 3600 * der(IP_balance_out_cum) = IP_balance_out;
      24 * 3600 * der(Vcum) = FeedMix_In.Q;
//Outputs
      T_op = OutF[1];
      FeedMix_In.Q = OutF[2];
      S_ip = OutF[3];
      S_ic = OutF[4];
      S_in = OutF[5];
      S_va = OutF[6];
      S_bu = OutF[7];
      S_pro = OutF[8];
      S_ac = OutF[9];
      S_cat_in = OutF[10];
      S_an_in = OutF[11];
      S_ca_in = OutF[12];
      S_mg_in = OutF[13];
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
    end Fermenter;
  end BlockLibrary;

  class SynopticModel
    ADM1_P.BlockLibrary.Feed_Source_1 CattleManure annotation(
      Placement(visible = true, transformation(origin = {-126, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_2 CattleSlurry annotation(
      Placement(visible = true, transformation(origin = {-116, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_3 MaizeSilage annotation(
      Placement(visible = true, transformation(origin = {-120, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester digester annotation(
      Placement(visible = true, transformation(origin = {7, 15}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {54, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_T Probe_T annotation(
      Placement(visible = true, transformation(origin = {-28, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_CH4_perc probe_CH4_perc annotation(
      Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_CO2_perc probe_CO2_perc annotation(
      Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sludge_Discharge Discharge annotation(
      Placement(visible = true, transformation(origin = {74, -1}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.InitPID.NoInit, k = 1.5, limitsAtInit = true, strict = false, yMax = 10000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Probe_P Probe_P annotation(
      Placement(visible = true, transformation(origin = {-56, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{18.5, 34}, {18.5, 56}, {46, 56}}));
  connect(digester.T_op, Probe_T.y_T) annotation(
      Line(points = {{-11.5, 0}, {-19, 0}, {-19, -18}}, color = {0, 0, 127}));
    connect(Gas_Meter.CH4_perc_exp, probe_CH4_perc.y_CH4) annotation(
      Line(points = {{52, 64}, {40, 64}, {40, 72}}, color = {0, 0, 127}));
    connect(Gas_Meter.CO2_perc_exp, probe_CO2_perc.y_CO2) annotation(
      Line(points = {{56, 64}, {70, 64}, {70, 71}}, color = {0, 0, 127}));
  connect(digester.Digestate_Out, Discharge.Digestate_In) annotation(
      Line(points = {{26, -1.5}, {42.5, -1.5}, {42.5, 6}, {47, 6}}));
  connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {6, 55.25}, {8, 55.25}, {8, 38.5}}, color = {0, 0, 127}));
    connect(Probe_P.y_P, PID_Pgas.u_m) annotation(
      Line(points = {{-46, 72}, {-42, 72}, {-42, 50}, {-6, 50}, {-6, 60}}, color = {0, 0, 127}));
  connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-28, 72}, {-28, 52}, {4, 52}, {4, 38.5}}, color = {0, 0, 127}));
connect(CattleSlurry.Slurry_Out, feeding_Tank.Slurry_In) annotation(
      Line(points = {{-108, 20}, {-82, 20}}));
connect(CattleManure.Manure_Out, feeding_Tank.Manure_In) annotation(
      Line(points = {{-118, 50}, {-82, 50}, {-82, 30}}));
connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-50, 17}, {-12, 17}, {-12, 26}}));
connect(feeding_Tank.Fractions_Out, digester.Fractions_In) annotation(
      Line(points = {{-50, 13}, {-30, 13}, {-30, 6}, {-12, 6}}, color = {0, 0, 127}, thickness = 0.5));
connect(MaizeSilage.MaizeSilage_Out, feeding_Tank.MaizeSilage_In) annotation(
      Line(points = {{-112, -12}, {-82, -12}, {-82, 4}}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 240),
      Diagram);
  end SynopticModel;
  
  class SynopticModel2
    ADM1_P.BlockLibrary.Feed_Source_1 CattleManure annotation(
      Placement(visible = true, transformation(origin = {-126, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_2 CattleSlurry annotation(
      Placement(visible = true, transformation(origin = {-116, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_3 MaizeSilage annotation(
      Placement(visible = true, transformation(origin = {-120, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {54, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_T Probe_T annotation(
      Placement(visible = true, transformation(origin = {-28, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_CH4_perc probe_CH4_perc annotation(
      Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_CO2_perc probe_CO2_perc annotation(
      Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sludge_Discharge Discharge annotation(
      Placement(visible = true, transformation(origin = {74, -1}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.InitPID.NoInit, k = 1.5, limitsAtInit = true, strict = false, yMax = 10000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Probe_P Probe_P annotation(
      Placement(visible = true, transformation(origin = {-56, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BlockLibrary.pH_AE pH_AE_ annotation(
      Placement(visible = true, transformation(origin = {6, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ADM1_P.BlockLibrary.Fermenter fermenter annotation(
      Placement(visible = true, transformation(origin = {5, 15}, extent = {{-27, -27}, {27, 27}}, rotation = 0)));
  equation
    connect(Gas_Meter.CH4_perc_exp, probe_CH4_perc.y_CH4) annotation(
      Line(points = {{52, 64}, {40, 64}, {40, 72}}, color = {0, 0, 127}));
    connect(Gas_Meter.CO2_perc_exp, probe_CO2_perc.y_CO2) annotation(
      Line(points = {{56, 64}, {70, 64}, {70, 71}}, color = {0, 0, 127}));
    connect(Probe_P.y_P, PID_Pgas.u_m) annotation(
      Line(points = {{-46, 72}, {-42, 72}, {-42, 50}, {-6, 50}, {-6, 60}}, color = {0, 0, 127}));
    connect(CattleSlurry.Slurry_Out, feeding_Tank.Slurry_In) annotation(
      Line(points = {{-108, 20}, {-82, 20}}));
    connect(CattleManure.Manure_Out, feeding_Tank.Manure_In) annotation(
      Line(points = {{-118, 50}, {-82, 50}, {-82, 30}}));
    connect(MaizeSilage.MaizeSilage_Out, feeding_Tank.MaizeSilage_In) annotation(
      Line(points = {{-112, -12}, {-82, -12}, {-82, 4}}));
  connect(pH_AE_.Out, fermenter.InF) annotation(
      Line(points = {{14, -68}, {28, -68}, {28, -34}, {-4, -34}, {-4, -8}}, color = {0, 0, 127}, thickness = 0.5));
  connect(fermenter.OutF, pH_AE_.In) annotation(
      Line(points = {{16, -10}, {16, -28}, {-12, -28}, {-12, -68}, {-2, -68}}, color = {0, 0, 127}, thickness = 0.5));
  connect(fermenter.Digestate_Out, Discharge.Digestate_In) annotation(
      Line(points = {{26, -2}, {48, -2}, {48, 6}}));
  connect(fermenter.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{18, 36}, {46, 36}, {46, 56}}));
  connect(feeding_Tank.FeedMix_Out, fermenter.FeedMix_In) annotation(
      Line(points = {{-50, 18}, {-16, 18}, {-16, 26}}));
  connect(feeding_Tank.Fractions_Out, fermenter.Fractions_In) annotation(
      Line(points = {{-50, 12}, {-14, 12}, {-14, 4}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Probe_T.y_T, fermenter.T_op) annotation(
      Line(points = {{-18, -18}, {-14, -18}, {-14, -2}}, color = {0, 0, 127}));
  connect(PID_Pgas.y, fermenter.u) annotation(
      Line(points = {{6, 72}, {6, 40}}, color = {0, 0, 127}));
  connect(fermenter.P_gas, PID_Pgas.u_s) annotation(
      Line(points = {{2, 40}, {-26, 40}, {-26, 72}, {-18, 72}}, color = {0, 0, 127}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 240),
      Diagram);
  end SynopticModel2;

  package Types
    type FlowRate_d = Real(final quantity = "Daily flow rate", final unit = "m3/d", final displayUnit = "m3/d");
    type Kinetic_s = Real(final quantity = "Inverse time-second", final unit = "1/s", final displayUnit = "1/s", min = 0);
    type Kinetic_d = Real(final quantity = "Inverse time-day", final unit = "1/d", final displayUnit = "1/d", min = 0);
    type MassConcRate = Real(final quantity = "COD concentration per unit time", final unit = "kg/(m3.s)", final displayUnit = "kg/(m3.d)");
    type MolConcRate = Real(final quantity = "Molar concentration per unit time", final unit = "mol/(m3.s)", final displayUnit = "kmol/(m3.d)");
    type InvMolConcRate = Real(final quantity = "Molar concentration rate", final unit = "m3/(mol.s)", final displayUnit = "m3/(mol.s)", min = 0);
    type MassConversion = Real(final quantity = "Mass of COD per unit mass of VS", final unit = "kg/kg", final displayUnit = "kg/kg", min = 0);
    //type VStoN_conversion = Real(final quantity = "Mass of VS per unit mass of nitrogen", final unit = "kg/kg", final displayUnit = "kg/kg", min = 0);
    type Mole = Real(final quantity = "Number of moles", final unit = "mol", displayUnit = "mol", min = 0);
    type MolarContent = Real(final quantity = "Mass of carbon or nitrogen per unit mass of COD", final unit = "mol/kg", final displayUnit = "mol/kg", min = 0);
    //type N_content = Real(final quantity = "Mass of nitrogen per unit mass of COD", final unit = "mol/kg", final displayUnit = "mol/kg", min = 0);
    //type Enthalpy = Real(final quantity = "Reaction enthalpy", final unit = "J/kmol", final displayUnit = "J/kmol", min = 0) "sarebbe 100*bar*m3/kmol";
    type Henry = Real(final quantity = "Henry constant", final unit = "mol/(m3.Pa)", final displayUnit = "mol/(m3.Pa)", min = 0);
    //type ThetaCoeff = Real(final quantity = "Inverse temperature", final unit = "1/K", final displayUnit = "1/K", min = 0);
    type Inhibition = Real(final quantity = "Rate fraction", final unit = "1", final displayUnit = "1", min = 0, max = 1);
    //type Diffusivity = Real(final quantity = "Gas diffusivity in liquid-phase", final unit = "m2/s", final displayUnit = "cm2/s", min = 0);
    type MassContent = Real(final quantity = "Total Solid content in substrate unit mass", final unit = "g/kg", final displayUnit = "g/kg", min = 0);
    //type VScontent = Real(final quantity = "Volatile Solid in substrate unit mass", final unit = "g/kg", final displayUnit = "g/kg", min = 0);
    type MassConcentration_g = Real(final quantity = "Volatile Solid concentration", final unit = "g/m3", final displayUnit = "g/m3", min = 0);
    //type NConcentration = Real(final quantity = "Nitrogen concentration", final unit = "g/m3", final displayUnit = "g/m3", min = 0);
    //type TKNConcentration = Real(final quantity = "Total Kjeldahl Nitrogen concentration", final unit = "mg/kg", final displayUnit = "mg/kg", min = 0);
    type BMP = Real(final quantity = "Biochemical Methane Potential on VS basis", final unit = "l/kg", final displayUnit = "l/kg", min = 0);
    
    type Pressure_bar = Real(final quantity = "Pressure", final unit = "bar", final displayUnit = "bar");
    
    type MolarDensity_M = Real(final quantity = "MolarDensity_M", unit = "kmol/m3");
    
    type SatIndex = Real(final quantity = "Saturation Index", final unit = "1", final displayUnit = "1");
    
    type MolarDensity_M_Ksp_acp = Real(final quantity = "MolarDensity_M", unit = "kmol5/m15");
    
    type MolarDensity_M_Ksp_stru = Real(final quantity = "MolarDensity_M", unit = "kmol3/m9");
    //type BMP_COD = Real(final quantity = "Biochemical Methane Potential on COD basis", final unit = "l/kg", final displayUnit = "l/kg", min = 0);
    //type Alkalinity = Real(final quantity = "Alkalinity as CaCO3", final unit = "g/m3", final displayUnit = "g/m3", min = 0);
    //type MolConcentration = Real(final quantity = "Molar concentration", final unit = "mol/m3", final displayUnit = "kmol/m3", min = 0);
    //type CODConcentration = Real(final quantity = "COD concentration", final unit = "kg/m3", final displayUnit = "kg/m3", min = 0);
    //type Stoichio_CODmol = Real(final quantity = "Stoichiometric mass of COD per molar unit", final unit = "kg/mol", final displayUnit = "kg/kmol", min = 0);
    //type MassFraction_COD = Real(final quantity = "COD Mass fraction", final unit = "kg/kg", final displayUnit = "kg/kg", min = 0, max = 1);
    //type MassFraction_VS = Real(final quantity = "VS Mass fraction", final unit = "g/kg", final displayUnit = "g/kg", min = 0);
    //type COD_flowrate_s = Real(final quantity = "COD mass flowrate", final unit = "kg/s", final displayUnit = "kg/d", min = 0);
    //type MolC_flowrate_s = Real(final quantity = "Carbon molar mass flowrate", final unit = "mol/s", final displayUnit = "mol/d", min = 0);
    //type MolN_flowrate_s = Real(final quantity = "Nitrogen molar mass flowrate", final unit = "mol/s", final displayUnit = "mol/d", min = 0);
  end Types;
  annotation(
    uses(Modelica(version = "3.2.3")));
end ADM1_P;
