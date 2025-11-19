package ADM1_P
  record OtherVariables_Feed
    //Feed composition: only "Real" for dynamic trajectory specified in "All" model or in the model block from Combi
    //Feed composition: "parameter" for fixed value specified here or in "All" model
    //  parameter Real Flow_in2(fixed = false, start = 0) = 190 "m3/d";
    //  parameter Real TS_in2(fixed = false, start = 0) = 90 "??; gTS/kg";
    //  parameter Real VS_in2(fixed = false, start = 0) = 0.95 * 90 "??, gVS/kg";
    //  parameter Real ac_in2(fixed = false, start = 0) = 0.027 "gCOD/L";
    //  parameter Real pro_in2(fixed = false, start = 0) = 0.010 "gCOD/L";
    //  parameter Real bu_in2(fixed = false, start = 0) = 0.002 "gCOD/L";
    //  parameter Real va_in2(fixed = false, start = 0) = 0.002 "gCOD/L";
    //  parameter Real Ssu_in2(fixed = false, start = 0) = 0.016 "gCOD/L";
    //  parameter Real Saa_in2(fixed = false, start = 0) = 0.008 "gCOD/L";
    //  parameter Real Sfa_in2(fixed = false, start = 0) = 0.000 "gCOD/L";
    //  parameter Real Si_in2(fixed = false, start = 0) = 0.027 "gCOD/L";
    //  parameter Real tBMP_VS_in2(fixed = false, start = 0) = 0.0 "NmLCH4/gVS";
    //  parameter Real pH_in2(fixed = false, start = 0) = 7.2;
    //  parameter Real Alk_in2(fixed = false, start = 0) = 0;
    //  parameter Real Ammonium_in2(fixed = false, start = 0) = 700 "mgN/L";
    //  parameter Real Fosfates_in2(fixed = false, start = 0) = 713 "mgP/L";
    //  parameter Real Carbonates_in2(fixed = false, start = 0) = 384 "mgC/L";
    //  parameter Real Ca_in2(fixed = false, start = 0) = 0.007 "mol/L";
    //  parameter Real Mg_in2(fixed = false, start = 0) = 0.013 "mol/L";
    //  parameter Real Xi_in2(fixed = false, start = 0) = 12.332;
    //  parameter Real Xpr_in2(fixed = false, start = 0) = 9.543;
    //  parameter Real Xli_in2(fixed = false, start = 0) = 12.768;
    //  parameter Real Xch_in2(fixed = false, start = 0) = 9.082;
    //
    //Feed algebraic variables (computed within the block model)
    Real u_in(fixed = false, start = 0);
    Real v_in(fixed = false, start = 0);
    Real d_in(fixed = false, start = 0);
    //  Real alpha_in2(fixed = false, start = 0);
    Real COD_VFA_in(fixed = false, start = 0);
    //  Real pLI_pVS_in2(fixed = false, start = 0);
    //  Real tLI_in2(fixed = false, start = 0);
    Real tCOD_in(fixed = false, start = 0);
    Real pCOD_in(fixed = false, start = 0);
    Real tBMP_COD_in(fixed = false, start = 0);
    Real Ka_co2_in(fixed = false, start = 0);
    Real Ka_nh4_in(fixed = false, start = 0);
    Real Ka_h2o_in(fixed = false, start = 0);
    Real Ka_h2po4_in(fixed = false, start = 0);
    Real Ka_hpo4_in(fixed = false, start = 0);
    Real S_h_in(fixed = false, start = 0);
    Real S_oh_in(fixed = false, start = 0);
    Real S_ac_mol_in(fixed = false, start = 0);
    Real S_pro_mol_in(fixed = false, start = 0);
    Real S_bu_mol_in(fixed = false, start = 0);
    Real S_va_mol_in(fixed = false, start = 0);
    Real S_ac_ion_in(fixed = false, start = 0);
    Real S_pro_ion_in(fixed = false, start = 0);
    Real S_bu_ion_in(fixed = false, start = 0);
    Real S_va_ion_in(fixed = false, start = 0);
    Real S_hpo4_in(fixed = false, start = 0);
    Real S_po4_in(fixed = false, start = 0);
    Real S_h2po4_in(fixed = false, start = 0);
    Real Alk_mol_in(fixed = false, start = 0);
    Real S_hco3_in(fixed = false, start = 0);
    Real S_nh4_in(fixed = false, start = 0);
    //
    //Assumptions
    parameter Real S_an_in(unit = "mol/L") = 0.02;
    parameter Real S_h2_in(unit = "gCOD/L") = 1e-8;
    parameter Real S_ch4_in(unit = "gCOD/L") = 1e-5;
    //  parameter Real S_su_in(unit = "gCOD/L") = 0;
    //  parameter Real S_aa_in(unit = "gCOD/L") = 0;
    //  parameter Real S_fa_in(unit = "gCOD/L") = 0;
    //  parameter Real S_i_in(unit = "gCOD/L") = 0;
    parameter Real X_su_in(unit = "gCOD/L") = 0;
    parameter Real X_aa_in(unit = "gCOD/L") = 0;
    parameter Real X_fa_in(unit = "gCOD/L") = 0;
    parameter Real X_c4_in(unit = "gCOD/L") = 0;
    parameter Real X_pro_in(unit = "gCOD/L") = 0;
    parameter Real X_ac_in(unit = "gCOD/L") = 0;
    parameter Real X_h2_in(unit = "gCOD/L") = 0;
  end OtherVariables_Feed;

  record StateVariablesADM1_mpp
    //MPP submodel (X_salt are states)
    Types.MolarDensity_M X_acp(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L rimetti true!";
    Types.MolarDensity_M X_stru(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L rimetti true!";
    Types.MolarDensity_M X_ccm(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
    Types.MolConcRate rp1(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rp2(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rd1(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rd2(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rp3(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rd3(nominal = 1e-4) "mol/L*d";
    Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
    Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
    Types.MolarDensity_M_Ksp_acp Ksp_ccm(nominal = 1e-9);
    Modelica.SIunits.PerUnit SI_stru(nominal = 1);
    Modelica.SIunits.PerUnit SI_acp(nominal = 1);
    Modelica.SIunits.PerUnit SI_ccm(nominal = 1);
    Real arg_log_acp;
    Real arg_log_stru;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_mpp;

  record StateVariablesADM1_pc
    Modelica.SIunits.MassConcentration S_vam(fixed = false, start = 1.00433E-05*208) "Valerate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_bum(fixed = false, start = 2.04904E-05*160) "Butyrate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_prom(fixed = false, start = 0.000145231*112) "Propionate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_acm(fixed = false, start = 0.012145469*60) "Acetate ion inerts concentration in digestate [kgCOD/m3]";
    Types.MolarDensity_M S_hco3(fixed = false, start = 0.302539) "8/10";
    Types.MolarDensity_M S_co3(fixed = false, start = 4.01e-3, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_nh3(fixed = false, start = 0.242044 - 0.161871282, nominal = 1e-2) "8/10";
    Types.MolarDensity_M S_nh4(fixed = false, start = 0.161871282, nominal = 1e-1) "from I value fixed; 8/10";
    Types.MolarDensity_M S_hpo4(fixed = false, start = 0.00509761, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_h2po4(fixed = false, start = 0.00126826, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_h3po4(fixed = false, start = 1.24e-9, nominal = 1e-9) "8/10";
    Types.MolarDensity_M S_po4(fixed = false, start = 8.37E-08, nominal = 1e-8) "8/10";
    Types.MolarDensity_M S_co2(fixed = false, start = 0.00985188) "8/10";
    Modelica.SIunits.PerUnit pH(fixed = false, start = 7.11, nominal = 7) "Digestate pH [-]";
    Types.MolarDensity_M S_h(fixed = true, start = 1.481088E-07, nominal = 1e-7, min = 1e-7, max = 1.7e-7) "8/10";
    Types.MolarDensity_M S_oh(fixed = false, start = 1.46E-06) "8/10";
    Types.MolarDensity_M Theta(fixed = false, start = 0.02, nominal = 1e-8);
    Real Ka_co2(fixed = false, start = 4.94e-7);
    Real Ka_hco3(fixed = false, start = 6.32e-11);
    Real Ka_nh4(fixed = false, start = 1.11e-9);
    Real Ka_h2o(fixed = false, start = 2.08e-14);
    Real Ka_h2po4(fixed = false, start = 6.20e-8);
    Real Ka_hpo4(fixed = false, start = 2.14e-13);
    Real Ka_h3po4(fixed = false, start = 2.14e-2);
    //Process rates
    Real ra4(fixed = false, start = 0);
    Real ra5(fixed = false, start = 0);
    Real ra6(fixed = false, start = 0);
    Real ra7(fixed = false, start = 0);
    Real ra10(fixed = false, start = 0);
    Real ra11(fixed = false, start = 0);
    Real ra12(fixed = false, start = 0);
    Real ra13(fixed = false, start = 0);
    //MPP submodel (X_salt are states)
    Types.MolarDensity_M a_ca(nominal = 1e-5) "mol/L";
    Types.MolarDensity_M a_po4(nominal = 1e-9) "mol/L";
    Types.MolarDensity_M a_nh4(nominal = 1e-2) "mol/L";
    Types.MolarDensity_M a_mg(nominal = 1e-5) "mol/L";
    Types.MolarDensity_M a_h(nominal = 1e-9) "mol/L";
    Types.MolarDensity_M a_hco3(nominal = 1e-2) "mol/L";
    Types.MolarDensity_M a_hpo4(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_h2po4(nominal = 1e-9) "mol/L";
    Types.MolarDensity_M a_co3(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_acm(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_prom(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_bum(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_vam(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_h2o(nominal = 1e-1) "mol/L";
    Types.MolarDensity_M a_oh(nominal = 1e-7) "mol/L";
    Types.MolarDensity_M I(fixed = false, start = 3.6097E-01 - 0.231228 - 1.75824e-5 - 0.000794234 - 0.00158847, nominal = 1e-1) "mol/L";
    Real g_mono;
    Real g_bi;
    Real g_tri;
    //  Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
    //  Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
    //  Types.MolarDensity_M_Ksp_acp Ksp_ccm(nominal = 1e-9);
    //  Modelica.SIunits.PerUnit SI_stru(nominal = 1);
    //  Modelica.SIunits.PerUnit SI_acp(nominal = 1);
    //  Modelica.SIunits.PerUnit SI_ccm(nominal = 1);
    Real charge;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_pc;

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
    Types.MolarDensity_M S_ic(fixed = true, start = 0.0312386) "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_in(fixed = true, start = 0.0242044) "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ip(fixed = true, start = 0.00659511, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_cat(fixed = false, start = 0.118805) "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ca(fixed = true, start = 0.001 "0.00027486", nominal = 1e-4) "rimetti true!";
    Types.MolarDensity_M S_mg(fixed = true, start = 0.0128337, nominal = 1e-5) "rimetti true!";
    Types.MolarDensity_M S_an(fixed = false, start = 0.0200409);
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
    Types.MolarDensity_M S_ic_in(fixed = false, start = 0.103271599042417*1000) "Soluble inorganic carbon concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_in_in(fixed = false, start = 0.0404285714285714*1000) "Soluble inorganic nitrogen concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_ip_in(fixed = false, start = 0.0404285714285714*1000) "Soluble inorganic phosphorous concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_cat_in(fixed = false, start = 0.0708801468406167*1000) "Soluble cationic ion concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_ca_in(fixed = false, start = 0.0708801468406167*1000) "Soluble calcium ion concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_mg_in(fixed = false, start = 0.0708801468406167*1000) "Soluble magnesium ion concentration in the feeding [kmol/m3]";
    Types.MolarDensity_M S_an_in(fixed = false, start = 0.020*1000) "Soluble anionic ions concentration in the feedinge [kmol/m3]";
    //Gas components
    Modelica.SIunits.MassConcentration S_gas_h2(fixed = false, start = 1.88676e-05);
    Modelica.SIunits.MassConcentration S_gas_ch4(fixed = true, start = 1.48839);
    Types.MolarDensity_M S_gas_co2(fixed = true, start = 0.0144672);
    Types.Pressure_bar p_gas_h2(fixed = false, start = 1.5e-05);
    Types.Pressure_bar p_gas_ch4(fixed = false, start = 0.582185);
    Types.Pressure_bar p_gas_co2(fixed = false, start = 0.382985);
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
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_bio;

  record ParametersADM1_operational
    parameter Modelica.SIunits.Volume V_liq = 3400 "3400; SRT=19 o 20. Portata 190 m3/d. Single Digester usefull working volume";
    parameter Modelica.SIunits.Volume V_liq2 = 743 "Post-fermenter usefull working volume [m3]";
    parameter Modelica.SIunits.Volume V_gas = 100 "100; Single Digester headspace as A*H-usefull working volume";
    parameter Modelica.SIunits.Volume V_gas2 = V_liq2*0.8 "Post-fermenter headspace [m3]";
    constant Real R(unit = "bar/(kmol/m3)/K") = 0.083145 "Gas law constant";
    parameter Modelica.SIunits.Temperature T0 = 298.15 "Reference temperature for normal conditions";
    parameter Modelica.SIunits.Temperature T_ref = 298.15 "Reference temperature for pKa and enthalpy values";
    parameter Modelica.SIunits.Temperature T_ref_k = 308.15 "Reference temperature for kinetic parameters";
    parameter Modelica.SIunits.Temperature T_op_mean = 315.15 "35 + 273.15; Mean operative temperature";
    parameter Modelica.SIunits.Conversions.NonSIunits.Pressure_bar P_atm = 1.013 "Pressure of atmosphere [bar]";
    parameter Types.Kinetic_d kla = 200 "Volume-specific liquid-gas transfer coefficient [1/d]; Saravanan et al 2002: 0.56*T[K]+27.9";
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
    parameter Real CH_conv_in(unit = "kgCOD/kgVS") = 32*6/180 "COD conversion factor for influent carbohydrates";
    parameter Real PR_conv_in(unit = "kgCOD/kgVS") = 1.45 "1.58 COD conversion factor for influent proteins";
    parameter Real LI_conv_in(unit = "kgCOD/kgVS") = 2.90 "COD conversion factor for influent lipids";
    parameter Real CH_conv_out(unit = "kgCOD/kgVS") = 32*6/180 "COD conversion factor for effluent carbohydrates";
    parameter Real PR_conv_out_BSA(unit = "kgCOD/kgVS") = 1.58 "COD conversion factor for effluent proteins measured with the BCA method";
    parameter Real PR_conv_out(unit = "kgCOD/kgVS") = 1.42 "COD conversion factor for effluent proteins measured with the TKN method";
    parameter Real N_PR_conv(unit = "kgVS/kgN") = 7.5 "conversion factor for effluent proteins to organic nitrogen";
    parameter Real LI_conv_out(unit = "kgCOD/kgVS") = 1.9 "COD conversion factor for effluent lipids";
    Real Xi_conv_out(unit = "kgCOD/kgVS") = CH_conv_out*f_Xi_ch + PR_conv_out*f_Xi_pr + LI_conv_out*f_Xi_li;
    Real Si_conv_out(unit = "kgCOD/kgVS") = CH_conv_out*f_Si_ch + PR_conv_out*f_Si_pr + LI_conv_out*f_Si_li;
  end ParametersADM1_conversion;

  record ParametersADM1_stoichiometric
    // Carbon, Nitrogen and Phosforous contents
    parameter Real P_i(unit = "kmolP/kgCOD") = 0.0002;
    parameter Real P_li(unit = "kmolP/kgCOD") = 0.0003;
    parameter Real P_bac(unit = "kmolP/kgCOD") = 0.0007;
    parameter Real N_xc(unit = "kmolN/kgCOD") = 0.0376/14 "nitrogen content of particulate degradable COD";
    parameter Real N_i(unit = "kmolN/kgCOD") = 0.06/14 "nitrogen content of inert COD: 6% on weight basis in benchmark ASM";
    parameter Real N_aa(unit = "kmolN/kgCOD") = 0.007 "nitrogen content of amino acids";
    parameter Real N_bac(unit = "kmolN/kgCOD") = 0.08/14 "nitrogen content of biomass: 8% on weight basis in benchmark ASM";
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
    Real f_h2_su = 0.33*nu_1_su + 0.17*(1 - nu_1_su - nu_2_su) "unit = kgCOD/kgCOD - yield of hydrogen from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_bu_su = 0.83*(1 - nu_1_su - nu_2_su) "unit = kgCOD/kgCOD - yield of butyrate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_pro_su = 0.78*nu_2_su "unit = kgCOD/kgCOD - yield of propionate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_ac_su = 0.67*nu_1_su + 0.22*nu_2_su "unit = kgCOD/kgCOD - yield of actetate from monosaccharide degradation; set using expression in Appendix D, ADM1";
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
    parameter Real pKa_hco3 = 10.34 "- log10Ka HCO3 at 298K";
    parameter Real pKa_nh3 = 9.25 "- log10ka NH4+ at 298K ";
    parameter Real pKa_h2o = 14 "- log10ka water at 298K ";
    parameter Real pKa_h2po4 = 7.21 "-log10kaH2PO4";
    parameter Real pKa_hpo4 = 12.67 "-log10kaHPO4";
    parameter Real pKa_h3po4 = 2.12 "-log10kaH3PO4";
    constant Real deltaH0_Ka_co2(unit = "J/mol") = 7646 "enthalpy of reaction CO2->HCO3";
    constant Real deltaH0_Ka_hco3(unit = "J/mol") = 14900 "enthalpy of reaction HCO3->CO3";
    constant Real deltaH0_Ka_nh4(unit = "J/mol") = 51965 "enthalpy of reaction NH4->NH3";
    constant Real deltaH0_Ka_h2o(unit = "J/mol") = 55900 "enthalpy of reaction H2O->OH+H+";
    constant Real deltaH0_KH_ch4(unit = "J/mol") = -14240 "enthalpy of reaction of CH4gas->CH4liq";
    constant Real deltaH0_KH_co2(unit = "J/mol") = -19410 "enthalpy of reaction of CO2gas->CO2liq";
    constant Real deltaH0_KH_h2(unit = "J/mol") = -4180 "enthalpy of reaction of H2gas->H2liq";
    constant Real deltaH0_Ka_h2po4(unit = "J/mol") = 4200 "enthalpy of reaction H2PO4->HPO4. To be verified!";
    constant Real deltaH0_Ka_hpo4(unit = "J/mol") = 14700 "enthalpy of reaction HPO4->PO4. To be verified!";
    constant Real deltaH0_Ka_h3po4(unit = "J/mol") = -41900 "enthalpy of reaction H3PO4->H2PO4. To be verified!";
    parameter Real coeffHch4(unit = "kmol/m3/bar") = 0.0014;
    parameter Real coeffHco2(unit = "kmol/m3/bar") = 0.035;
    parameter Real coeffHh2(unit = "kmol/m3/bar") = 0.00078;
    parameter Real coeffph20_T(unit = "K") = 5290;
    parameter Real coeffph20_p(unit = "bar") = 0.0313;
    // Acidity constants (previously defined as "Real")
    Real Ka_va = 10^(-pKa_va) "valerate acidity constant without temperature correction - unit = M";
    Real Ka_bu = 10^(-pKa_bu) "butyrate acidity constant without temperature correction - unit = M";
    Real Ka_pro = 10^(-pKa_pro) "propionate acidity constant without temperature correction - unit = M";
    Real Ka_ac = 10^(-pKa_ac) "acetate acidity constant without temperature correction - unit = M";
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
    //MPP submodel
    constant Real deltaH0_Ksp_stru(unit = "J/mol") = 22600 "enthalpy of reaction of struvite formation. Rontenltap et al 2007 as 22.6 kJ/mol; ; 98.82 kJ/mol; Struvite precipitation is endo up to 30°C and eso between 30-60°C";
    constant Real deltaH0_Ksp_acp(unit = "J/mol") = 54000 "enthalpy of reaction of calcium phosphate formation??; 310 g/mol*26.1 J/g = 8091 J/mol";
    constant Real deltaH0_Ksp_ccm(unit = "J/mol") = -8000 "enthalpy of reaction of calcium phosphate formation??; 310 g/mol*26.1 J/g = 8091 J/mol";
    parameter Real pKsp_acp(unit = "conc") = 28.92 "New value from PCM?";
    parameter Real kcryst_acp(unit = "d-1") = 3*(24*60);
    parameter Real pKsp_stru(unit = "conc") = 13.6 "New value from PCM? Also Ronteltap et al. 2007";
    parameter Real kcryst_stru(unit = "d-1") = 5*(24*60);
    parameter Real pKsp_ccm(unit = "conc") = 8.480 "New value from PCM?";
    parameter Real kcryst_ccm(unit = "d-1") = 0.35*(24*60);
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
    Modelica.SIunits.MassConcentration S_va(fixed = true, start = 1.00433E-05*208) "Valeric acid concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_bu(fixed = true, start = 2.04904E-05*160) "Butyric concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_pro(fixed = true, start = 0.000145231*112) "Propionic acid concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_ac(fixed = true, start = 0.012445469*60) "Acetic acid concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_vam(fixed = false, start = 1.00433E-05*208) "Valerate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_bum(fixed = false, start = 2.04904E-05*160) "Butyrate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_prom(fixed = false, start = 0.000145231*112) "Propionate ion concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_acm(fixed = false, start = 0.012145469*60) "Acetate ion inerts concentration in digestate [kgCOD/m3]";
    //Inorganic soluble components
    Modelica.SIunits.MassConcentration S_h2(fixed = true, start = 4.11532e-07) "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    Modelica.SIunits.MassConcentration S_ch4(fixed = true, start = 0.0474429) "Soluble methane concentration in digestate [kgCOD/m3]";
    Types.MolarDensity_M S_ic(fixed = true, start = 0.0312386) "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_in(fixed = true, start = 0.0242044) "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ip(fixed = true, start = 0.00636595, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_cat(fixed = false, start = 0.118805) "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ca(fixed = true, start = 0.001 "0.00027486", nominal = 1e-4);
    Types.MolarDensity_M S_mg(fixed = true, start = 0.0128337, nominal = 1e-5);
    Types.MolarDensity_M S_an(fixed = false, start = 0.0200409);
    Types.MolarDensity_M S_hco3(fixed = false, start = 0.302539) "8/10";
    Types.MolarDensity_M S_co3(fixed = false, start = 4.01e-3, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_nh3(fixed = false, start = 0.242044 - 0.161871282, nominal = 1e-2) "8/10";
    Types.MolarDensity_M S_nh4(fixed = false, start = 0.161871282, nominal = 1e-1) "from I value fixed; 8/10";
    Types.MolarDensity_M S_hpo4(fixed = false, start = 0.00509761, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_h2po4(fixed = false, start = 0.00126826, nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_h3po4(fixed = false, start = 1.24e-9, nominal = 1e-9) "8/10";
    Types.MolarDensity_M S_po4(fixed = false, start = 8.37E-08, nominal = 1e-8) "8/10";
    Types.MolarDensity_M S_co2(fixed = false, start = 0.00985188) "8/10";
    Modelica.SIunits.PerUnit pH(fixed = false, start = 7.11, nominal = 7) "Digestate pH [-]";
    Types.MolarDensity_M S_h(fixed = true, start = 1.481088E-07, nominal = 1e-7, min = 1e-7, max = 1.7e-7) "8/10";
    Types.MolarDensity_M S_oh(fixed = false, start = 1.46E-06) "8/10";
    Types.MolarDensity_M Theta(fixed = false, start = 0.02, nominal = 1e-8);
    //Gas components
    Modelica.SIunits.MassConcentration S_gas_h2(fixed = true, start = 1.88676e-05);
    Modelica.SIunits.MassConcentration S_gas_ch4(fixed = true, start = 1.48839);
    Types.MolarDensity_M S_gas_co2(fixed = true, start = 0.0144672);
    Types.Pressure_bar p_gas_h2(fixed = false, start = 1.5e-05);
    Types.Pressure_bar p_gas_ch4(fixed = false, start = 0.582185);
    Types.Pressure_bar p_gas_co2(fixed = false, start = 0.382985);
    //Other algebraic variables
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
    Real Ka_hco3(fixed = false, start = 6.32e-11);
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
    //MPP submodel (X_salt are states)
    Types.MolarDensity_M X_acp(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
    Types.MolarDensity_M X_stru(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
    Types.MolarDensity_M X_ccm(fixed = true, start = 1e-6, nominal = 1e-2) "mol/L";
    Types.MolarDensity_M a_ca(nominal = 1e-5) "mol/L";
    Types.MolarDensity_M a_po4(nominal = 1e-9) "mol/L";
    Types.MolarDensity_M a_nh4(nominal = 1e-2) "mol/L";
    Types.MolarDensity_M a_mg(nominal = 1e-5) "mol/L";
    Types.MolarDensity_M a_h(nominal = 1e-9) "mol/L";
    Types.MolarDensity_M a_hco3(nominal = 1e-2) "mol/L";
    Types.MolarDensity_M a_hpo4(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_h2po4(nominal = 1e-9) "mol/L";
    Types.MolarDensity_M a_co3(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_acm(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_prom(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_bum(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_vam(nominal = 1e-4) "mol/L";
    Types.MolarDensity_M a_h2o(nominal = 1e-1) "mol/L";
    Types.MolarDensity_M a_oh(nominal = 1e-7) "mol/L";
    Types.MolConcRate rp1(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rp2(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rd1(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rd2(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rp3(nominal = 1e-4) "mol/L*d";
    Types.MolConcRate rd3(nominal = 1e-4) "mol/L*d";
    Modelica.SIunits.PerUnit SI_stru(nominal = 1);
    Modelica.SIunits.PerUnit SI_acp(nominal = 1);
    Modelica.SIunits.PerUnit SI_ccm(nominal = 1);
    Types.MolarDensity_M I(fixed = true, start = 3.6097E-01, nominal = 1e-1) "mol/L";
    Real g_mono;
    Real g_bi;
    Real g_tri;
    Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
    Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
    Types.MolarDensity_M_Ksp_acp Ksp_ccm(nominal = 1e-9);
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1;

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
      Real S_co3;
      Real S_co2;
      Real S_h;
      Real S_oh;
      Real S_nh3;
      Real S_nh4;
      Real S_hpo4;
      Real S_h2po4;
      Real S_h3po4;
      Real S_po4;
      Real S_acm;
      Real S_prom;
      Real S_bum;
      Real S_vam;
      Real S_gas_h2;
      Real S_gas_ch4;
      Real S_gas_co2;
      Real X_acp;
      Real X_stru;
      Real f_si_xc;
      Real f_xi_xc;
      Real f_ch_xc;
      Real f_pr_xc;
      Real f_li_xc;
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
    model Feed_Source_Flores
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.OtherVariables_Feed;
      ADM1_P.Interfaces.Feed Feed_Out annotation(
        Placement(visible = true, transformation(origin = {90, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      //Feed characteristics (general inputs from Biernacki)
      Real Flow_in(fixed = false, start = 0) "m3/d";
      input Real TS_in(fixed = false, start = 0) "??; gTS/kg";
      input Real VS_in(fixed = false, start = 0) "??, gVS/kg";
      input Real pH_in(fixed = false, start = 0);
      input Real Alk_in(fixed = false, start = 0);
      input Real Ammonium_in(fixed = false, start = 0) "mgN/L";
      input Real Fosfates_in(fixed = false, start = 0) "mgP/L";
      input Real Ca_in(fixed = false, start = 0) "mol/L";
      input Real Mg_in(fixed = false, start = 0) "mol/L";
      input Real ac_in(fixed = false, start = 0) "gCOD/L";
      input Real pro_in(fixed = false, start = 0) "gCOD/L";
      input Real bu_in(fixed = false, start = 0) "gCOD/L";
      input Real va_in(fixed = false, start = 0) "gCOD/L";
      input Real Ssu_in(fixed = false, start = 0) "gCOD/L";
      input Real Saa_in(fixed = false, start = 0) "gCOD/L";
      input Real Sfa_in(fixed = false, start = 0) "gCOD/L";
      input Real Si_in(fixed = false, start = 0) "gCOD/L";
      input Real tBMP_VS_in(fixed = false, start = 0) "NmLCH4/gVS";
      input Real Xi_in(fixed = false, start = 0) "gCOD/L";
      input Real Xpr_in(fixed = false, start = 0) "gCOD/L";
      input Real Xli_in(fixed = false, start = 0) "gCOD/L";
      input Real Xch_in(fixed = false, start = 0) "gCOD/L";
      Modelica.Blocks.Interfaces.RealInput Inflow[22] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
//Block variables
      Feed_Out.Q = -Flow_in "m3/d";
//Computation of soluble gas
      Feed_Out.S_h2 = S_h2_in "gCOD/L";
      Feed_Out.S_ch4 = S_ch4_in "gCOD/L";
//Computation of biomasses
      Feed_Out.X_su = X_su_in "gCOD/L";
      Feed_Out.X_aa = X_aa_in "gCOD/L";
      Feed_Out.X_fa = X_fa_in "gCOD/L";
      Feed_Out.X_c4 = X_c4_in "gCOD/L";
      Feed_Out.X_pro = X_pro_in "gCOD/L";
      Feed_Out.X_ac = X_ac_in "gCOD/L";
      Feed_Out.X_h2 = X_h2_in "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      Feed_Out.S_ac = ac_in "gCOD/L";
      Feed_Out.S_pro = pro_in "gCOD/L";
      Feed_Out.S_bu = bu_in "gCOD/L";
      Feed_Out.S_va = va_in "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      Feed_Out.S_su = Ssu_in "gCOD/L";
      Feed_Out.S_aa = Saa_in "gCOD/L";
      Feed_Out.S_fa = Sfa_in "gCOD/L";
      Feed_Out.S_i = Si_in "gCOD/L";
//Computation of physical properties
      u_in = 1 - TS_in/1000 "fraction of moisture content";
      v_in = VS_in/TS_in "fraction of volatile content";
      d_in = 1/(u_in/1000 + (1 - u_in)*(v_in/1050 + (1 - v_in)/2500)) "g/L, density";
      COD_VFA_in = Feed_Out.S_ac + Feed_Out.S_pro + Feed_Out.S_bu + Feed_Out.S_va "gCOD/L, COD associated to VFA";
//Computation of variables X_c and X_i (Biernacki)
      tBMP_COD_in = tBMP_VS_in/tCOD_in*VS_in*d_in/1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
      Feed_Out.X_i = Xi_in;
      Feed_Out.X_pr = Xpr_in;
      Feed_Out.X_li = Xli_in;
      Feed_Out.X_ch = Xch_in;
      Feed_Out.X_c = 0;
      Feed_Out.f_xi_xc = 0.0;
      Feed_Out.f_si_xc = 0.0;
      Feed_Out.f_pr_xc = 0.0;
      Feed_Out.f_li_xc = 0.0;
      Feed_Out.f_ch_xc = 0.0;
      tCOD_in = COD_VFA_in + Feed_Out.X_pr + Feed_Out.X_li + Feed_Out.X_ch + Feed_Out.X_i "gCOD/L, total COD as sum of total CH, PR, LI and VFA";
      pCOD_in = tCOD_in - COD_VFA_in "gCOD/L, particulate COD";
//Computation of ionic components
      Ka_co2_in = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4_in = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o_in = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4_in = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4_in = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      S_h_in = 10^(-pH_in) "mol/L";
      S_oh_in = Ka_h2o_in/S_h_in "mol/L";
      S_ac_mol_in = Feed_Out.S_ac/Ac_conv "mol/L";
      S_pro_mol_in = Feed_Out.S_pro/Pro_conv "mol/L";
      S_bu_mol_in = Feed_Out.S_bu/Bu_conv "mol/L";
      S_va_mol_in = Feed_Out.S_va/Va_conv "mol/L";
      S_ac_ion_in = Ka_ac*S_ac_mol_in/(S_h_in + Ka_ac) "mol/L";
      S_pro_ion_in = Ka_pro*S_pro_mol_in/(S_h_in + Ka_pro) "mol/L";
      S_bu_ion_in = Ka_bu*S_bu_mol_in/(S_h_in + Ka_bu) "mol/L";
      S_va_ion_in = Ka_va*S_va_mol_in/(S_h_in + Ka_va) "mol/L";
      S_hpo4_in = Ka_h2po4_in*Feed_Out.S_ip/(Ka_h2po4_in + S_h_in + Ka_h2po4_in*Ka_hpo4_in/S_h_in) "mol/L";
      S_po4_in = Ka_hpo4_in*Feed_Out.S_ip/(Ka_hpo4_in + S_h_in + S_h_in^2/Ka_h2po4_in) "mol/L";
      S_h2po4_in = Feed_Out.S_ip - S_hpo4_in - S_po4_in;
      Alk_mol_in = Alk_in/100*2/1000 "mol/L";
//S_hco3_in = Alk_mol_in - (S_ac_ion_in + S_pro_ion_in + S_bu_ion_in + S_va_ion_in) - S_oh_in - (Feed_Out.S_in - S_nh4_in) + S_h_in - S_hpo4_in - 2 * S_po4_in "mol/L";
//Feed_Out.S_ic = S_hco3_in * (S_h_in + Ka_co2_in) / Ka_co2_in "mol/L";
      S_hco3_in = Feed_Out.S_ic/((S_h_in + Ka_co2_in)/Ka_co2_in) "mol/L";
      Feed_Out.S_ic = 384/12.011/1000 "mol/L";
      Feed_Out.S_in = Ammonium_in/14.0067/1000 "mol/L";
      Feed_Out.S_ip = Fosfates_in/30.973762/1000 "mol/L";
      S_nh4_in = Feed_Out.S_in*S_h_in/(Ka_nh4_in + S_h_in) "mol/L";
//Feed_Out.S_an = S_an_input "mol/L";
      Feed_Out.S_an = 0.0000 "mol/L";
      Feed_Out.S_cat = (-S_nh4_in) - S_h_in - 2*Feed_Out.S_ca - 2*Feed_Out.S_mg + Feed_Out.S_an + S_hco3_in + S_oh_in + S_ac_ion_in + S_pro_ion_in + S_bu_ion_in + S_va_ion_in + 2*S_hpo4_in + S_h2po4_in + 3*S_po4_in + 0.021 "mol/L";
      Feed_Out.S_ca = Ca_in;
//entra come totale o come ione? Analisi controioni? Trovo S_cat togliendo i cationi noti.
      Feed_Out.S_mg = Mg_in;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Flores;

    model Feed_Source
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.OtherVariables_Feed;
      ADM1_P.Interfaces.Feed Feed_Out annotation(
        Placement(visible = true, transformation(origin = {90, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      //Feed characteristics (general inputs from Biernacki)
      Real Flow_in(fixed = false, start = 0) "m3/d";
      input Real TS_in(fixed = false, start = 0) "??; gTS/kg";
      input Real VS_in(fixed = false, start = 0) "??, gVS/kg";
      input Real pH_in(fixed = false, start = 0);
      input Real Alk_in(fixed = false, start = 0);
      input Real Ammonium_in(fixed = false, start = 0) "mgN/L";
      input Real Fosfates_in(fixed = false, start = 0) "mgP/L";
      input Real Ca_in(fixed = false, start = 0) "mol/L";
      input Real Mg_in(fixed = false, start = 0) "mol/L";
      input Real ac_in(fixed = false, start = 0) "gCOD/L";
      input Real pro_in(fixed = false, start = 0) "gCOD/L";
      input Real bu_in(fixed = false, start = 0) "gCOD/L";
      input Real va_in(fixed = false, start = 0) "gCOD/L";
      input Real Ssu_in(fixed = false, start = 0) "gCOD/L";
      input Real Saa_in(fixed = false, start = 0) "gCOD/L";
      input Real Sfa_in(fixed = false, start = 0) "gCOD/L";
      input Real Si_in(fixed = false, start = 0) "gCOD/L";
      input Real tBMP_VS_in(fixed = false, start = 0) "NmLCH4/gVS";
      input Real Xi_in(fixed = false, start = 0) "gCOD/L";
      input Real Xpr_in(fixed = false, start = 0) "gCOD/L";
      input Real Xli_in(fixed = false, start = 0) "gCOD/L";
      input Real Xch_in(fixed = false, start = 0) "gCOD/L";
      Modelica.Blocks.Interfaces.RealInput Inflow[22] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
//Block variables
      Feed_Out.Q = -Flow_in "m3/d";
//Computation of soluble gas
      Feed_Out.S_h2 = S_h2_in "gCOD/L";
      Feed_Out.S_ch4 = S_ch4_in "gCOD/L";
//Computation of biomasses
      Feed_Out.X_su = X_su_in "gCOD/L";
      Feed_Out.X_aa = X_aa_in "gCOD/L";
      Feed_Out.X_fa = X_fa_in "gCOD/L";
      Feed_Out.X_c4 = X_c4_in "gCOD/L";
      Feed_Out.X_pro = X_pro_in "gCOD/L";
      Feed_Out.X_ac = X_ac_in "gCOD/L";
      Feed_Out.X_h2 = X_h2_in "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      Feed_Out.S_ac = ac_in "gCOD/L";
      Feed_Out.S_pro = pro_in "gCOD/L";
      Feed_Out.S_bu = bu_in "gCOD/L";
      Feed_Out.S_va = va_in "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      Feed_Out.S_su = Ssu_in "gCOD/L";
      Feed_Out.S_aa = Saa_in "gCOD/L";
      Feed_Out.S_fa = Sfa_in "gCOD/L";
      Feed_Out.S_i = Si_in "gCOD/L";
//Computation of physical properties
      u_in = 1 - TS_in/1000 "fraction of moisture content";
      v_in = VS_in/TS_in "fraction of volatile content";
      d_in = 1/(u_in/1000 + (1 - u_in)*(v_in/1050 + (1 - v_in)/2500)) "g/L, density";
      COD_VFA_in = Feed_Out.S_ac + Feed_Out.S_pro + Feed_Out.S_bu + Feed_Out.S_va "gCOD/L, COD associated to VFA";
//Computation of variables X_c and X_i (Biernacki)
      tBMP_COD_in = tBMP_VS_in/tCOD_in*VS_in*d_in/1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
      Feed_Out.X_i = Xi_in;
      Feed_Out.X_pr = Xpr_in;
      Feed_Out.X_li = Xli_in;
      Feed_Out.X_ch = Xch_in;
      Feed_Out.X_c = 0;
      Feed_Out.f_xi_xc = 0.0;
      Feed_Out.f_si_xc = 0.0;
      Feed_Out.f_pr_xc = 0.0;
      Feed_Out.f_li_xc = 0.0;
      Feed_Out.f_ch_xc = 0.0;
      tCOD_in = COD_VFA_in + Feed_Out.X_pr + Feed_Out.X_li + Feed_Out.X_ch + Feed_Out.X_i "gCOD/L, total COD as sum of total CH, PR, LI and VFA";
      pCOD_in = tCOD_in - COD_VFA_in "gCOD/L, particulate COD";
//Computation of ionic components
      Ka_co2_in = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4_in = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o_in = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4_in = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4_in = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op_mean))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      S_h_in = 10^(-pH_in) "mol/L";
      S_oh_in = Ka_h2o_in/S_h_in "mol/L";
      S_ac_mol_in = Feed_Out.S_ac/Ac_conv "mol/L";
      S_pro_mol_in = Feed_Out.S_pro/Pro_conv "mol/L";
      S_bu_mol_in = Feed_Out.S_bu/Bu_conv "mol/L";
      S_va_mol_in = Feed_Out.S_va/Va_conv "mol/L";
      S_ac_ion_in = Ka_ac*S_ac_mol_in/(S_h_in + Ka_ac) "mol/L";
      S_pro_ion_in = Ka_pro*S_pro_mol_in/(S_h_in + Ka_pro) "mol/L";
      S_bu_ion_in = Ka_bu*S_bu_mol_in/(S_h_in + Ka_bu) "mol/L";
      S_va_ion_in = Ka_va*S_va_mol_in/(S_h_in + Ka_va) "mol/L";
      S_hpo4_in = Ka_h2po4_in*Feed_Out.S_ip/(Ka_h2po4_in + S_h_in + Ka_h2po4_in*Ka_hpo4_in/S_h_in) "mol/L";
      S_po4_in = Ka_hpo4_in*Feed_Out.S_ip/(Ka_hpo4_in + S_h_in + S_h_in^2/Ka_h2po4_in) "mol/L";
      S_h2po4_in = Feed_Out.S_ip - S_hpo4_in - S_po4_in;
      Alk_mol_in = Alk_in/100*2/1000 "mol/L";
      S_hco3_in = Alk_mol_in - (S_ac_ion_in + S_pro_ion_in + S_bu_ion_in + S_va_ion_in) - S_oh_in - (Feed_Out.S_in - S_nh4_in) + S_h_in - S_hpo4_in - 2*S_po4_in "mol/L";
      Feed_Out.S_ic = S_hco3_in*(S_h_in + Ka_co2_in)/Ka_co2_in "mol/L";
      Feed_Out.S_in = Ammonium_in/14.0067/1000 "mol/L";
      Feed_Out.S_ip = Fosfates_in/30.973762/1000 "mol/L";
      S_nh4_in = Feed_Out.S_in*S_h_in/(Ka_nh4_in + S_h_in) "mol/L";
//Feed_Out.S_an = S_an_input "mol/L";
      Feed_Out.S_an = 0.02 "mol/L";
      Feed_Out.S_cat = (-S_nh4_in) - S_h_in - 2*Feed_Out.S_ca - 2*Feed_Out.S_mg + Feed_Out.S_an + S_hco3_in + S_oh_in + S_ac_ion_in + S_pro_ion_in + S_bu_ion_in + S_va_ion_in + 2*S_hpo4_in + S_h2po4_in + 3*S_po4_in "mol/L";
      Feed_Out.S_ca = Ca_in;
//entra come totale o come ione? Analisi controioni? Trovo S_cat togliendo i cationi noti.
      Feed_Out.S_mg = Mg_in;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source;

    model Feed_Source_1
      extends ADM1_P.Icons.FeedSource1;
      extends ADM1_P.BlockLibrary.Feed_Source;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        Diagram(graphics = {Rectangle(extent = {{-66, 2}, {-66, 2}})}),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_1;

    model Feed_Source_2
      extends ADM1_P.Icons.FeedSource2;
      extends ADM1_P.BlockLibrary.Feed_Source;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_2;

    model Feed_Source_3
      extends ADM1_P.Icons.FeedSource3;
      extends ADM1_P.BlockLibrary.Feed_Source;
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
      (Manure_In.S_su*Manure_In.Q + Slurry_In.S_su*Slurry_In.Q + MaizeSilage_In.S_su*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_su;
      (Manure_In.S_aa*Manure_In.Q + Slurry_In.S_aa*Slurry_In.Q + MaizeSilage_In.S_aa*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_aa;
      (Manure_In.S_fa*Manure_In.Q + Slurry_In.S_fa*Slurry_In.Q + MaizeSilage_In.S_fa*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_fa;
      (Manure_In.S_va*Manure_In.Q + Slurry_In.S_va*Slurry_In.Q + MaizeSilage_In.S_va*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_va;
      (Manure_In.S_bu*Manure_In.Q + Slurry_In.S_bu*Slurry_In.Q + MaizeSilage_In.S_bu*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_bu;
      (Manure_In.S_pro*Manure_In.Q + Slurry_In.S_pro*Slurry_In.Q + MaizeSilage_In.S_pro*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_pro;
      (Manure_In.S_ac*Manure_In.Q + Slurry_In.S_ac*Slurry_In.Q + MaizeSilage_In.S_ac*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ac;
      (Manure_In.S_h2*Manure_In.Q + Slurry_In.S_h2*Slurry_In.Q + MaizeSilage_In.S_h2*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_h2;
      (Manure_In.S_ch4*Manure_In.Q + Slurry_In.S_ch4*Slurry_In.Q + MaizeSilage_In.S_ch4*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ch4;
      (Manure_In.S_ic*Manure_In.Q + Slurry_In.S_ic*Slurry_In.Q + MaizeSilage_In.S_ic*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ic;
      (Manure_In.S_in*Manure_In.Q + Slurry_In.S_in*Slurry_In.Q + MaizeSilage_In.S_in*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_in;
      (Manure_In.S_ip*Manure_In.Q + Slurry_In.S_ip*Slurry_In.Q + MaizeSilage_In.S_ip*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ip;
      (Manure_In.S_i*Manure_In.Q + Slurry_In.S_i*Slurry_In.Q + MaizeSilage_In.S_i*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_i;
      (Manure_In.S_cat*Manure_In.Q + Slurry_In.S_cat*Slurry_In.Q + MaizeSilage_In.S_cat*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_cat;
      (Manure_In.S_ca*Manure_In.Q + Slurry_In.S_ca*Slurry_In.Q + MaizeSilage_In.S_ca*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_ca;
      (Manure_In.S_mg*Manure_In.Q + Slurry_In.S_mg*Slurry_In.Q + MaizeSilage_In.S_mg*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_mg;
      (Manure_In.S_an*Manure_In.Q + Slurry_In.S_an*Slurry_In.Q + MaizeSilage_In.S_an*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.S_an;
      (Manure_In.X_c*Manure_In.Q + Slurry_In.X_c*Slurry_In.Q + MaizeSilage_In.X_c*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_c;
      (Manure_In.X_ch*Manure_In.Q + Slurry_In.X_ch*Slurry_In.Q + MaizeSilage_In.X_ch*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_ch;
      (Manure_In.X_pr*Manure_In.Q + Slurry_In.X_pr*Slurry_In.Q + MaizeSilage_In.X_pr*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_pr;
      (Manure_In.X_li*Manure_In.Q + Slurry_In.X_li*Slurry_In.Q + MaizeSilage_In.X_li*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_li;
      (Manure_In.X_su*Manure_In.Q + Slurry_In.X_su*Slurry_In.Q + MaizeSilage_In.X_su*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_su;
      (Manure_In.X_aa*Manure_In.Q + Slurry_In.X_aa*Slurry_In.Q + MaizeSilage_In.X_aa*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_aa;
      (Manure_In.X_fa*Manure_In.Q + Slurry_In.X_fa*Slurry_In.Q + MaizeSilage_In.X_fa*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_fa;
      (Manure_In.X_c4*Manure_In.Q + Slurry_In.X_c4*Slurry_In.Q + MaizeSilage_In.X_c4*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_c4;
      (Manure_In.X_pro*Manure_In.Q + Slurry_In.X_pro*Slurry_In.Q + MaizeSilage_In.X_pro*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_pro;
      (Manure_In.X_ac*Manure_In.Q + Slurry_In.X_ac*Slurry_In.Q + MaizeSilage_In.X_ac*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_ac;
      (Manure_In.X_h2*Manure_In.Q + Slurry_In.X_h2*Slurry_In.Q + MaizeSilage_In.X_h2*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_h2;
      (Manure_In.X_i*Manure_In.Q + Slurry_In.X_i*Slurry_In.Q + MaizeSilage_In.X_i*MaizeSilage_In.Q)/(Manure_In.Q + Slurry_In.Q + MaizeSilage_In.Q) = FeedMix_Out.X_i;
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
      Fractions_Out[1] = -Manure_In.X_ch*Manure_In.Q/(FeedMix_Out.X_ch*FeedMix_Out.Q);
      Fractions_Out[2] = -Slurry_In.X_ch*Slurry_In.Q/(FeedMix_Out.X_ch*FeedMix_Out.Q);
      Fractions_Out[3] = -MaizeSilage_In.X_ch*MaizeSilage_In.Q/(FeedMix_Out.X_ch*FeedMix_Out.Q);
      Fractions_Out[4] = -Manure_In.X_pr*Manure_In.Q/(FeedMix_Out.X_pr*FeedMix_Out.Q);
      Fractions_Out[5] = -Slurry_In.X_pr*Slurry_In.Q/(FeedMix_Out.X_pr*FeedMix_Out.Q);
      Fractions_Out[6] = -MaizeSilage_In.X_pr*MaizeSilage_In.Q/(FeedMix_Out.X_pr*FeedMix_Out.Q);
      Fractions_Out[7] = -Manure_In.X_li*Manure_In.Q/(FeedMix_Out.X_li*FeedMix_Out.Q);
      Fractions_Out[8] = -Slurry_In.X_li*Slurry_In.Q/(FeedMix_Out.X_li*FeedMix_Out.Q);
      Fractions_Out[9] = -MaizeSilage_In.X_li*MaizeSilage_In.Q/(FeedMix_Out.X_li*FeedMix_Out.Q);
//Verify balance
      CODout = FeedMix_Out.Q*(FeedMix_Out.S_aa + FeedMix_Out.S_ac + FeedMix_Out.S_bu + FeedMix_Out.S_ch4 + FeedMix_Out.S_fa + FeedMix_Out.S_h2 + FeedMix_Out.S_i + FeedMix_Out.S_pro + FeedMix_Out.S_su + FeedMix_Out.S_va + FeedMix_Out.X_aa + FeedMix_Out.X_ac + FeedMix_Out.X_c4 + FeedMix_Out.X_fa + FeedMix_Out.X_h2 + FeedMix_Out.X_pro + FeedMix_Out.X_su + FeedMix_Out.X_ch + FeedMix_Out.X_c + FeedMix_Out.X_i + FeedMix_Out.X_li + FeedMix_Out.X_pr);
      CODin = Manure_In.Q*(Manure_In.S_aa + Manure_In.S_ac + Manure_In.S_bu + Manure_In.S_ch4 + Manure_In.S_fa + FeedMix_Out.S_h2 + Manure_In.S_i + Manure_In.S_pro + Manure_In.S_su + Manure_In.S_va + Manure_In.X_aa + Manure_In.X_ac + Manure_In.X_c4 + Manure_In.X_fa + Manure_In.X_h2 + Manure_In.X_pro + Manure_In.X_su + Manure_In.X_ch + Manure_In.X_c + Manure_In.X_i + Manure_In.X_li + Manure_In.X_pr);
      annotation(
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Feeding_Tank;

    model PostDigester
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
      Modelica.Blocks.Interfaces.RealInput Fractions_In[9] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //
      Real charge(nominal = 1e-17);
      parameter Real ideality = 1.0 "True=1.0";
      ADM1_P.Interfaces.Digestate FeedMix_In annotation(
        Placement(visible = true, transformation(origin = {-84, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-84, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
//
//I calculation
      I = if noEvent(0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv))) < 0 then 0.2 else 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv));
//Ideality vs non-ideality
      g_mono = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_bi = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_tri = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      a_h2o = if noEvent(ideality) > 0.0 then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/Va_conv + S_bum/Bu_conv + S_prom/Pro_conv + S_acm/Ac_conv + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//Activitites calculation = f(S_tot,i)
      a_h = g_mono*S_h;
      a_ca = g_bi*S_ca;
      a_mg = g_bi*S_mg;
      a_nh4 = a_h/Ka_nh4*S_in/(1 + a_h/(Ka_nh4*g_mono));
      a_hco3 = Ka_co2/a_h*S_ic/(1 + Ka_co2/(a_h*g_mono));
      a_co3 = S_ic*a_h*Ka_co2*Ka_hco3/(a_h^3 + Ka_co2*Ka_hco3*a_h/g_bi + Ka_co2*a_h^2/g_mono);
      a_hpo4 = S_ip*a_h*Ka_h3po4*Ka_h2po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_po4 = S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_h2po4 = S_ip*a_h^2*Ka_h3po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_acm = S_ac/Ac_conv*a_h^2*Ka_ac/(a_h^3 + Ka_ac*a_h^2/g_mono);
      a_prom = S_pro/Pro_conv*a_h^2*Ka_pro/(a_h^3 + Ka_pro*a_h^2/g_mono);
      a_bum = S_bu/Bu_conv*a_h^2*Ka_bu/(a_h^3 + Ka_bu*a_h^2/g_mono);
      a_vam = S_va/Va_conv*a_h^2*Ka_va/(a_h^3 + Ka_va*a_h^2/g_mono);
      a_oh = Ka_h2o*convKa*a_h2o/a_h;
//Concentration calculation
      S_nh4 = a_nh4/g_mono;
      S_hco3 = a_hco3/g_mono;
      S_hpo4 = a_hpo4/g_bi;
      S_po4 = a_po4/g_tri;
      S_h2po4 = a_h2po4/g_mono;
      S_co3 = a_co3/g_bi;
      S_acm = a_acm/g_mono*Ac_conv;
      S_prom = a_prom/g_mono*Pro_conv;
      S_bum = a_bum/g_mono*Bu_conv;
      S_vam = a_vam/g_mono*Va_conv;
      S_oh = a_oh/g_mono;
//MPP submodel
      Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
      Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
      SI_acp = log(a_ca^3*a_po4^2/Ksp_acp);
      SI_stru = if noEvent(a_nh4*a_po4*a_mg > Ksp_stru) then 1.0 else -1.0;
//  rp1 = 0;
//  rp2 = 0;
//  rd1 = 0;
//  rd2 = 0;
      rp1 = (1 + sign(SI_acp))/2*kcryst_acp*X_acp*((a_ca^3*a_po4^2/Ksp_acp)^(1/5) - 1)^2;
      rp2 = SI_stru*kcryst_stru*X_stru*((a_nh4*a_po4*a_mg/Ksp_stru)^(1/3) - 1)^2;
      rd2 = (1 - sign(SI_stru))/2*kcryst_stru*X_stru*((a_nh4*a_po4*a_mg/Ksp_stru)^(1/3) - 1)^2;
      rd1 = (1 - sign(SI_acp))/2*kcryst_acp*X_acp*((a_ca^3*a_po4^2/Ksp_acp)^(1/5) - 1)^2;
      24*3600*der(X_acp) = FeedMix_In.Q/V_liq*(-X_acp) + rp1 - rd1;
      24*3600*der(X_stru) = FeedMix_In.Q/V_liq*(-X_stru) + rp2 - rd2;
      Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
      SI_ccm = log(a_ca*a_co3/Ksp_ccm)/abs(log(a_ca*a_co3/Ksp_ccm));
//rp3 = if noEvent(X_ccm<0 and SI_ccm<0) then 0.0 else kcryst_ccm * abs(X_ccm) * ((a_ca * a_co3 / Ksp_ccm) ^ (1 / 2) - 1) ^ 2 * SI_ccm;
      rp3 = 0;
      rd3 = 0;
      24*3600*der(X_ccm) = FeedMix_In.Q/V_liq*(-X_ccm) + rp3 - rd3;
//
//TEMPERATURE DEPENDENT PARAMETERS
//Acidity constants with temperature correction
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4*exp(deltaH0_KH_ch4/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2*exp(deltaH0_KH_co2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2*exp(deltaH0_KH_h2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
//Others with temperature correction
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref - 1/T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_hyd_ch1_T = k_hyd_ch1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr1_T = k_hyd_pr1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li1_T = k_hyd_li1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_ch2_T = k_hyd_ch2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr2_T = k_hyd_pr2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li2_T = k_hyd_li2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_ch3_T = k_hyd_ch3*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr3_T = k_hyd_pr3*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li3_T = k_hyd_li3*exp(th_k_hyd*(T_op - T_ref_k));
      k_m_su_T = k_m_su*exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa*exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa*exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro*exp(th_k_m_pro*(T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac*exp(th_k_m_ac*(T_op - T_ref_k));
      k_m_h2_T = k_m_h2*exp(th_k_m_h2*(T_op - T_ref_k));
      Ks_su_T = Ks_su*exp(th_Ks_su*(T_op - T_ref_k));
      Ks_aa_T = Ks_aa*exp(th_Ks_aa*(T_op - T_ref_k));
      Ks_fa_T = Ks_fa*exp(th_Ks_fa*(T_op - T_ref_k));
      Ks_pro_T = Ks_pro*exp(th_Ks_pro*(T_op - T_ref_k));
//Ks_c4_T = Ks_c4 * exp(th_Ks_c4*(T_op - T_ref_k)); not found
      Ks_ac_T = Ks_ac*exp(th_Ks_ac*(T_op - T_ref_k));
      Ks_h2_T = Ks_h2*exp(th_Ks_h2*(T_op - T_ref_k));
      k_dec_su_T = k_dec_su*exp(th_k_dec_su*(T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa*exp(th_k_dec_aa*(T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa*exp(th_k_dec_fa*(T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro*exp(th_k_dec_pro*(T_op - T_ref_k));
//k_dec_c4_T = k_dec_c4 * exp(th_k_dec_c4*(T_op - T_ref_k)); not found
      k_dec_ac_T = k_dec_ac*exp(th_k_dec_ac*(T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2*exp(th_k_dec_h2*(T_op - T_ref_k));
//
//INHIBITION
      pH = -log10(a_h);
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1/(1 + Ks_IN/S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1/(1 + Ks_IP/S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa*I_in_lim*I_ip_lim;
      I_6 = I_pH_aa*I_in_lim*I_ip_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa*I_ip_lim;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro*I_ip_lim;
      I_11 = I_pH_ac*I_in_lim*I_nh3*I_ip_lim;
      I_12 = I_pH_h2*I_in_lim*I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-C_xc) + FeedMix_In.f_si_xc*C_si + FeedMix_In.f_ch_xc*C_ch + FeedMix_In.f_pr_xc*C_pr + FeedMix_In.f_li_xc*C_li + FeedMix_In.f_xi_xc*C_xi;
      v2 = (-C_ch) + C_su;
      v3 = (-C_pr) + C_aa;
      v4 = (-C_li) + (1 - f_fa_li)*C_su + f_fa_li*C_fa;
      v5 = (-C_su) + (1 - Y_su)*(f_bu_su*C_bu + f_pro_su*C_pro + f_ac_su*C_ac) + Y_su*C_bac;
      v6 = (-C_aa) + (1 - Y_aa)*(f_va_aa*C_va + f_bu_aa*C_bu + f_pro_aa*C_aa + f_ac_aa*C_aa) + Y_aa*C_bac;
      v7 = (-C_fa) + (1 - Y_fa)*0.7*C_ac + Y_fa*C_bac;
      v8 = (-C_va) + (1 - Y_c4)*0.54*C_pro + (1 - Y_c4)*0.31*C_ac + Y_c4*C_bac;
      v9 = (-C_bu) + (1 - Y_c4)*0.8*C_ac + Y_c4*C_bac;
      v10 = (-C_pro) + (1 - Y_pro)*0.57*C_ac + Y_pro*C_bac;
      v11 = (-C_ac) + (1 - Y_ac)*C_ch4 + Y_ac*C_bac;
      v12 = (1 - Y_h2)*C_ch4 + Y_h2*C_bac;
      v13 = (-C_bac) + C_pr*f_pr_xb + C_ch*f_ch_xb + C_li*f_li_xb + C_xi*f_xi_xb + C_si*f_si_xb;
//RATES
//Biochemical process rates
      r1 = 0 "k_dis * X_c";
      r2_1 = f_ch1*k_hyd_ch1_T*X_ch;
      r2_2 = f_ch2*k_hyd_ch2_T*X_ch;
      r2_3 = f_ch3*k_hyd_ch3_T*X_ch;
      r3_1 = f_pr1*k_hyd_pr1_T*X_pr;
      r3_2 = f_pr2*k_hyd_pr2_T*X_pr;
      r3_3 = f_pr3*k_hyd_pr3_T*X_pr;
      r4_1 = f_li1*k_hyd_li1_T*X_li;
      r4_2 = f_li2*k_hyd_li2_T*X_li;
      r4_3 = f_li3*k_hyd_li3_T*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4*S_va/(S_va + Ks_c4)*X_c4*S_va/(S_bu + S_va + epsilon)*I_8;
      r9 = k_m_c4*S_bu/(S_bu + Ks_c4)*X_c4*S_bu/(S_bu + S_va + epsilon)*I_9;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T)*X_pro*I_10;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
//
//Acid-base rates
      ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
      ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
      ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
      ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
      ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h) - Ka_co2*S_ic);
      ra11 = k_AB_IN*(S_nh3*(Ka_nh4 + S_h) - Ka_nh4*S_in);
      ra12 = k_AB_IP*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h) - Ka_h2po4*S_ip);
      ra13 = k_AB_IP*(S_po4*(Ka_hpo4 + S_h + S_h^2/Ka_h2po4) - Ka_hpo4*S_ip);
//
//Gas transfer rates
      rt8 = kla*(S_h2 - 16*KH_h2*p_gas_h2);
      rt9 = kla*(S_ch4 - 64*KH_ch4*p_gas_ch4);
      rt10 = kla*(S_co2 - KH_co2*p_gas_co2);
//
//WATER PHASE EQUATIONS
      FeedMix_In.Q + Digestate_Out.Q = 0;
//
//Particulate matter
      24*3600*der(X_c) = FeedMix_In.Q/V_liq*(FeedMix_In.X_c - X_c) - r1;
      24*3600*der(X_ch) = FeedMix_In.Q/V_liq*(FeedMix_In.X_ch - X_ch) + FeedMix_In.f_ch_xc*r1 - r2_1 - r2_2 - r2_3 + f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_pr) = FeedMix_In.Q/V_liq*(FeedMix_In.X_pr - X_pr) + FeedMix_In.f_pr_xc*r1 - r3_1 - r3_2 - r3_2 + f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_li) = FeedMix_In.Q/V_liq*(FeedMix_In.X_li - X_li) + FeedMix_In.f_li_xc*r1 - r4_1 - r4_2 - r4_3 + f_li_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_i) = FeedMix_In.Q/V_liq*(FeedMix_In.X_i - X_i) + FeedMix_In.f_xi_xc*r1 + f_xi_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//
//Soluble matter
      24*3600*der(S_i) = FeedMix_In.Q/V_liq*(FeedMix_In.S_i - S_i) + FeedMix_In.f_si_xc*r1 + f_si_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(S_su) = FeedMix_In.Q/V_liq*(FeedMix_In.S_su - S_su) + r2_1 + r2_2 + r2_3 + (1 - f_fa_li)*(r4_1 + r4_2 + r4_3) - r5;
      24*3600*der(S_aa) = FeedMix_In.Q/V_liq*(FeedMix_In.S_aa - S_aa) + r3_1 + r3_2 + r3_3 - r6;
      24*3600*der(S_fa) = FeedMix_In.Q/V_liq*(FeedMix_In.S_fa - S_fa) + f_fa_li*(r4_1 + r4_2 + r4_3) - r7;
      24*3600*der(S_va) = FeedMix_In.Q/V_liq*(FeedMix_In.S_va - S_va) + (1 - Y_aa)*f_va_aa*r6 - r8;
      24*3600*der(S_bu) = FeedMix_In.Q/V_liq*(FeedMix_In.S_bu - S_bu) + (1 - Y_su)*f_bu_su*r5 + (1 - Y_aa)*f_bu_aa*r6 - r9;
      24*3600*der(S_pro) = FeedMix_In.Q/V_liq*(FeedMix_In.S_pro - S_pro) + (1 - Y_su)*f_pro_su*r5 + (1 - Y_aa)*f_pro_aa*r6 + (1 - Y_c4)*0.54*r8 - r10;
      24*3600*der(S_ac) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ac - S_ac) + (1 - Y_su)*f_ac_su*r5 + (1 - Y_aa)*f_ac_aa*r6 + (1 - Y_fa)*0.7*r7 + (1 - Y_c4)*0.31*r8 + (1 - Y_c4)*0.8*r9 + (1 - Y_pro)*0.57*r10 - r11;
      24*3600*der(S_h2) = FeedMix_In.Q/V_liq*(FeedMix_In.S_h2 - S_h2) + (1 - Y_su)*f_h2_su*r5 + (1 - Y_aa)*f_h2_aa*r6 + (1 - Y_fa)*0.3*r7 + (1 - Y_c4)*0.15*r8 + (1 - Y_c4)*0.2*r9 + (1 - Y_pro)*0.43*r10 - r12 - rt8;
      24*3600*der(S_ch4) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ch4 - S_ch4) + (1 - Y_ac)*r11 + (1 - Y_h2)*r12 - rt9;
      24*3600*der(S_ic) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ic - S_ic) - (v1*r1 + v2*(r2_1 + r2_2 + r2_3) + v3*(r3_1 + r3_2 + r3_3) + v4*(r4_1 + r4_2 + r4_3) + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10 - (rp3 - rd3);
      24*3600*der(S_in) = FeedMix_In.Q/V_liq*(FeedMix_In.S_in - S_in) - Y_su*N_bac*r5 + (N_aa - Y_aa*N_bac)*r6 - Y_fa*N_bac*r7 - Y_c4*N_bac*r8 - Y_c4*N_bac*r9 - Y_pro*N_bac*r10 - Y_ac*N_bac*r11 - Y_h2*N_bac*r12 + (N_bac - N_i*f_xi_xb - N_aa*f_pr_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) - (rp2 - rd2);
      24*3600*der(S_ip) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ip - S_ip) + P_li*(r4_1 + r4_2 + r4_3) - Y_su*P_bac*r5 - Y_aa*P_bac*r6 - Y_fa*P_bac*r7 - Y_c4*P_bac*r8 - Y_c4*P_bac*r9 - Y_pro*P_bac*r10 - Y_ac*P_bac*r11 - Y_h2*P_bac*r12 + (P_bac - P_i*f_xi_xb - P_li*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) - 2*(rp1 - rd1) - (rp2 - rd2);
//
//Biomasses
      24*3600*der(X_su) = FeedMix_In.Q/V_liq*(FeedMix_In.X_su - X_su) + Y_su*r5 - r13;
      24*3600*der(X_aa) = FeedMix_In.Q/V_liq*(FeedMix_In.X_aa - X_aa) + Y_aa*r6 - r14;
      24*3600*der(X_fa) = FeedMix_In.Q/V_liq*(FeedMix_In.X_fa - X_fa) + Y_fa*r7 - r15;
      24*3600*der(X_c4) = FeedMix_In.Q/V_liq*(FeedMix_In.X_c4 - X_c4) + Y_c4*r8 + Y_c4*r9 - r16;
      24*3600*der(X_pro) = FeedMix_In.Q/V_liq*(FeedMix_In.X_pro - X_pro) + Y_pro*r10 - r17;
      24*3600*der(X_ac) = FeedMix_In.Q/V_liq*(FeedMix_In.X_ac - X_ac) + Y_ac*r11 - r18;
      24*3600*der(X_h2) = FeedMix_In.Q/V_liq*(FeedMix_In.X_h2 - X_h2) + Y_h2*r12 - r19;
//
//Cations and anions
      24*3600*der(S_cat) = FeedMix_In.Q/V_liq*(FeedMix_In.S_cat - S_cat);
      24*3600*der(S_ca) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ca - S_ca) - 3*(rp1 - rd1) - (rp3 - rd3);
      24*3600*der(S_mg) = FeedMix_In.Q/V_liq*(FeedMix_In.S_mg - S_mg) - (rp2 - rd2);
//  der (S_ca) = -100*S_ca;
//  der (S_mg) = -100*S_mg;
      24*3600*der(S_an) = FeedMix_In.Q/V_liq*(FeedMix_In.S_an - S_an);
//24 * 3600 * der(S_vam) = -ra4;
//24 * 3600 * der(S_bum) = -ra5;
//24 * 3600 * der(S_prom) = -ra6;
//24 * 3600 * der(S_acm) = -ra7;
//24 * 3600 * der(S_hco3) = -ra10;
//24 * 3600 * der(S_nh3) = -ra11;
//24 * 3600 * der(S_hpo4) = -ra12;
//24 * 3600 * der(S_po4) = -ra13;
      S_nh3 = S_in - S_nh4;
      S_co2 = S_ic - S_hco3 - S_co3;
//S_oh = Ka_h2o * convKa / S_h;
      S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
//AE
//S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
      Theta = S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/Ac_conv - S_prom/Pro_conv - S_bum/Bu_conv - S_vam/Va_conv - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3;
//Theta=0;
//der(S_h)=100000000*(Theta-S_h);
      charge = Theta + S_h - S_oh;
      S_h = S_oh - Theta;
//ODE;
//Theta = 0;
//der(S_h) = (der(S_an) + Ka_nh4 / (Ka_nh4 + S_h) * der(S_in) + Ka_co2 / (Ka_co2 + S_h) * der(S_ic) + 1 / Ac_conv * Ka_ac / (Ka_ac + S_h) * der(S_ac) + 1 / Pro_conv * Ka_pro / (Ka_pro + S_h) * der(S_pro) + 1 / Bu_conv * Ka_bu / (Ka_bu + S_h) * der(S_bu) + 1 / Va_conv * Ka_va / (Ka_va + S_h) * der(S_va) + 2*(Ka_h2po4*der(S_ip)/(Ka_h2po4+S_h+Ka_h2po4*Ka_hpo4/S_h)) + (Ka_h3po4*der(S_ip)/(Ka_h3po4+Ka_h2po4*Ka_h3po4/S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h)^2)) + 3*(Ka_hpo4*der(S_ip)/(Ka_hpo4+S_h+(S_h)^2/Ka_h2po4)) - der(S_in) - der(S_cat)- 2 * der(S_mg) - 2 * der(S_ca)) / (1 + Ka_nh4 * S_in / (Ka_nh4 + S_h) ^ 2 + Ka_co2 * S_ic / (Ka_co2 + S_h) ^ 2 + 1 / Ac_conv * Ka_ac * S_ac / (Ka_ac + S_h) ^ 2 + 1 / Pro_conv * Ka_pro * S_pro / (Ka_pro + S_h) ^ 2 + 1 / Bu_conv * Ka_bu * S_bu / (Ka_bu + S_h) ^ 2 + 1 / Va_conv * Ka_va * S_va / (Ka_va + S_h) ^ 2 + Ka_h2o / S_h ^ 2 + 2*(Ka_h2po4*S_ip-Ka_h2po4^2*Ka_hpo4*S_ip/(S_h)^2/(Ka_h2po4+S_h+Ka_h2po4*Ka_hpo4/S_h)^2) + (-Ka_h3po4^2*S_ip*Ka_h2po4/(S_h)^2-Ka_h3po4^2*Ka_h2po4*Ka_hpo4*S_ip/(S_h)^3/(Ka_h3po4+Ka_h3po4*Ka_h2po4/S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h)^2)^2) + 3*(Ka_hpo4*S_ip+Ka_hpo4*S_ip*2/Ka_h2po4*S_h));
//
//GAS PHASE EQUATIONS
      24*3600*der(S_gas_h2) = (-S_gas_h2*Q_gas/V_gas) + rt8*V_liq/V_gas;
      24*3600*der(S_gas_ch4) = (-S_gas_ch4*Q_gas/V_gas) + rt9*V_liq/V_gas;
      24*3600*der(S_gas_co2) = (-S_gas_co2*Q_gas/V_gas) + rt10*V_liq/V_gas;
      p_gas_h2 = S_gas_h2*R*T_op/h2_conv;
      p_gas_ch4 = S_gas_ch4*R*T_op/ch4_conv;
      p_gas_co2 = S_gas_co2*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
//Q_gas = k_p * (P_gas - P_atm)
      Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq/FeedMix_In.Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
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
      Digestate_Out.S_co3 = S_co3;
      Digestate_Out.S_co2 = S_co2;
      Digestate_Out.S_h = S_h;
      Digestate_Out.S_oh = S_oh;
      Digestate_Out.S_nh3 = S_nh3;
      Digestate_Out.S_nh4 = S_nh4;
      Digestate_Out.S_h3po4 = S_h3po4;
      Digestate_Out.S_h2po4 = S_h2po4;
      Digestate_Out.S_hpo4 = S_hpo4;
      Digestate_Out.S_po4 = S_po4;
      Digestate_Out.S_acm = S_acm;
      Digestate_Out.S_prom = S_prom;
      Digestate_Out.S_bum = S_bum;
      Digestate_Out.S_vam = S_vam;
      Digestate_Out.S_gas_h2 = S_gas_h2;
      Digestate_Out.S_gas_ch4 = S_gas_ch4;
      Digestate_Out.S_gas_co2 = S_gas_co2;
      Digestate_Out.X_acp = X_acp;
      Digestate_Out.X_stru = X_stru;
//DA ELIMINARE!!
      Digestate_Out.f_si_xc = 0;
      Digestate_Out.f_xi_xc = 0;
      Digestate_Out.f_ch_xc = 0;
      Digestate_Out.f_pr_xc = 0;
      Digestate_Out.f_li_xc = 0;
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
      COD_balance_in = FeedMix_In.Q*(FeedMix_In.S_aa + FeedMix_In.S_ac + FeedMix_In.S_bu + FeedMix_In.S_ch4 + FeedMix_In.S_fa + FeedMix_In.S_h2 + FeedMix_In.S_i + FeedMix_In.S_pro + FeedMix_In.S_su + FeedMix_In.S_va + FeedMix_In.X_aa + FeedMix_In.X_ac + FeedMix_In.X_c4 + FeedMix_In.X_fa + FeedMix_In.X_h2 + FeedMix_In.X_pro + FeedMix_In.X_su + FeedMix_In.X_ch + FeedMix_In.X_c + FeedMix_In.X_i + FeedMix_In.X_li + FeedMix_In.X_pr);
      COD_balance_out = Digestate_Out.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/(P_gas - p_gas_h2o)/(R/64*273.15/1.01325) + p_gas_h2/(P_gas - p_gas_h2o)/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
      24*3600*der(V_in_cum) = FeedMix_In.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = FeedMix_In.Q*(FeedMix_In.S_ic + C_xc*FeedMix_In.X_c + C_si*FeedMix_In.S_i + C_xi*FeedMix_In.X_i + C_ch*FeedMix_In.X_ch + C_pr*FeedMix_In.X_pr + C_li*FeedMix_In.X_li + C_su*FeedMix_In.S_su + C_aa*FeedMix_In.S_aa + C_fa*FeedMix_In.S_fa + C_va*FeedMix_In.S_va + C_bu*FeedMix_In.S_bu + C_pro*FeedMix_In.S_pro + C_ac*FeedMix_In.S_ac + C_ch4*FeedMix_In.S_ch4 + C_bac*(FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IC_balance_out = Digestate_Out.Q*(S_ic + C_si*S_i + C_xi*X_i + C_ch*X_ch + C_pr*X_pr + C_li*X_li + C_su*S_su + C_aa*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + C_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)) "+C_xc * X_c";
      IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/(P_gas - p_gas_h2o)/(R/64*273.15/1.01325) + p_gas_co2/(P_gas - p_gas_h2o)/R/273.15*1.01325);
      24*3600*der(IC_balance_in_cum) = IC_balance_in;
      24*3600*der(IC_balance_out_cum) = IC_balance_out;
      24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = FeedMix_In.Q*(FeedMix_In.S_in + N_i*(FeedMix_In.S_i + FeedMix_In.X_i) + N_aa*(FeedMix_In.S_aa + FeedMix_In.X_pr) + N_bac*(FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IN_balance_out = Digestate_Out.Q*(S_in + N_i*(S_i + X_i) + N_aa*(S_aa + X_pr) + N_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru);
      24*3600*der(IN_balance_in_cum) = IN_balance_in;
      24*3600*der(IN_balance_out_cum) = IN_balance_out;
//Inorganic Phosforous Balance
      IP_balance_in = FeedMix_In.Q*(FeedMix_In.S_ip + P_i*(FeedMix_In.S_i + FeedMix_In.X_i) + P_li*FeedMix_In.X_li + P_bac*(FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IP_balance_out = Digestate_Out.Q*(S_ip + P_i*(S_i + X_i) + P_li*X_li + P_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru);
      24*3600*der(IP_balance_in_cum) = IP_balance_in;
      24*3600*der(IP_balance_out_cum) = IP_balance_out;
      24*3600*der(Vcum) = FeedMix_In.Q;
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
    end PostDigester;

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
      Modelica.Blocks.Interfaces.RealInput Fractions_In[9] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //
      Real charge(nominal = 1e-17);
      parameter Real ideality = 1.0 "True=1.0";
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
//
//I calculation
      I = if noEvent(0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv))) < 0 then 0.2 else 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv));
//Ideality vs non-ideality
      g_mono = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_bi = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_tri = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      a_h2o = if noEvent(ideality) > 0.0 then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/Va_conv + S_bum/Bu_conv + S_prom/Pro_conv + S_acm/Ac_conv + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//Activitites calculation = f(S_tot,i)
      a_h = g_mono*S_h;
      a_ca = g_bi*S_ca;
      a_mg = g_bi*S_mg;
      a_nh4 = a_h/Ka_nh4*S_in/(1 + a_h/(Ka_nh4*g_mono));
      a_hco3 = Ka_co2/a_h*S_ic/(1 + Ka_co2/(a_h*g_mono));
      a_co3 = S_ic*a_h*Ka_co2*Ka_hco3/(a_h^3 + Ka_co2*Ka_hco3*a_h/g_bi + Ka_co2*a_h^2/g_mono);
      a_hpo4 = S_ip*a_h*Ka_h3po4*Ka_h2po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_po4 = S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_h2po4 = S_ip*a_h^2*Ka_h3po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_acm = S_ac/Ac_conv*a_h^2*Ka_ac/(a_h^3 + Ka_ac*a_h^2/g_mono);
      a_prom = S_pro/Pro_conv*a_h^2*Ka_pro/(a_h^3 + Ka_pro*a_h^2/g_mono);
      a_bum = S_bu/Bu_conv*a_h^2*Ka_bu/(a_h^3 + Ka_bu*a_h^2/g_mono);
      a_vam = S_va/Va_conv*a_h^2*Ka_va/(a_h^3 + Ka_va*a_h^2/g_mono);
      a_oh = Ka_h2o*convKa*a_h2o/a_h;
//Concentration calculation
      S_nh4 = a_nh4/g_mono;
      S_hco3 = a_hco3/g_mono;
      S_hpo4 = a_hpo4/g_bi;
      S_po4 = a_po4/g_tri;
      S_h2po4 = a_h2po4/g_mono;
      S_co3 = a_co3/g_bi;
      S_acm = a_acm/g_mono*Ac_conv;
      S_prom = a_prom/g_mono*Pro_conv;
      S_bum = a_bum/g_mono*Bu_conv;
      S_vam = a_vam/g_mono*Va_conv;
      S_oh = a_oh/g_mono;
//MPP submodel
      Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
      Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
      SI_acp = log(a_ca^3*a_po4^2/Ksp_acp);
      SI_stru = if noEvent(a_nh4*a_po4*a_mg > Ksp_stru) then 1.0 else -1.0;
      rp1 = 0;
      rp2 = 0;
      rd1 = 0;
      rd2 = 0;
//  rp1 = (1 + sign(SI_acp))/2*kcryst_acp*X_acp*((a_ca^3*a_po4^2/Ksp_acp)^(1/5) - 1)^2;
//  rp2 = SI_stru*kcryst_stru*X_stru*((a_nh4*a_po4*a_mg/Ksp_stru)^(1/3) - 1)^2;
//  rd2 = (1 - sign(SI_stru))/2*kcryst_stru*X_stru*((a_nh4*a_po4*a_mg/Ksp_stru)^(1/3) - 1)^2;
//  rd1 = (1 - sign(SI_acp))/2*kcryst_acp*X_acp*((a_ca^3*a_po4^2/Ksp_acp)^(1/5) - 1)^2;
      24*3600*der(X_acp) = FeedMix_In.Q/V_liq*(-X_acp) + rp1 - rd1;
      24*3600*der(X_stru) = FeedMix_In.Q/V_liq*(-X_stru) + rp2 - rd2;
      Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
      SI_ccm = log(a_ca*a_co3/Ksp_ccm)/abs(log(a_ca*a_co3/Ksp_ccm));
//rp3 = if noEvent(X_ccm<0 and SI_ccm<0) then 0.0 else kcryst_ccm * abs(X_ccm) * ((a_ca * a_co3 / Ksp_ccm) ^ (1 / 2) - 1) ^ 2 * SI_ccm;
      rp3 = 0;
      rd3 = 0;
      24*3600*der(X_ccm) = FeedMix_In.Q/V_liq*(-X_ccm) + rp3 - rd3;
//
//TEMPERATURE DEPENDENT PARAMETERS
//Acidity constants with temperature correction
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4*exp(deltaH0_KH_ch4/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2*exp(deltaH0_KH_co2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2*exp(deltaH0_KH_h2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
//Others with temperature correction
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref - 1/T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_hyd_ch1_T = k_hyd_ch1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr1_T = k_hyd_pr1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li1_T = k_hyd_li1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_ch2_T = k_hyd_ch2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr2_T = k_hyd_pr2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li2_T = k_hyd_li2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_ch3_T = k_hyd_ch3*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr3_T = k_hyd_pr3*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li3_T = k_hyd_li3*exp(th_k_hyd*(T_op - T_ref_k));
      k_m_su_T = k_m_su*exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa*exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa*exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro*exp(th_k_m_pro*(T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac*exp(th_k_m_ac*(T_op - T_ref_k));
      k_m_h2_T = k_m_h2*exp(th_k_m_h2*(T_op - T_ref_k));
      Ks_su_T = Ks_su*exp(th_Ks_su*(T_op - T_ref_k));
      Ks_aa_T = Ks_aa*exp(th_Ks_aa*(T_op - T_ref_k));
      Ks_fa_T = Ks_fa*exp(th_Ks_fa*(T_op - T_ref_k));
      Ks_pro_T = Ks_pro*exp(th_Ks_pro*(T_op - T_ref_k));
//Ks_c4_T = Ks_c4 * exp(th_Ks_c4*(T_op - T_ref_k)); not found
      Ks_ac_T = Ks_ac*exp(th_Ks_ac*(T_op - T_ref_k));
      Ks_h2_T = Ks_h2*exp(th_Ks_h2*(T_op - T_ref_k));
      k_dec_su_T = k_dec_su*exp(th_k_dec_su*(T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa*exp(th_k_dec_aa*(T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa*exp(th_k_dec_fa*(T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro*exp(th_k_dec_pro*(T_op - T_ref_k));
//k_dec_c4_T = k_dec_c4 * exp(th_k_dec_c4*(T_op - T_ref_k)); not found
      k_dec_ac_T = k_dec_ac*exp(th_k_dec_ac*(T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2*exp(th_k_dec_h2*(T_op - T_ref_k));
//
//INHIBITION
      pH = -log10(a_h);
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1/(1 + Ks_IN/S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1/(1 + Ks_IP/S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa*I_in_lim*I_ip_lim;
      I_6 = I_pH_aa*I_in_lim*I_ip_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa*I_ip_lim;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro*I_ip_lim;
      I_11 = I_pH_ac*I_in_lim*I_nh3*I_ip_lim;
      I_12 = I_pH_h2*I_in_lim*I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-C_xc) + FeedMix_In.f_si_xc*C_si + FeedMix_In.f_ch_xc*C_ch + FeedMix_In.f_pr_xc*C_pr + FeedMix_In.f_li_xc*C_li + FeedMix_In.f_xi_xc*C_xi;
      v2 = (-C_ch) + C_su;
      v3 = (-C_pr) + C_aa;
      v4 = (-C_li) + (1 - f_fa_li)*C_su + f_fa_li*C_fa;
      v5 = (-C_su) + (1 - Y_su)*(f_bu_su*C_bu + f_pro_su*C_pro + f_ac_su*C_ac) + Y_su*C_bac;
      v6 = (-C_aa) + (1 - Y_aa)*(f_va_aa*C_va + f_bu_aa*C_bu + f_pro_aa*C_aa + f_ac_aa*C_aa) + Y_aa*C_bac;
      v7 = (-C_fa) + (1 - Y_fa)*0.7*C_ac + Y_fa*C_bac;
      v8 = (-C_va) + (1 - Y_c4)*0.54*C_pro + (1 - Y_c4)*0.31*C_ac + Y_c4*C_bac;
      v9 = (-C_bu) + (1 - Y_c4)*0.8*C_ac + Y_c4*C_bac;
      v10 = (-C_pro) + (1 - Y_pro)*0.57*C_ac + Y_pro*C_bac;
      v11 = (-C_ac) + (1 - Y_ac)*C_ch4 + Y_ac*C_bac;
      v12 = (1 - Y_h2)*C_ch4 + Y_h2*C_bac;
      v13 = (-C_bac) + C_pr*f_pr_xb + C_ch*f_ch_xb + C_li*f_li_xb + C_xi*f_xi_xb + C_si*f_si_xb;
//RATES
//Biochemical process rates
      r1 = 0 "k_dis * X_c";
      r2_1 = f_ch1*k_hyd_ch1_T*X_ch;
      r2_2 = f_ch2*k_hyd_ch2_T*X_ch;
      r2_3 = f_ch3*k_hyd_ch3_T*X_ch;
      r3_1 = f_pr1*k_hyd_pr1_T*X_pr;
      r3_2 = f_pr2*k_hyd_pr2_T*X_pr;
      r3_3 = f_pr3*k_hyd_pr3_T*X_pr;
      r4_1 = f_li1*k_hyd_li1_T*X_li;
      r4_2 = f_li2*k_hyd_li2_T*X_li;
      r4_3 = f_li3*k_hyd_li3_T*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4*S_va/(S_va + Ks_c4)*X_c4*S_va/(S_bu + S_va + epsilon)*I_8;
      r9 = k_m_c4*S_bu/(S_bu + Ks_c4)*X_c4*S_bu/(S_bu + S_va + epsilon)*I_9;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T)*X_pro*I_10;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
//
//Acid-base rates
      ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
      ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
      ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
      ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
      ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h) - Ka_co2*S_ic);
      ra11 = k_AB_IN*(S_nh3*(Ka_nh4 + S_h) - Ka_nh4*S_in);
      ra12 = k_AB_IP*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h) - Ka_h2po4*S_ip);
      ra13 = k_AB_IP*(S_po4*(Ka_hpo4 + S_h + S_h^2/Ka_h2po4) - Ka_hpo4*S_ip);
//
//Gas transfer rates
      rt8 = kla*(S_h2 - 16*KH_h2*p_gas_h2);
      rt9 = kla*(S_ch4 - 64*KH_ch4*p_gas_ch4);
      rt10 = kla*(S_co2 - KH_co2*p_gas_co2);
//
//WATER PHASE EQUATIONS
      FeedMix_In.Q + Digestate_Out.Q = 0;
//
//Particulate matter
      24*3600*der(X_c) = FeedMix_In.Q/V_liq*(FeedMix_In.X_c - X_c) - r1;
      24*3600*der(X_ch) = FeedMix_In.Q/V_liq*(FeedMix_In.X_ch - X_ch) + FeedMix_In.f_ch_xc*r1 - r2_1 - r2_2 - r2_3 + f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_pr) = FeedMix_In.Q/V_liq*(FeedMix_In.X_pr - X_pr) + FeedMix_In.f_pr_xc*r1 - r3_1 - r3_2 - r3_2 + f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_li) = FeedMix_In.Q/V_liq*(FeedMix_In.X_li - X_li) + FeedMix_In.f_li_xc*r1 - r4_1 - r4_2 - r4_3 + f_li_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_i) = FeedMix_In.Q/V_liq*(FeedMix_In.X_i - X_i) + FeedMix_In.f_xi_xc*r1 + f_xi_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//
//Soluble matter
      24*3600*der(S_i) = FeedMix_In.Q/V_liq*(FeedMix_In.S_i - S_i) + FeedMix_In.f_si_xc*r1 + f_si_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(S_su) = FeedMix_In.Q/V_liq*(FeedMix_In.S_su - S_su) + r2_1 + r2_2 + r2_3 + (1 - f_fa_li)*(r4_1 + r4_2 + r4_3) - r5;
      24*3600*der(S_aa) = FeedMix_In.Q/V_liq*(FeedMix_In.S_aa - S_aa) + r3_1 + r3_2 + r3_3 - r6;
      24*3600*der(S_fa) = FeedMix_In.Q/V_liq*(FeedMix_In.S_fa - S_fa) + f_fa_li*(r4_1 + r4_2 + r4_3) - r7;
      24*3600*der(S_va) = FeedMix_In.Q/V_liq*(FeedMix_In.S_va - S_va) + (1 - Y_aa)*f_va_aa*r6 - r8;
      24*3600*der(S_bu) = FeedMix_In.Q/V_liq*(FeedMix_In.S_bu - S_bu) + (1 - Y_su)*f_bu_su*r5 + (1 - Y_aa)*f_bu_aa*r6 - r9;
      24*3600*der(S_pro) = FeedMix_In.Q/V_liq*(FeedMix_In.S_pro - S_pro) + (1 - Y_su)*f_pro_su*r5 + (1 - Y_aa)*f_pro_aa*r6 + (1 - Y_c4)*0.54*r8 - r10;
      24*3600*der(S_ac) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ac - S_ac) + (1 - Y_su)*f_ac_su*r5 + (1 - Y_aa)*f_ac_aa*r6 + (1 - Y_fa)*0.7*r7 + (1 - Y_c4)*0.31*r8 + (1 - Y_c4)*0.8*r9 + (1 - Y_pro)*0.57*r10 - r11;
      24*3600*der(S_h2) = FeedMix_In.Q/V_liq*(FeedMix_In.S_h2 - S_h2) + (1 - Y_su)*f_h2_su*r5 + (1 - Y_aa)*f_h2_aa*r6 + (1 - Y_fa)*0.3*r7 + (1 - Y_c4)*0.15*r8 + (1 - Y_c4)*0.2*r9 + (1 - Y_pro)*0.43*r10 - r12 - rt8;
      24*3600*der(S_ch4) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ch4 - S_ch4) + (1 - Y_ac)*r11 + (1 - Y_h2)*r12 - rt9;
      24*3600*der(S_ic) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ic - S_ic) - (v1*r1 + v2*(r2_1 + r2_2 + r2_3) + v3*(r3_1 + r3_2 + r3_3) + v4*(r4_1 + r4_2 + r4_3) + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10 - (rp3 - rd3);
      24*3600*der(S_in) = FeedMix_In.Q/V_liq*(FeedMix_In.S_in - S_in) - Y_su*N_bac*r5 + (N_aa - Y_aa*N_bac)*r6 - Y_fa*N_bac*r7 - Y_c4*N_bac*r8 - Y_c4*N_bac*r9 - Y_pro*N_bac*r10 - Y_ac*N_bac*r11 - Y_h2*N_bac*r12 + (N_bac - N_i*f_xi_xb - N_aa*f_pr_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) - (rp2 - rd2);
      24*3600*der(S_ip) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ip - S_ip) + P_li*(r4_1 + r4_2 + r4_3) - Y_su*P_bac*r5 - Y_aa*P_bac*r6 - Y_fa*P_bac*r7 - Y_c4*P_bac*r8 - Y_c4*P_bac*r9 - Y_pro*P_bac*r10 - Y_ac*P_bac*r11 - Y_h2*P_bac*r12 + (P_bac - P_i*f_xi_xb - P_li*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) - 2*(rp1 - rd1) - (rp2 - rd2);
//
//Biomasses
      24*3600*der(X_su) = FeedMix_In.Q/V_liq*(FeedMix_In.X_su - X_su) + Y_su*r5 - r13;
      24*3600*der(X_aa) = FeedMix_In.Q/V_liq*(FeedMix_In.X_aa - X_aa) + Y_aa*r6 - r14;
      24*3600*der(X_fa) = FeedMix_In.Q/V_liq*(FeedMix_In.X_fa - X_fa) + Y_fa*r7 - r15;
      24*3600*der(X_c4) = FeedMix_In.Q/V_liq*(FeedMix_In.X_c4 - X_c4) + Y_c4*r8 + Y_c4*r9 - r16;
      24*3600*der(X_pro) = FeedMix_In.Q/V_liq*(FeedMix_In.X_pro - X_pro) + Y_pro*r10 - r17;
      24*3600*der(X_ac) = FeedMix_In.Q/V_liq*(FeedMix_In.X_ac - X_ac) + Y_ac*r11 - r18;
      24*3600*der(X_h2) = FeedMix_In.Q/V_liq*(FeedMix_In.X_h2 - X_h2) + Y_h2*r12 - r19;
//
//Cations and anions
      24*3600*der(S_cat) = FeedMix_In.Q/V_liq*(FeedMix_In.S_cat - S_cat);
      24*3600*der(S_ca) = FeedMix_In.Q/V_liq*(FeedMix_In.S_ca - S_ca) - 3*(rp1 - rd1) - (rp3 - rd3);
      24*3600*der(S_mg) = FeedMix_In.Q/V_liq*(FeedMix_In.S_mg - S_mg) - (rp2 - rd2);
//  der (S_ca) = -100*S_ca;
//  der (S_mg) = -100*S_mg;
      24*3600*der(S_an) = FeedMix_In.Q/V_liq*(FeedMix_In.S_an - S_an);
//24 * 3600 * der(S_vam) = -ra4;
//24 * 3600 * der(S_bum) = -ra5;
//24 * 3600 * der(S_prom) = -ra6;
//24 * 3600 * der(S_acm) = -ra7;
//24 * 3600 * der(S_hco3) = -ra10;
//24 * 3600 * der(S_nh3) = -ra11;
//24 * 3600 * der(S_hpo4) = -ra12;
//24 * 3600 * der(S_po4) = -ra13;
      S_nh3 = S_in - S_nh4;
      S_co2 = S_ic - S_hco3 - S_co3;
//S_oh = Ka_h2o * convKa / S_h;
      S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
//AE
//S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
      Theta = S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/Ac_conv - S_prom/Pro_conv - S_bum/Bu_conv - S_vam/Va_conv - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3;
//Theta=0;
//der(S_h)=100000000*(Theta-S_h);
      charge = Theta + S_h - S_oh;
      S_h = S_oh - Theta;
//ODE;
//Theta = 0;
//der(S_h) = (der(S_an) + Ka_nh4 / (Ka_nh4 + S_h) * der(S_in) + Ka_co2 / (Ka_co2 + S_h) * der(S_ic) + 1 / Ac_conv * Ka_ac / (Ka_ac + S_h) * der(S_ac) + 1 / Pro_conv * Ka_pro / (Ka_pro + S_h) * der(S_pro) + 1 / Bu_conv * Ka_bu / (Ka_bu + S_h) * der(S_bu) + 1 / Va_conv * Ka_va / (Ka_va + S_h) * der(S_va) + 2*(Ka_h2po4*der(S_ip)/(Ka_h2po4+S_h+Ka_h2po4*Ka_hpo4/S_h)) + (Ka_h3po4*der(S_ip)/(Ka_h3po4+Ka_h2po4*Ka_h3po4/S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h)^2)) + 3*(Ka_hpo4*der(S_ip)/(Ka_hpo4+S_h+(S_h)^2/Ka_h2po4)) - der(S_in) - der(S_cat)- 2 * der(S_mg) - 2 * der(S_ca)) / (1 + Ka_nh4 * S_in / (Ka_nh4 + S_h) ^ 2 + Ka_co2 * S_ic / (Ka_co2 + S_h) ^ 2 + 1 / Ac_conv * Ka_ac * S_ac / (Ka_ac + S_h) ^ 2 + 1 / Pro_conv * Ka_pro * S_pro / (Ka_pro + S_h) ^ 2 + 1 / Bu_conv * Ka_bu * S_bu / (Ka_bu + S_h) ^ 2 + 1 / Va_conv * Ka_va * S_va / (Ka_va + S_h) ^ 2 + Ka_h2o / S_h ^ 2 + 2*(Ka_h2po4*S_ip-Ka_h2po4^2*Ka_hpo4*S_ip/(S_h)^2/(Ka_h2po4+S_h+Ka_h2po4*Ka_hpo4/S_h)^2) + (-Ka_h3po4^2*S_ip*Ka_h2po4/(S_h)^2-Ka_h3po4^2*Ka_h2po4*Ka_hpo4*S_ip/(S_h)^3/(Ka_h3po4+Ka_h3po4*Ka_h2po4/S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h)^2)^2) + 3*(Ka_hpo4*S_ip+Ka_hpo4*S_ip*2/Ka_h2po4*S_h));
//
//GAS PHASE EQUATIONS
      24*3600*der(S_gas_h2) = (-S_gas_h2*Q_gas/V_gas) + rt8*V_liq/V_gas;
      24*3600*der(S_gas_ch4) = (-S_gas_ch4*Q_gas/V_gas) + rt9*V_liq/V_gas;
      24*3600*der(S_gas_co2) = (-S_gas_co2*Q_gas/V_gas) + rt10*V_liq/V_gas;
      p_gas_h2 = S_gas_h2*R*T_op/h2_conv;
      p_gas_ch4 = S_gas_ch4*R*T_op/ch4_conv;
      p_gas_co2 = S_gas_co2*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
//Q_gas = k_p * (P_gas - P_atm)
      Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq/FeedMix_In.Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
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
      Digestate_Out.S_co3 = S_co3;
      Digestate_Out.S_co2 = S_co2;
      Digestate_Out.S_h = S_h;
      Digestate_Out.S_oh = S_oh;
      Digestate_Out.S_nh3 = S_nh3;
      Digestate_Out.S_nh4 = S_nh4;
      Digestate_Out.S_h3po4 = S_h3po4;
      Digestate_Out.S_h2po4 = S_h2po4;
      Digestate_Out.S_hpo4 = S_hpo4;
      Digestate_Out.S_po4 = S_po4;
      Digestate_Out.S_acm = S_acm;
      Digestate_Out.S_prom = S_prom;
      Digestate_Out.S_bum = S_bum;
      Digestate_Out.S_vam = S_vam;
      Digestate_Out.S_gas_h2 = S_gas_h2;
      Digestate_Out.S_gas_ch4 = S_gas_ch4;
      Digestate_Out.S_gas_co2 = S_gas_co2;
      Digestate_Out.X_acp = X_acp;
      Digestate_Out.X_stru = X_stru;
//DA ELIMINARE!!
      Digestate_Out.f_si_xc = 0;
      Digestate_Out.f_xi_xc = 0;
      Digestate_Out.f_ch_xc = 0;
      Digestate_Out.f_pr_xc = 0;
      Digestate_Out.f_li_xc = 0;
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
      COD_balance_in = FeedMix_In.Q*(FeedMix_In.S_aa + FeedMix_In.S_ac + FeedMix_In.S_bu + FeedMix_In.S_ch4 + FeedMix_In.S_fa + FeedMix_In.S_h2 + FeedMix_In.S_i + FeedMix_In.S_pro + FeedMix_In.S_su + FeedMix_In.S_va + FeedMix_In.X_aa + FeedMix_In.X_ac + FeedMix_In.X_c4 + FeedMix_In.X_fa + FeedMix_In.X_h2 + FeedMix_In.X_pro + FeedMix_In.X_su + FeedMix_In.X_ch + FeedMix_In.X_c + FeedMix_In.X_i + FeedMix_In.X_li + FeedMix_In.X_pr);
      COD_balance_out = Digestate_Out.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/(P_gas - p_gas_h2o)/(R/64*273.15/1.01325) + p_gas_h2/(P_gas - p_gas_h2o)/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
      24*3600*der(V_in_cum) = FeedMix_In.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = FeedMix_In.Q*(FeedMix_In.S_ic + C_xc*FeedMix_In.X_c + C_si*FeedMix_In.S_i + C_xi*FeedMix_In.X_i + C_ch*FeedMix_In.X_ch + C_pr*FeedMix_In.X_pr + C_li*FeedMix_In.X_li + C_su*FeedMix_In.S_su + C_aa*FeedMix_In.S_aa + C_fa*FeedMix_In.S_fa + C_va*FeedMix_In.S_va + C_bu*FeedMix_In.S_bu + C_pro*FeedMix_In.S_pro + C_ac*FeedMix_In.S_ac + C_ch4*FeedMix_In.S_ch4 + C_bac*(FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IC_balance_out = Digestate_Out.Q*(S_ic + C_si*S_i + C_xi*X_i + C_ch*X_ch + C_pr*X_pr + C_li*X_li + C_su*S_su + C_aa*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + C_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)) "+C_xc * X_c";
      IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/(P_gas - p_gas_h2o)/(R/64*273.15/1.01325) + p_gas_co2/(P_gas - p_gas_h2o)/R/273.15*1.01325);
      24*3600*der(IC_balance_in_cum) = IC_balance_in;
      24*3600*der(IC_balance_out_cum) = IC_balance_out;
      24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = FeedMix_In.Q*(FeedMix_In.S_in + N_i*(FeedMix_In.S_i + FeedMix_In.X_i) + N_aa*(FeedMix_In.S_aa + FeedMix_In.X_pr) + N_bac*(FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IN_balance_out = Digestate_Out.Q*(S_in + N_i*(S_i + X_i) + N_aa*(S_aa + X_pr) + N_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru);
      24*3600*der(IN_balance_in_cum) = IN_balance_in;
      24*3600*der(IN_balance_out_cum) = IN_balance_out;
//Inorganic Phosforous Balance
      IP_balance_in = FeedMix_In.Q*(FeedMix_In.S_ip + P_i*(FeedMix_In.S_i + FeedMix_In.X_i) + P_li*FeedMix_In.X_li + P_bac*(FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IP_balance_out = Digestate_Out.Q*(S_ip + P_i*(S_i + X_i) + P_li*X_li + P_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru);
      24*3600*der(IP_balance_in_cum) = IP_balance_in;
      24*3600*der(IP_balance_out_cum) = IP_balance_out;
      24*3600*der(Vcum) = FeedMix_In.Q;
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-08, Interval = 0.002));
    end Digester;

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
      Alk = (Digestate_In.S_hco3 + 2*Digestate_In.S_co3 + Digestate_In.S_oh + Digestate_In.S_acm/Ac_conv + Digestate_In.S_prom/Pro_conv + Digestate_In.S_bum/Bu_conv + Digestate_In.S_vam/Va_conv - Digestate_In.S_h + Digestate_In.S_nh3 + Digestate_In.S_hpo4 + 2*Digestate_In.S_po4 - Digestate_In.S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      VFA = (Digestate_In.S_ac/Ac_conv + Digestate_In.S_pro/Pro_conv + Digestate_In.S_bu/Bu_conv + Digestate_In.S_va/Va_conv)*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/Alk "Ratio between acidity and alkalinity";
//
      VS = (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_Xbiom_ch/CH_conv_out + (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_Xbiom_pr/PR_conv_out + (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_Xbiom_li/LI_conv_out + (Digestate_In.S_su + Digestate_In.X_ch)/CH_conv_out + (Digestate_In.S_aa + Digestate_In.X_pr)/PR_conv_out + (Digestate_In.S_fa + Digestate_In.X_li)/LI_conv_out + Digestate_In.S_i/Si_conv_out + Digestate_In.X_i/Xi_conv_out + Digestate_In.X_c*complexpart_CH/CH_conv_out + Digestate_In.X_c*complexpart_PR/PR_conv_out + Digestate_In.X_c*complexpart_LI/LI_conv_out "Volatile Solid content in the digester as gVS/L";
//
      N_NH4NH3 = Digestate_In.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = Digestate_In.S_aa + Digestate_In.S_ac + Digestate_In.S_bu + Digestate_In.S_ch4 + Digestate_In.S_fa + Digestate_In.S_h2 + Digestate_In.S_i + Digestate_In.S_pro + Digestate_In.S_su + Digestate_In.S_va + Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c + Digestate_In.X_c4 + Digestate_In.X_ch + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_i + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su "Total COD concentration as gCOD/L";
      CH_tot = (Digestate_In.S_su + Digestate_In.X_ch + Digestate_In.X_c*complexpart_CH + Digestate_In.S_i*f_Si_ch + Digestate_In.X_i*f_Xi_ch + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su)*f_Xbiom_ch)/CH_conv_out "Total CH concentration as gGlu/L";
      PR_tot_BCA = (Digestate_In.S_aa + Digestate_In.X_pr + Digestate_In.X_c*complexpart_PR + Digestate_In.S_i*f_Si_pr + Digestate_In.X_i*f_Xi_pr + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su)*f_Xbiom_pr)/PR_conv_out_BSA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (Digestate_In.S_aa + Digestate_In.X_pr + Digestate_In.X_c*complexpart_PR + Digestate_In.S_i*f_Si_pr + Digestate_In.X_i*f_Xi_pr + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su)*f_Xbiom_pr)/PR_conv_out/N_PR_conv "Total PR concentration as gN/L";
      LI_tot = (Digestate_In.S_fa + Digestate_In.X_li + Digestate_In.X_c*complexpart_LI + Digestate_In.S_i*f_Si_li + Digestate_In.X_i*f_Xi_li + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su)*f_Xbiom_li)/LI_conv_out "Total LI concentration as glipid/L";
      CH_sol = (Digestate_In.S_su + Digestate_In.S_i*f_Si_ch)/CH_conv_out "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (Digestate_In.S_aa + Digestate_In.S_i*f_Si_pr)/PR_conv_out_BSA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (Digestate_In.S_aa + Digestate_In.S_i*f_Si_pr)/PR_conv_out/N_PR_conv "Soluble PR concentration as gN/L";
      LI_sol = (Digestate_In.S_fa + Digestate_In.S_i*f_Si_li)/LI_conv_out "Soluble LI concentration as glipid/L";
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
      x_ch4 = Biogas_In.p_gas_ch4/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_co2 = Biogas_In.p_gas_co2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_h2 = Biogas_In.p_gas_h2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      Q_ch4_N = Biogas_In.Q_gas_N*x_ch4*1000 "Methane rate [L/d] at standard conditions";
      Q_co2_N = Biogas_In.Q_gas_N*x_co2*1000 "Carbon dioxide rate [L/d] at standard conditions";
      Q_h2_N = Biogas_In.Q_gas_N*x_h2*1000 "Hydrogen rate [L/d] at standard conditions";
    end Gas_Meter;

    model Probe_T
      extends ADM1_P.Icons.ProbeT;
      Modelica.Blocks.Interfaces.RealOutput y_T annotation(
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_T_ADM1_Flores.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
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
      Modelica.Blocks.Interfaces.RealInput InF[16] annotation(
        Placement(visible = true, transformation(origin = {6, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-33, -87}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealOutput OutF[12] annotation(
        Placement(visible = true, transformation(origin = {98, -46}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {40, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealInput Fractions_In[9] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //Input from feedstocks
      //Co-digestion fractions
      input Real f_ch1;
      input Real f_ch2;
      input Real f_ch3;
      input Real f_pr1;
      input Real f_pr2;
      input Real f_pr3;
      input Real f_li1;
      input Real f_li2;
      input Real f_li3;
      //Inputs from pH
      input Real pH;
      input Real S_vam;
      input Real S_bum;
      input Real S_prom;
      input Real S_acm;
      input Real S_hco3;
      input Real S_co3;
      input Real S_nh3;
      input Real S_hpo4;
      input Real S_h3po4;
      input Real S_po4;
      input Real S_nh4;
      input Real S_co2;
      input Real S_oh;
      input Real S_h;
      input Real S_h2po4;
      //From MPP
      input Real rp1;
      input Real rp2;
      input Real X_acp;
      input Real X_stru;
      input Real rd1;
      input Real rd2;
      input Real rp3;
      input Real rd3;
      input Real X_ccm;
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
      S_ip_in = FeedMix_In.S_ip;
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
//
      InF[1] = pH;
      InF[2] = S_vam;
      InF[3] = S_bum;
      InF[4] = S_prom;
      InF[5] = S_acm;
      InF[6] = S_hco3;
      InF[7] = S_nh3;
      InF[8] = S_hpo4;
      InF[9] = S_po4;
      InF[10] = S_nh4;
      InF[11] = S_co2;
      InF[12] = S_oh;
      InF[13] = S_h;
      InF[14] = S_h2po4;
      InF[15] = S_co3;
      InF[16] = S_h3po4;
//
//TEMPERATURE DEPENDENT PARAMETERS
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4*exp(deltaH0_KH_ch4/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2*exp(deltaH0_KH_co2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2*exp(deltaH0_KH_h2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
//Others with temperature correction
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref - 1/T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_hyd_ch1_T = k_hyd_ch1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr1_T = k_hyd_pr1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li1_T = k_hyd_li1*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_ch2_T = k_hyd_ch2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr2_T = k_hyd_pr2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li2_T = k_hyd_li2*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_ch3_T = k_hyd_ch3*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_pr3_T = k_hyd_pr3*exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li3_T = k_hyd_li3*exp(th_k_hyd*(T_op - T_ref_k));
      k_m_su_T = k_m_su*exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa*exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa*exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro*exp(th_k_m_pro*(T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac*exp(th_k_m_ac*(T_op - T_ref_k));
      k_m_h2_T = k_m_h2*exp(th_k_m_h2*(T_op - T_ref_k));
      Ks_su_T = Ks_su*exp(th_Ks_su*(T_op - T_ref_k));
      Ks_aa_T = Ks_aa*exp(th_Ks_aa*(T_op - T_ref_k));
      Ks_fa_T = Ks_fa*exp(th_Ks_fa*(T_op - T_ref_k));
      Ks_pro_T = Ks_pro*exp(th_Ks_pro*(T_op - T_ref_k));
//Ks_c4_T = Ks_c4 * exp(th_Ks_c4*(T_op - T_ref_k)); not found
      Ks_ac_T = Ks_ac*exp(th_Ks_ac*(T_op - T_ref_k));
      Ks_h2_T = Ks_h2*exp(th_Ks_h2*(T_op - T_ref_k));
      k_dec_su_T = k_dec_su*exp(th_k_dec_su*(T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa*exp(th_k_dec_aa*(T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa*exp(th_k_dec_fa*(T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro*exp(th_k_dec_pro*(T_op - T_ref_k));
//k_dec_c4_T = k_dec_c4 * exp(th_k_dec_c4*(T_op - T_ref_k)); not found
      k_dec_ac_T = k_dec_ac*exp(th_k_dec_ac*(T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2*exp(th_k_dec_h2*(T_op - T_ref_k));
//
//INHIBITION
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1/(1 + Ks_IN/S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1/(1 + Ks_IP/S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa*I_in_lim*I_ip_lim;
      I_6 = I_pH_aa*I_in_lim*I_ip_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa*I_ip_lim;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro*I_ip_lim;
      I_11 = I_pH_ac*I_in_lim*I_nh3*I_ip_lim;
      I_12 = I_pH_h2*I_in_lim*I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-C_xc) + FeedMix_In.f_si_xc*C_si + FeedMix_In.f_ch_xc*C_ch + FeedMix_In.f_pr_xc*C_pr + FeedMix_In.f_li_xc*C_li + FeedMix_In.f_xi_xc*C_xi;
      v2 = (-C_ch) + C_su;
      v3 = (-C_pr) + C_aa;
      v4 = (-C_li) + (1 - f_fa_li)*C_su + f_fa_li*C_fa;
      v5 = (-C_su) + (1 - Y_su)*(f_bu_su*C_bu + f_pro_su*C_pro + f_ac_su*C_ac) + Y_su*C_bac;
      v6 = (-C_aa) + (1 - Y_aa)*(f_va_aa*C_va + f_bu_aa*C_bu + f_pro_aa*C_aa + f_ac_aa*C_aa) + Y_aa*C_bac;
      v7 = (-C_fa) + (1 - Y_fa)*0.7*C_ac + Y_fa*C_bac;
      v8 = (-C_va) + (1 - Y_c4)*0.54*C_pro + (1 - Y_c4)*0.31*C_ac + Y_c4*C_bac;
      v9 = (-C_bu) + (1 - Y_c4)*0.8*C_ac + Y_c4*C_bac;
      v10 = (-C_pro) + (1 - Y_pro)*0.57*C_ac + Y_pro*C_bac;
      v11 = (-C_ac) + (1 - Y_ac)*C_ch4 + Y_ac*C_bac;
      v12 = (1 - Y_h2)*C_ch4 + Y_h2*C_bac;
      v13 = (-C_bac) + C_pr*f_pr_xb + C_ch*f_ch_xb + C_li*f_li_xb + C_xi*f_xi_xb + C_si*f_si_xb;
//RATES
//Biochemical process rates
      r1 = 0 "k_dis * X_c";
      r2_1 = f_ch1*k_hyd_ch1_T*X_ch;
      r2_2 = f_ch2*k_hyd_ch2_T*X_ch;
      r2_3 = f_ch3*k_hyd_ch3_T*X_ch;
      r3_1 = f_pr1*k_hyd_pr1_T*X_pr;
      r3_2 = f_pr2*k_hyd_pr2_T*X_pr;
      r3_3 = f_pr3*k_hyd_pr3_T*X_pr;
      r4_1 = f_li1*k_hyd_li1_T*X_li;
      r4_2 = f_li2*k_hyd_li2_T*X_li;
      r4_3 = f_li3*k_hyd_li3_T*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4*S_va/(S_va + Ks_c4)*X_c4*S_va/(S_bu + S_va + epsilon)*I_8;
      r9 = k_m_c4*S_bu/(S_bu + Ks_c4)*X_c4*S_bu/(S_bu + S_va + epsilon)*I_9;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T)*X_pro*I_10;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
//
//Gas transfer rates
      rt8 = kla*(S_h2 - 16*KH_h2*p_gas_h2);
      rt9 = kla*(S_ch4 - 64*KH_ch4*p_gas_ch4);
      rt10 = kla*(S_co2 - KH_co2*p_gas_co2);
//
//WATER PHASE EQUATIONS
      FeedMix_In.Q + Digestate_Out.Q = 0;
//
//Particulate matter
      24*3600*der(X_c) = FeedMix_In.Q/V_liq*(X_c_in - X_c) - r1 "+ r13 + r14 + r15 + r16 + r17 + r18 + r19";
      24*3600*der(X_ch) = FeedMix_In.Q/V_liq*(X_ch_in - X_ch) + FeedMix_In.f_ch_xc*r1 - r2_1 - r2_2 - r2_3 + f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_pr) = FeedMix_In.Q/V_liq*(X_pr_in - X_pr) + FeedMix_In.f_pr_xc*r1 - r3_1 - r3_2 - r3_2 + f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_li) = FeedMix_In.Q/V_liq*(X_li_in - X_li) + FeedMix_In.f_li_xc*r1 - r4_1 - r4_2 - r4_3 + f_li_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_i) = FeedMix_In.Q/V_liq*(X_i_in - X_i) + FeedMix_In.f_xi_xc*r1 + f_xi_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//
//Soluble matter
      24*3600*der(S_i) = FeedMix_In.Q/V_liq*(S_i_in - S_i) + FeedMix_In.f_si_xc*r1 + f_si_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(S_su) = FeedMix_In.Q/V_liq*(S_su_in - S_su) + r2_1 + r2_2 + r2_3 + (1 - f_fa_li)*(r4_1 + r4_2 + r4_3) - r5;
      24*3600*der(S_aa) = FeedMix_In.Q/V_liq*(S_aa_in - S_aa) + r3_1 + r3_2 + r3_3 - r6;
      24*3600*der(S_fa) = FeedMix_In.Q/V_liq*(S_fa_in - S_fa) + f_fa_li*(r4_1 + r4_2 + r4_3) - r7;
      24*3600*der(S_va) = FeedMix_In.Q/V_liq*(S_va_in - S_va) + (1 - Y_aa)*f_va_aa*r6 - r8;
      24*3600*der(S_bu) = FeedMix_In.Q/V_liq*(S_bu_in - S_bu) + (1 - Y_su)*f_bu_su*r5 + (1 - Y_aa)*f_bu_aa*r6 - r9;
      24*3600*der(S_pro) = FeedMix_In.Q/V_liq*(S_pro_in - S_pro) + (1 - Y_su)*f_pro_su*r5 + (1 - Y_aa)*f_pro_aa*r6 + (1 - Y_c4)*0.54*r8 - r10;
      24*3600*der(S_ac) = FeedMix_In.Q/V_liq*(S_ac_in - S_ac) + (1 - Y_su)*f_ac_su*r5 + (1 - Y_aa)*f_ac_aa*r6 + (1 - Y_fa)*0.7*r7 + (1 - Y_c4)*0.31*r8 + (1 - Y_c4)*0.8*r9 + (1 - Y_pro)*0.57*r10 - r11;
      24*3600*der(S_h2) = FeedMix_In.Q/V_liq*(S_h2_in - S_h2) + (1 - Y_su)*f_h2_su*r5 + (1 - Y_aa)*f_h2_aa*r6 + (1 - Y_fa)*0.3*r7 + (1 - Y_c4)*0.15*r8 + (1 - Y_c4)*0.2*r9 + (1 - Y_pro)*0.43*r10 - r12 - rt8;
      24*3600*der(S_ch4) = FeedMix_In.Q/V_liq*(S_ch4_in - S_ch4) + (1 - Y_ac)*r11 + (1 - Y_h2)*r12 - rt9;
      24*3600*der(S_ic) = FeedMix_In.Q/V_liq*(S_ic_in - S_ic) - (v1*r1 + v2*(r2_1 + r2_2 + r2_3) + v3*(r3_1 + r3_2 + r3_3) + v4*(r4_1 + r4_2 + r4_3) + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10;
      24*3600*der(S_in) = FeedMix_In.Q/V_liq*(S_in_in - S_in) - Y_su*N_bac*r5 + (N_aa - Y_aa*N_bac)*r6 - Y_fa*N_bac*r7 - Y_c4*N_bac*r8 - Y_c4*N_bac*r9 - Y_pro*N_bac*r10 - Y_ac*N_bac*r11 - Y_h2*N_bac*r12 + (N_bac - N_i*f_xi_xb - N_aa*f_pr_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) - rp2;
      24*3600*der(S_ip) = FeedMix_In.Q/V_liq*(S_ip_in - S_ip) + P_li*(r4_1 + r4_2 + r4_3) - Y_su*P_bac*r5 - Y_aa*P_bac*r6 - Y_fa*P_bac*r7 - Y_c4*P_bac*r8 - Y_c4*P_bac*r9 - Y_pro*P_bac*r10 - Y_ac*P_bac*r11 - Y_h2*P_bac*r12 + (P_bac - P_i*f_xi_xb - P_li*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) - 2*rp1 - rp2;
//
      24*3600*der(S_cat) = FeedMix_In.Q/V_liq*(S_cat_in - S_cat);
      24*3600*der(S_ca) = FeedMix_In.Q/V_liq*(S_ca_in - S_ca) - 3*(rp1 - rd1) - (rp3 - rd3);
      24*3600*der(S_mg) = FeedMix_In.Q/V_liq*(S_mg_in - S_mg) - (rp2 - rd2);
      24*3600*der(S_an) = FeedMix_In.Q/V_liq*(S_an_in - S_an);
//
//Biomasses
      24*3600*der(X_su) = FeedMix_In.Q/V_liq*(X_su_in - X_su) + Y_su*r5 - r13;
      24*3600*der(X_aa) = FeedMix_In.Q/V_liq*(X_aa_in - X_aa) + Y_aa*r6 - r14;
      24*3600*der(X_fa) = FeedMix_In.Q/V_liq*(X_fa_in - X_fa) + Y_fa*r7 - r15;
      24*3600*der(X_c4) = FeedMix_In.Q/V_liq*(X_c4_in - X_c4) + Y_c4*r8 + Y_c4*r9 - r16;
      24*3600*der(X_pro) = FeedMix_In.Q/V_liq*(X_pro_in - X_pro) + Y_pro*r10 - r17;
      24*3600*der(X_ac) = FeedMix_In.Q/V_liq*(X_ac_in - X_ac) + Y_ac*r11 - r18;
      24*3600*der(X_h2) = FeedMix_In.Q/V_liq*(X_h2_in - X_h2) + Y_h2*r12 - r19;
//
//GAS PHASE EQUATIONS
      24*3600*der(S_gas_h2) = (-S_gas_h2*Q_gas/V_gas) + rt8*V_liq/V_gas;
      24*3600*der(S_gas_ch4) = (-S_gas_ch4*Q_gas/V_gas) + rt9*V_liq/V_gas;
      24*3600*der(S_gas_co2) = (-S_gas_co2*Q_gas/V_gas) + rt10*V_liq/V_gas;
      p_gas_h2 = S_gas_h2*R*T_op/h2_conv;
      p_gas_ch4 = S_gas_ch4*R*T_op/ch4_conv;
      p_gas_co2 = S_gas_co2*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
//Q_gas = k_p * (P_gas - P_atm)
      Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq/FeedMix_In.Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
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
      Digestate_Out.S_co3 = S_co3;
      Digestate_Out.S_co2 = S_co2;
      Digestate_Out.S_h = S_h;
      Digestate_Out.S_oh = S_oh;
      Digestate_Out.S_nh3 = S_nh3;
      Digestate_Out.S_nh4 = S_nh4;
      Digestate_Out.S_h3po4 = S_h3po4;
      Digestate_Out.S_h2po4 = S_h2po4;
      Digestate_Out.S_hpo4 = S_hpo4;
      Digestate_Out.S_po4 = S_po4;
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
      COD_balance_in = FeedMix_In.Q*(S_aa_in + S_ac_in + S_bu_in + S_ch4_in + S_fa_in + S_h2_in + S_i_in + S_pro_in + S_su_in + S_va_in + X_aa_in + X_ac_in + X_c4_in + X_fa_in + X_h2_in + X_pro_in + X_su_in + X_ch_in + X_c_in + X_i_in + X_li_in + X_pr_in);
      COD_balance_out = Digestate_Out.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/(P_gas - p_gas_h2o)/(R/64*273.15/1.01325) + p_gas_h2/(P_gas - p_gas_h2o)/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
      24*3600*der(V_in_cum) = FeedMix_In.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = FeedMix_In.Q*(S_ic_in + C_xc*X_c_in + C_si*S_i_in + C_xi*X_i_in + C_ch*X_ch_in + C_pr*X_pr_in + C_li*X_li_in + C_su*S_su_in + C_aa*S_aa_in + C_fa*S_fa_in + C_va*S_va_in + C_bu*S_bu_in + C_pro*S_pro_in + C_ac*S_ac_in + C_ch4*S_ch4_in + C_bac*(X_su_in + X_aa_in + X_fa_in + X_c4_in + X_pro_in + X_ac_in + X_h2_in));
      IC_balance_out = Digestate_Out.Q*(S_ic + C_si*S_i + C_xi*X_i + C_ch*X_ch + C_pr*X_pr + C_li*X_li + C_su*S_su + C_aa*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + C_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)) "+C_xc * X_c";
      IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/(P_gas - p_gas_h2o)/(R/64*273.15/1.01325) + p_gas_co2/(P_gas - p_gas_h2o)/R/273.15*1.01325);
      24*3600*der(IC_balance_in_cum) = IC_balance_in;
      24*3600*der(IC_balance_out_cum) = IC_balance_out;
      24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = FeedMix_In.Q*(S_in_in + N_xc*X_c_in + N_i*(S_i_in + X_i_in) + N_aa*(S_aa_in + X_pr_in) + N_bac*(X_su_in + X_aa_in + X_fa_in + X_c4_in + X_pro_in + X_ac_in + X_h2_in));
      IN_balance_out = Digestate_Out.Q*(S_in + N_i*(S_i + X_i) + N_aa*(S_aa + X_pr) + N_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru);
      24*3600*der(IN_balance_in_cum) = IN_balance_in;
      24*3600*der(IN_balance_out_cum) = IN_balance_out;
//Inorganic Phosforous Balance
      IP_balance_in = FeedMix_In.Q*(S_ip_in + P_i*(S_i_in + X_i_in) + P_li*X_li_in + P_bac*(X_su_in + X_aa_in + X_fa_in + X_c4_in + X_pro_in + X_ac_in + X_h2_in));
      IP_balance_out = Digestate_Out.Q*(S_ip + P_i*(S_i + X_i) + P_li*X_li + P_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru);
      24*3600*der(IP_balance_in_cum) = IP_balance_in;
      24*3600*der(IP_balance_out_cum) = IP_balance_out;
      24*3600*der(Vcum) = FeedMix_In.Q;
//Outputs
//T_op = OutF[1];
      FeedMix_In.Q = OutF[1];
      S_ip = OutF[2];
      S_ic = OutF[3];
      S_in = OutF[4];
      S_va = OutF[5];
      S_bu = OutF[6];
      S_pro = OutF[7];
      S_ac = OutF[8];
      S_cat = OutF[9];
      S_an = OutF[10];
      S_ca = OutF[11];
      S_mg = OutF[12];
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
    end Fermenter;

    model pH_AE_base
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.StateVariablesADM1_pc;
      extends ADM1_P.StateVariablesADM1_mpp;
      Modelica.Blocks.Interfaces.RealOutput Out[22] annotation(
        Placement(visible = true, transformation(origin = {56, -46}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {88, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput In[13] annotation(
        Placement(visible = true, transformation(origin = {72, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-82, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      //Inputs from biological
      //  Real T_op = 35 + 273.15;
      //  Real Q = 190;
      //  Real S_ip = 0.09 - 2*X_acp - X_stru;
      //  Real S_ic = 0.03;
      //  Real S_in = 0.02 - X_stru;
      //  Real S_va = 0;
      //  Real S_bu = 0;
      //  Real S_pro = 0;
      //  Real S_ac = 0;
      //  Real S_cat_in = 0.1;
      //  Real S_an_in = 1e-6;
      //  Real S_ca_in = 0.007;
      //  Real S_mg_in = 0.013;
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
      //Da non calcolare qui
      Real X_stru;
      Real X_acp;
      Real S_ca;
      Real S_mg;
      Real S_cat;
      Real S_an;
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
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//I calculation
      I = 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv));
//Activitites calculation = f(S_tot,i)
      a_h = g_mono*S_h;
      a_ca = g_bi*S_ca;
      a_mg = g_bi*S_mg;
      a_nh4 = a_h/Ka_nh4*S_in/(1 + a_h/(Ka_nh4*g_mono));
      a_hco3 = Ka_co2/a_h*S_ic/(1 + Ka_co2/(a_h*g_mono));
      a_co3 = S_ic*a_h*Ka_co2*Ka_hco3/(a_h^3 + Ka_co2*Ka_hco3*a_h/g_bi + Ka_co2*a_h^2/g_mono);
      a_hpo4 = S_ip*a_h*Ka_h3po4*Ka_h2po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_po4 = S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_h2po4 = S_ip*a_h^2*Ka_h3po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_acm = S_ac/Ac_conv*a_h^2*Ka_ac/(a_h^3 + Ka_ac*a_h^2/g_mono);
      a_prom = S_pro/Pro_conv*a_h^2*Ka_pro/(a_h^3 + Ka_pro*a_h^2/g_mono);
      a_bum = S_bu/Bu_conv*a_h^2*Ka_bu/(a_h^3 + Ka_bu*a_h^2/g_mono);
      a_vam = S_va/Va_conv*a_h^2*Ka_va/(a_h^3 + Ka_va*a_h^2/g_mono);
      a_oh = Ka_h2o*convKa*a_h2o/a_h;
//Concentration calculation
      S_nh4 = a_nh4/g_mono;
      S_hco3 = a_hco3/g_mono;
      S_hpo4 = a_hpo4/g_bi;
      S_po4 = a_po4/g_tri;
      S_h2po4 = a_h2po4/g_mono;
      S_co3 = a_co3/g_bi;
      S_acm = a_acm/g_mono*Ac_conv;
      S_prom = a_prom/g_mono*Pro_conv;
      S_bum = a_bum/g_mono*Bu_conv;
      S_vam = a_vam/g_mono*Va_conv;
      S_oh = a_oh/g_mono;
//MPP submodel
      Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
      Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
      SI_acp = log(a_ca^3*a_po4^2/Ksp_acp);
//SI_stru = if noEvent(a_nh4*a_po4*a_mg > Ksp_stru) then 1.0 else -1.0;
      SI_stru = log(a_nh4*a_po4*a_mg/Ksp_stru);
//rp1=0;
      rp1 = (1 + sign(SI_acp))/2*kcryst_acp*X_acp*((a_ca^3*a_po4^2/Ksp_acp)^(1/5) - 1)^2;
//rp2=0;
      rp2 = (1 + sign(SI_stru))/2*kcryst_stru*X_stru*((a_nh4*a_po4*a_mg/Ksp_stru)^(1/3) - 1)^3;
      rd2 = (1 - sign(SI_stru))/2*kcryst_stru*X_stru*((a_nh4*a_po4*a_mg/Ksp_stru)^(1/3) - 1)^2;
      rd1 = (1 - sign(SI_acp))/2*kcryst_acp*X_acp*((a_ca^3*a_po4^2/Ksp_acp)^(1/5) - 1)^2;
//rd1 = 0;
//rd2 = 0;
      24*3600*der(X_acp) = Q/V_liq*(-X_acp) + rp1 - rd1;
      24*3600*der(X_stru) = Q/V_liq*(-X_stru) + rp2 - rd2;
      Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
      SI_ccm = log(a_ca*a_co3/Ksp_ccm)/abs(log(a_ca*a_co3/Ksp_ccm));
//rp3 = if noEvent(X_ccm<0 and SI_ccm<0) then 0.0 else kcryst_ccm * abs(X_ccm) * ((a_ca * a_co3 / Ksp_ccm) ^ (1 / 2) - 1) ^ 2 * SI_ccm;
      rp3 = 0;
      rd3 = 0;
      24*3600*der(X_ccm) = Q/V_liq*(-X_ccm) + rp3 - rd3;
//Acid-base dynamics
      ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
      ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
      ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
      ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
      ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h) - Ka_co2*S_ic);
      ra11 = k_AB_IN*(S_nh3*(Ka_nh4 + S_h) - Ka_nh4*S_in);
      ra12 = k_AB_IP*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h) - Ka_h2po4*S_ip);
      ra13 = k_AB_IP*(S_po4*(Ka_hpo4 + S_h + S_h^2/Ka_h2po4) - Ka_hpo4*S_ip);
//Cations and anions
      24*3600*der(S_cat) = Q/V_liq*(S_cat_in - S_cat);
      24*3600*der(S_ca) = Q/V_liq*(S_ca_in - S_ca) - 3*(rp1 - rd1) - (rp3 - rd3);
      24*3600*der(S_mg) = Q/V_liq*(S_mg_in - S_mg) - (rp2 - rd2);
      24*3600*der(S_an) = Q/V_liq*(S_an_in - S_an);
//24 * 3600 * der(S_vam) = -ra4;
//24 * 3600 * der(S_bum) = -ra5;
//24 * 3600 * der(S_prom) = -ra6;
//24 * 3600 * der(S_acm) = -ra7;
//24 * 3600 * der(S_hco3) = -ra10;
//24 * 3600 * der(S_nh3) = -ra11;
//24 * 3600 * der(S_hpo4) = -ra12;
//24 * 3600 * der(S_po4) = -ra13;
      S_nh3 = S_in - S_nh4;
      S_co2 = S_ic - S_hco3 - S_co3;
//S_oh = Ka_h2o * convKa / S_h;
      S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
//S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
      Theta = S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/Ac_conv - S_prom/Pro_conv - S_bum/Bu_conv - S_vam/Va_conv - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3;
//Theta=0;
//der(S_h)=100000000*(Theta-S_h);
      charge = Theta + S_h - S_oh;
      S_h = S_oh - Theta;
      pH = -log10(S_h);
//Outputs
      Out[1] = pH;
      Out[2] = S_cat;
      Out[3] = S_an;
      Out[4] = S_ca;
      Out[5] = S_mg;
      Out[6] = S_vam;
      Out[7] = S_bum;
      Out[8] = S_prom;
      Out[9] = S_acm;
      Out[10] = S_hco3;
      Out[11] = S_nh3;
      Out[12] = S_hpo4;
      Out[13] = S_po4;
      Out[14] = S_nh4;
      Out[15] = S_co2;
      Out[16] = S_oh;
      Out[17] = S_h;
      Out[18] = S_h2po4;
      Out[19] = rp1;
      Out[20] = rp2;
      Out[21] = X_acp;
      Out[22] = X_stru;
      annotation(
        experiment(StartTime = 0, StopTime = 4e+07, Tolerance = 1e-06, Interval = 800),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end pH_AE_base;

    model Multiple_pH
      pH_AE_base pH_AE1(kcryst_stru = 10*5*(24*60)) annotation(
        Placement(visible = true, transformation(origin = {-50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      pH_AE_base_SI0 pH_AE2(pH_AE_base) annotation(
        Placement(visible = true, transformation(origin = {28, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      pH_AE1.g_mono = 1;
      pH_AE1.g_bi = 1;
      pH_AE1.g_tri = 1;
      pH_AE1.a_h2o = 1;
      pH_AE2.g_mono = 1;
      pH_AE2.g_bi = 1;
      pH_AE2.g_tri = 1;
      pH_AE2.a_h2o = 1;
//Activity coefficients calculation
//  g_mono = 10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I));
//  g_bi = 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I));
//  g_tri = 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I));
//  a_h2o = 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/Va_conv + S_bum/Bu_conv + S_prom/Pro_conv + S_acm/Ac_conv + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//Ideality
//g_mono = 1;
//g_bi = 1;
//g_tri = 1;
//a_h2o = 1;
      annotation(
        experiment(StartTime = 0, StopTime = 4e+07, Tolerance = 1e-06, Interval = 800),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Multiple_pH;

    model pH_batch
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.StateVariablesADM1_pc;
      Modelica.Blocks.Interfaces.RealOutput Out[16] annotation(
        Placement(visible = true, transformation(origin = {56, -46}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {88, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput In[12] annotation(
        Placement(visible = true, transformation(origin = {72, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      //Inputs from biological
      input Real Q;
      input Real S_ip;
      input Real S_ic;
      input Real S_in;
      input Real S_va;
      input Real S_bu;
      input Real S_pro;
      input Real S_ac;
      input Real S_cat;
      input Real S_an;
      input Real S_ca;
      input Real S_mg;
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      parameter Real ideality = 1.0 "True=1.0";
    equation
//Inputs from biological
//Q = In[1];
//S_ip = In[2];
//S_ic = In[3];
//S_in = In[4];
//S_va = In[5];
//S_bu = In[6];
//S_pro = In[7];
//S_ac = In[8];
//S_cat = In[9];
//S_an = In[10];
//S_ca = In[11];
//S_mg = In[12];
//Ideality vs Non-ideality
      g_mono = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_bi = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_tri = if noEvent(ideality) > 0.0 then 1.0 else 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      a_h2o = if noEvent(ideality) > 0.0 then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/Va_conv + S_bum/Bu_conv + S_prom/Pro_conv + S_acm/Ac_conv + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//MPP
//Acidity constants with temperature correction
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//I calculation
      I = 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv));
//Activitites calculation = f(S_tot,i)
      a_h = g_mono*S_h;
      a_ca = g_bi*S_ca;
      a_mg = g_bi*S_mg;
      a_nh4 = a_h/Ka_nh4*S_in/(1 + a_h/(Ka_nh4*g_mono));
      a_hco3 = Ka_co2/a_h*S_ic/(1 + Ka_co2/(a_h*g_mono));
      a_co3 = S_ic*a_h*Ka_co2*Ka_hco3/(a_h^3 + Ka_co2*Ka_hco3*a_h/g_bi + Ka_co2*a_h^2/g_mono);
      a_hpo4 = S_ip*a_h*Ka_h3po4*Ka_h2po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_po4 = S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_h2po4 = S_ip*a_h^2*Ka_h3po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_acm = S_ac/Ac_conv*a_h^2*Ka_ac/(a_h^3 + Ka_ac*a_h^2/g_mono);
      a_prom = S_pro/Pro_conv*a_h^2*Ka_pro/(a_h^3 + Ka_pro*a_h^2/g_mono);
      a_bum = S_bu/Bu_conv*a_h^2*Ka_bu/(a_h^3 + Ka_bu*a_h^2/g_mono);
      a_vam = S_va/Va_conv*a_h^2*Ka_va/(a_h^3 + Ka_va*a_h^2/g_mono);
      a_oh = Ka_h2o*convKa*a_h2o/a_h;
//Concentration calculation
      S_nh4 = a_nh4/g_mono;
      S_hco3 = a_hco3/g_mono;
      S_hpo4 = a_hpo4/g_bi;
      S_po4 = a_po4/g_tri;
      S_h2po4 = a_h2po4/g_mono;
      S_co3 = a_co3/g_bi;
      S_acm = a_acm/g_mono*Ac_conv;
      S_prom = a_prom/g_mono*Pro_conv;
      S_bum = a_bum/g_mono*Bu_conv;
      S_vam = a_vam/g_mono*Va_conv;
      S_oh = a_oh/g_mono;
//Acid-base dynamics
      ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
      ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
      ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
      ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
      ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h) - Ka_co2*S_ic);
      ra11 = k_AB_IN*(S_nh3*(Ka_nh4 + S_h) - Ka_nh4*S_in);
      ra12 = k_AB_IP*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h) - Ka_h2po4*S_ip);
      ra13 = k_AB_IP*(S_po4*(Ka_hpo4 + S_h + S_h^2/Ka_h2po4) - Ka_hpo4*S_ip);
//Cations and anions
//24 * 3600 * der(S_vam) = -ra4;
//24 * 3600 * der(S_bum) = -ra5;
//24 * 3600 * der(S_prom) = -ra6;
//24 * 3600 * der(S_acm) = -ra7;
//24 * 3600 * der(S_hco3) = -ra10;
//24 * 3600 * der(S_nh3) = -ra11;
//24 * 3600 * der(S_hpo4) = -ra12;
//24 * 3600 * der(S_po4) = -ra13;
      S_nh3 = S_in - S_nh4;
      S_co2 = S_ic - S_hco3 - S_co3;
//S_oh = Ka_h2o * convKa / S_h;
      S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
      Theta = S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/Ac_conv - S_prom/Pro_conv - S_bum/Bu_conv - S_vam/Va_conv - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3;
//Theta=0;
//der(S_h)=100000000*(Theta-S_h);
      charge = Theta + S_h - S_oh;
      S_h = S_oh - Theta;
      pH = -log10(a_h);
//Outputs
      Out[1] = pH;
      Out[2] = S_vam;
      Out[3] = S_bum;
      Out[4] = S_prom;
      Out[5] = S_acm;
      Out[6] = S_hco3;
      Out[7] = S_nh3;
      Out[8] = S_hpo4;
      Out[9] = S_po4;
      Out[10] = S_nh4;
      Out[11] = S_co2;
      Out[12] = S_oh;
      Out[13] = S_h;
      Out[14] = S_h2po4;
      Out[15] = S_co3;
      Out[16] = S_h3po4;
      annotation(
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end pH_batch;

    model MPP_testalone
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.StateVariablesADM1_mpp;
      //Inputs from biological
      Real a_ca(fixed = true, start = 0.007);
      Real a_co3(fixed = true, start = 0.001);
      Real a_mg(fixed = true, start = 0.013);
      Real a_po4(fixed = true, start = 3.8e-8, nominal = 1e-12);
      Real a_nh4(fixed = true, start = 0.05);
      Real T_op;
      Real Q;
      Real arg_log_acp;
      Real arg_log_stru;
    equation
      arg_log_acp = max(1e-16, a_ca^3*a_po4^2/Ksp_acp);
      arg_log_stru = max(1e-16, a_nh4*a_po4*a_mg/Ksp_stru);
      24*3600*der(a_ca) = Q/V_liq*0.007 - 3*rp1*24*60 + 3*rd1*24*60;
      24*3600*der(a_co3) = Q/V_liq*0.001;
      24*3600*der(a_mg) = Q/V_liq*0.013 - rp2*24*60 + rd2*24*60;
      24*3600*der(a_po4) = Q/V_liq*3.8e-5 - rp2*24*60 - 2*rp1*24*60 + rd2*24*60 + 2*rd1*24*60;
      24*3600*der(a_nh4) = Q/V_liq*0.1 - rp2*24*60 + rd2*24*60;
      T_op = 35 + 273.15;
      Q = 0;
//Inputs from biological
//MPP
      Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
      Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
      SI_acp = log(arg_log_acp);
//SI_stru = if noEvent(a_nh4*a_po4*a_mg > Ksp_stru) then 1.0 else -1.0;
      SI_stru = log(arg_log_stru);
      Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
      SI_ccm = log(a_ca*a_co3/Ksp_ccm)/abs(log(a_ca*a_co3/Ksp_ccm));
//rp1=0;
//rp2 = 0;
      rp1 = (1 + sign(SI_acp))/2*kcryst_acp/(24*60*1000000)*X_acp*((exp(SI_acp))^(1/5) - 1)^2;
      rp2 = (1 + sign(SI_stru))/2*kcryst_stru/(24*60*1000000)*X_stru*((exp(SI_stru))^(1/3) - 1)^3;
      rd1 = (1 - sign(SI_acp))/2*kcryst_acp/(24*60*1000000)*X_acp*((exp(SI_acp))^(1/5) - 1)^2;
      rd2 = -(1 - sign(SI_stru))/2*kcryst_stru/(24*60*1000000)*X_stru*((exp(SI_stru))^(1/3) - 1)^3;
//  rd1 = 0;
//  rd2 = 0;
      24*3600*der(X_acp) = Q/V_liq*(-X_acp) + rp1*24*60 - rd1*24*60;
      24*3600*der(X_stru) = Q/V_liq*(-X_stru) + rp2*24*60 - rd2*24*60;
//rp3 = if noEvent(X_ccm<0 and SI_ccm<0) then 0.0 else kcryst_ccm * abs(X_ccm) * ((a_ca * a_co3 / Ksp_ccm) ^ (1 / 2) - 1) ^ 2 * SI_ccm;
      rp3 = 0;
      rd3 = 0;
      24*3600*der(X_ccm) = Q/V_liq*(-X_ccm) + rp3 - rd3;
//
//Outputs
      annotation(
        experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 0.2),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end MPP_testalone;

    model pH_submodel
      pH_batch pH_batch_ annotation(
        Placement(visible = true, transformation(origin = {4, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable pH_Inputs(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_pH.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_pH", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-56, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Probe_T probe_T annotation(
        Placement(visible = true, transformation(origin = {-48, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      pH_batch_.Q = pH_batch_.In[1];
      pH_batch_.S_ip = pH_batch_.In[2];
      pH_batch_.S_ic = pH_batch_.In[3];
      pH_batch_.S_in = pH_batch_.In[4];
      pH_batch_.S_va = pH_batch_.In[5];
      pH_batch_.S_bu = pH_batch_.In[6];
      pH_batch_.S_pro = pH_batch_.In[7];
      pH_batch_.S_ac = pH_batch_.In[8];
      pH_batch_.S_cat = pH_batch_.In[9];
      pH_batch_.S_an = pH_batch_.In[10];
      pH_batch_.S_ca = pH_batch_.In[11];
      pH_batch_.S_mg = pH_batch_.In[12];
//  Real T_op = 35 +273.15;
//  Real Q = 190;
//  Real S_ip = 0.0245873 "0.0245876; non-ideal 0.0245873";
//  Real S_ic = 0.0681754 "0.0705643; 0.0681753";
//  Real S_in = 0.0638248 "0.0638276; 0.0638248";
//  Real S_va = 0.00566393 "0.00566393; 0.00566393";
//  Real S_bu = 0.00864898 "0.00864898; 0.00860289";
//  Real S_pro = 0.0411192 "0.0411192;";
//  Real S_ac = 0.0482464 "0.0601097; 0.0482464";
//  Real S_cat = -0.00451935 "";
//  Real S_an = 1.72667e-10 "3.4e-11; 1.72667e-10";
//  Real S_ca = 0.007 "";
//  Real S_mg = 0.013 "";
      connect(pH_Inputs.y, pH_batch_.In) annotation(
        Line(points = {{-44, -4}, {-4, -4}}, color = {0, 0, 127}, thickness = 0.5));
      connect(probe_T.y_T, pH_batch_.T_op) annotation(
        Line(points = {{-38, -42}, {-4, -42}, {-4, -8}}, color = {0, 0, 127}));
      annotation(
        experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 2400),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end pH_submodel;

    model MPP_
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_conversion;
      extends ADM1_P.StateVariablesADM1_mpp;
      //Inputs from biological
      input Real a_ca;
      input Real a_co3;
      input Real a_mg;
      input Real a_po4;
      input Real a_nh4;
      input Real T_op;
      input Real Q;
    equation
      arg_log_acp = max(1e-16, a_ca^3*a_po4^2/Ksp_acp);
      arg_log_stru = max(1e-16, a_nh4*a_po4*a_mg/Ksp_stru);
//   24*3600*der(a_ca) = Q/V_liq*0.007 - 3*rp1*24*60 + 3*rd1*24*60;
//   24*3600*der(a_co3) = Q/V_liq*0.001;
//   24*3600*der(a_mg) = Q/V_liq*0.013 - rp2*24*60 + rd2*24*60;
//   24*3600*der(a_po4) = Q/V_liq*3.8e-5 - rp2*24*60 -2*rp1*24*60 + rd2*24*60 + 2*rd1*24*60;
//   24*3600*der(a_nh4) = Q/V_liq*0.1 - rp2*24*60 + rd2*24*60;
//   T_op = 35 + 273.15;
//   Q = 0;
//Inputs from biological
//MPP
      Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
      Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
      SI_acp = log(arg_log_acp);
//SI_stru = if noEvent(a_nh4*a_po4*a_mg > Ksp_stru) then 1.0 else -1.0;
      SI_stru = log(arg_log_stru);
      Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
      SI_ccm = log(a_ca*a_co3/Ksp_ccm)/abs(log(a_ca*a_co3/Ksp_ccm));
//rp1=0;
//rp2 = 0;
      rp1 = (1 + sign(SI_acp))/2*kcryst_acp/(24*60)*X_acp*((exp(SI_acp))^(1/5) - 1)^2;
      rp2 = (1 + sign(SI_stru))/2*kcryst_stru/(24*60)*X_stru*((exp(SI_stru))^(1/3) - 1)^3;
      rd1 = (1 - sign(SI_acp))/2*kcryst_acp/(24*60)*X_acp*((exp(SI_acp))^(1/5) - 1)^2;
      rd2 = -(1 - sign(SI_stru))/2*kcryst_stru/(24*60)*X_stru*((exp(SI_stru))^(1/3) - 1)^3;
//rd1 = 0;
//rd2 = 0;
      24*3600*der(X_acp) = Q/V_liq*(-X_acp) + rp1*24*60 - rd1*24*60;
      24*3600*der(X_stru) = Q/V_liq*(-X_stru) + rp2*24*60 - rd2*24*60;
//rp3 = if noEvent(X_ccm<0 and SI_ccm<0) then 0.0 else kcryst_ccm * abs(X_ccm) * ((a_ca * a_co3 / Ksp_ccm) ^ (1 / 2) - 1) ^ 2 * SI_ccm;
      rp3 = 0;
      rd3 = 0;
      24*3600*der(X_ccm) = Q/V_liq*(-X_ccm) + rp3 - rd3;
//
//Outputs
      annotation(
        experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 0.2),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end MPP_;

    model Probe_T_
      extends ADM1_P.Icons.ProbeT;
      Modelica.Blocks.Interfaces.RealOutput y_T annotation(
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Input_T annotation(
        Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
      Input_T = y_T;
    end Probe_T_;
  end BlockLibrary;

  class Cremona
    ADM1_P.BlockLibrary.Feed_Source_1 CattleManure annotation(
      Placement(visible = true, transformation(origin = {-126, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_3 MaizeSilage annotation(
      Placement(visible = true, transformation(origin = {-120, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester digester(ideality = 1.0, V_liq=3350*4, V_gas = (26^2*7*3.14/4)*4-3350*4, T_op_mean=316.15) annotation(
      Placement(visible = true, transformation(origin = {7, 15}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {54, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Literature_Input_CattleSlurry.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-186, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_2 CattleSlurry annotation(
      Placement(visible = true, transformation(origin = {-128, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_MaizeSilage(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Literature_Input_MaizeSilage.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-188, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleManure(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Literature_Input_CattleManure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-186, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Probe_T_ probe_T_ annotation(
      Placement(visible = true, transformation(origin = {-30, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Cremona_Input_T.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-70, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  equation
//CattleSlurry
    CattleSlurry.Inflow[1] = CattleSlurry.Flow_in;
    CattleSlurry.Inflow[2] = CattleSlurry.TS_in;
    CattleSlurry.Inflow[3] = CattleSlurry.VS_in;
    CattleSlurry.Inflow[4] = CattleSlurry.pH_in;
    CattleSlurry.Inflow[5] = CattleSlurry.Alk_in;
    CattleSlurry.Inflow[6] = CattleSlurry.Ammonium_in;
    CattleSlurry.Inflow[7] = CattleSlurry.Fosfates_in;
    CattleSlurry.Inflow[8] = CattleSlurry.Ca_in;
    CattleSlurry.Inflow[9] = CattleSlurry.Mg_in;
    CattleSlurry.Inflow[10] = CattleSlurry.ac_in;
    CattleSlurry.Inflow[11] = CattleSlurry.pro_in;
    CattleSlurry.Inflow[12] = CattleSlurry.bu_in;
    CattleSlurry.Inflow[13] = CattleSlurry.va_in;
    CattleSlurry.Inflow[14] = CattleSlurry.Ssu_in;
    CattleSlurry.Inflow[15] = CattleSlurry.Saa_in;
    CattleSlurry.Inflow[16] = CattleSlurry.Sfa_in;
    CattleSlurry.Inflow[17] = CattleSlurry.Si_in;
    CattleSlurry.Inflow[18] = CattleSlurry.tBMP_VS_in;
    CattleSlurry.Inflow[19] = CattleSlurry.Xi_in;
    CattleSlurry.Inflow[20] = CattleSlurry.Xpr_in;
    CattleSlurry.Inflow[21] = CattleSlurry.Xli_in;
    CattleSlurry.Inflow[22] = CattleSlurry.Xch_in;
//MaizeSilage
    MaizeSilage.Inflow[1] = MaizeSilage.Flow_in;
    MaizeSilage.Inflow[2] = MaizeSilage.TS_in;
    MaizeSilage.Inflow[3] = MaizeSilage.VS_in;
    MaizeSilage.Inflow[4] = MaizeSilage.pH_in;
    MaizeSilage.Inflow[5] = MaizeSilage.Alk_in;
    MaizeSilage.Inflow[6] = MaizeSilage.Ammonium_in;
    MaizeSilage.Inflow[7] = MaizeSilage.Fosfates_in;
    MaizeSilage.Inflow[8] = MaizeSilage.Ca_in;
    MaizeSilage.Inflow[9] = MaizeSilage.Mg_in;
    MaizeSilage.Inflow[10] = MaizeSilage.ac_in;
    MaizeSilage.Inflow[11] = MaizeSilage.pro_in;
    MaizeSilage.Inflow[12] = MaizeSilage.bu_in;
    MaizeSilage.Inflow[13] = MaizeSilage.va_in;
    MaizeSilage.Inflow[14] = MaizeSilage.Ssu_in;
    MaizeSilage.Inflow[15] = MaizeSilage.Saa_in;
    MaizeSilage.Inflow[16] = MaizeSilage.Sfa_in;
    MaizeSilage.Inflow[17] = MaizeSilage.Si_in;
    MaizeSilage.Inflow[18] = MaizeSilage.tBMP_VS_in;
    MaizeSilage.Inflow[19] = MaizeSilage.Xi_in;
    MaizeSilage.Inflow[20] = MaizeSilage.Xpr_in;
    MaizeSilage.Inflow[21] = MaizeSilage.Xli_in;
    MaizeSilage.Inflow[22] = MaizeSilage.Xch_in;
//CattleManure
    CattleManure.Inflow[1] = CattleManure.Flow_in;
    CattleManure.Inflow[2] = CattleManure.TS_in;
    CattleManure.Inflow[3] = CattleManure.VS_in;
    CattleManure.Inflow[4] = CattleManure.pH_in;
    CattleManure.Inflow[5] = CattleManure.Alk_in;
    CattleManure.Inflow[6] = CattleManure.Ammonium_in;
    CattleManure.Inflow[7] = CattleManure.Fosfates_in;
    CattleManure.Inflow[8] = CattleManure.Ca_in;
    CattleManure.Inflow[9] = CattleManure.Mg_in;
    CattleManure.Inflow[10] = CattleManure.ac_in;
    CattleManure.Inflow[11] = CattleManure.pro_in;
    CattleManure.Inflow[12] = CattleManure.bu_in;
    CattleManure.Inflow[13] = CattleManure.va_in;
    CattleManure.Inflow[14] = CattleManure.Ssu_in;
    CattleManure.Inflow[15] = CattleManure.Saa_in;
    CattleManure.Inflow[16] = CattleManure.Sfa_in;
    CattleManure.Inflow[17] = CattleManure.Si_in;
    CattleManure.Inflow[18] = CattleManure.tBMP_VS_in;
    CattleManure.Inflow[19] = CattleManure.Xi_in;
    CattleManure.Inflow[20] = CattleManure.Xpr_in;
    CattleManure.Inflow[21] = CattleManure.Xli_in;
    CattleManure.Inflow[22] = CattleManure.Xch_in;
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{18.5, 34}, {18.5, 56}, {46, 56}}));
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
    connect(CattleManure.Feed_Out, feeding_Tank.Manure_In) annotation(
      Line(points = {{-118, 50}, {-82, 50}, {-82, 30}}));
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-50, 17}, {-12, 17}, {-12, 26}}));
    connect(feeding_Tank.Fractions_Out, digester.Fractions_In) annotation(
      Line(points = {{-50, 13}, {-30, 13}, {-30, 6}, {-12, 6}}, color = {0, 0, 127}, thickness = 0.5));
    connect(MaizeSilage.Feed_Out, feeding_Tank.MaizeSilage_In) annotation(
      Line(points = {{-112, -12}, {-82, -12}, {-82, 4}}));
    connect(Input_CattleSlurry.y, CattleSlurry.Inflow) annotation(
      Line(points = {{-174, 20}, {-136, 20}, {-136, 18}}, color = {0, 0, 127}, thickness = 0.5));
    connect(CattleSlurry.Feed_Out, feeding_Tank.Slurry_In) annotation(
      Line(points = {{-120, 16}, {-82, 16}, {-82, 20}}));
    connect(Input_MaizeSilage.y, MaizeSilage.Inflow) annotation(
      Line(points = {{-176, -10}, {-128, -10}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Input_CattleManure.y, CattleManure.Inflow) annotation(
      Line(points = {{-174, 52}, {-134, 52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(probe_T_.y_T, digester.T_op) annotation(
      Line(points = {{-20, -42}, {-12, -42}, {-12, 0}}, color = {0, 0, 127}));
    connect(temperature.y[1], probe_T_.Input_T) annotation(
      Line(points = {{-64, -44}, {-38, -44}, {-38, -48}}, color = {0, 0, 127}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 240),
      Diagram);
  end Cremona;

  package Types
    type FlowRate_d = Real(final quantity = "Daily flow rate", final unit = "m3/d", final displayUnit = "m3/d");
    type Kinetic_s = Real(final quantity = "Inverse time-second", final unit = "1/s", final displayUnit = "1/s", min = 0);
    type Kinetic_d = Real(final quantity = "Inverse time-day", final unit = "1/d", final displayUnit = "1/d", min = 0);
    type MassConcRate = Real(final quantity = "COD concentration per unit time", final unit = "kg/(m3.s)", final displayUnit = "kg/(m3.d)");
    type MolConcRate = Real(final quantity = "Molar concentration per unit time", final unit = "kmol/(m3.d)", final displayUnit = "kmol/(m3.d)");
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

  model Multiple_SM
    //  SynopticModel synopticModel1(digester.V_liq = 3350*4,digester.V_gas = ((26^2*7*3.14/4)*4-3350*4), digester.ideality = 0.0) annotation(
    //      Placement(visible = true, transformation(origin = {-58, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM2_ bsm2_(digester.V_liq = 3400) annotation(
      Placement(visible = true, transformation(origin = {-48, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM2_ bsm2_1(digester.V_liq = 2000) annotation(
      Placement(visible = true, transformation(origin = {14, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-08, Interval = 500.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", idaSensitivity = "()"));
  end Multiple_SM;

  class SynopticModel_
    ADM1_P.BlockLibrary.Feed_Source_1 CattleManure annotation(
      Placement(visible = true, transformation(origin = {-126, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_2 CattleSlurry annotation(
      Placement(visible = true, transformation(origin = {-116, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_3 MaizeSilage annotation(
      Placement(visible = true, transformation(origin = {-120, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1_P.BlockLibrary.Fermenter digester annotation(
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
    BlockLibrary.pH_batch pH_batch_ annotation(
      Placement(visible = true, transformation(origin = {6, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.MPP_ mpp_ annotation(
      Placement(visible = true, transformation(origin = {78, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{18.5, 34}, {18.5, 56}, {46, 56}}));
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
    connect(digester.T_op, Probe_T.y_T) annotation(
      Line(points = {{-11.5, 0}, {-19, 0}, {-19, -18}}, color = {0, 0, 127}));
    connect(digester.InF, pH_batch_.Out) annotation(
      Line(points = {{-2, -6}, {0, -6}, {0, -26}, {34, -26}, {34, -50}, {14, -50}}, color = {0, 0, 127}, thickness = 0.5));
    connect(digester.OutF, pH_batch_.In) annotation(
      Line(points = {{18, -8}, {18, -34}, {-26, -34}, {-26, -46}, {-2, -46}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Probe_T.y_T, pH_batch_.T_op) annotation(
      Line(points = {{-18, -18}, {-14, -18}, {-14, -50}, {-2, -50}}, color = {0, 0, 127}));
    pH_batch_.Q = digester.FeedMix_In.Q;
    pH_batch_.S_ip = pH_batch_.In[2];
    pH_batch_.S_ic = pH_batch_.In[3];
    pH_batch_.S_in = pH_batch_.In[4];
    pH_batch_.S_va = pH_batch_.In[5];
    pH_batch_.S_bu = pH_batch_.In[6];
    pH_batch_.S_pro = pH_batch_.In[7];
    pH_batch_.S_ac = pH_batch_.In[8];
    pH_batch_.S_cat = pH_batch_.In[9];
    pH_batch_.S_an = pH_batch_.In[10];
    pH_batch_.S_ca = pH_batch_.In[11];
    pH_batch_.S_mg = pH_batch_.In[12];
    mpp_.T_op = digester.T_op;
    mpp_.Q = digester.FeedMix_In.Q;
    mpp_.a_ca = pH_batch_.a_ca;
    mpp_.a_co3 = pH_batch_.a_co3;
    mpp_.a_mg = pH_batch_.a_mg;
    mpp_.a_po4 = pH_batch_.a_po4;
    mpp_.a_nh4 = pH_batch_.a_nh4;
// mpp_.SI_acp=pH_batch_.SI_acp;
// mpp_.SI_stru=pH_batch_.SI_stru;
// mpp_.SI_ccm=pH_batch_.SI_ccm;
// mpp_.Ksp_acp=pH_batch_.Ksp_acp;
// mpp_.Ksp_stru=pH_batch_.Ksp_stru;
// mpp_.Ksp_ccm=pH_batch_.Ksp_ccm;
    mpp_.rp1*24*60 = digester.rp1;
    mpp_.rd1*24*60 = digester.rd1;
    mpp_.rp2*24*60 = digester.rp2;
    mpp_.rd2*24*60 = digester.rd2;
    mpp_.rp3*24*60 = digester.rp3;
    mpp_.rd3*24*60 = digester.rd3;
    mpp_.X_stru = digester.X_stru;
    mpp_.X_acp = digester.X_acp;
    mpp_.X_ccm = digester.X_ccm;
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts, -d=bltdump",
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 240),
      Diagram);
  end SynopticModel_;

  model Multiple_SM_check
    Modelica.Blocks.Sources.CombiTimeTable Prova(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Prova.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Prova", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-46, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Cremona synopticModel1(digester.ideality = 1) annotation(
      Placement(visible = true, transformation(origin = {-58, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    SynopticModel_ synopticModel2(pH_batch_.ideality = 1) annotation(
      Placement(visible = true, transformation(origin = {-10, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 2400),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", idaSensitivity = "()"));
  end Multiple_SM_check;

  model Feed_test
    Modelica.Blocks.Sources.CombiTimeTable Prova(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Prova.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Prova", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-46, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source CattleSlurry annotation(
      Placement(visible = true, transformation(origin = {20, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    CattleSlurry.TS_in = CattleSlurry.Inflow[2];
    CattleSlurry.Flow_in = CattleSlurry.Inflow[1];
    connect(Prova.y, CattleSlurry.Inflow) annotation(
      Line(points = {{-34, 48}, {13, 48}, {13, 10}}, color = {0, 0, 127}, thickness = 0.5));
  end Feed_test;

  class BSM2
    ADM1_P.BlockLibrary.Digester digester(ideality = 1.0) annotation(
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
    BlockLibrary.Feed_Source_2 Inflow_Flores annotation(
      Placement(visible = true, transformation(origin = {-64, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_Flores(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//CattleSlurry
    Inflow_Flores.Inflow[1] = Inflow_Flores.Flow_in;
    Inflow_Flores.Inflow[2] = Inflow_Flores.TS_in;
    Inflow_Flores.Inflow[3] = Inflow_Flores.VS_in;
    Inflow_Flores.Inflow[4] = Inflow_Flores.pH_in;
    Inflow_Flores.Inflow[5] = Inflow_Flores.Alk_in;
    Inflow_Flores.Inflow[6] = Inflow_Flores.Ammonium_in;
    Inflow_Flores.Inflow[7] = Inflow_Flores.Fosfates_in;
    Inflow_Flores.Inflow[8] = Inflow_Flores.Ca_in;
    Inflow_Flores.Inflow[9] = Inflow_Flores.Mg_in;
    Inflow_Flores.Inflow[10] = Inflow_Flores.ac_in;
    Inflow_Flores.Inflow[11] = Inflow_Flores.pro_in;
    Inflow_Flores.Inflow[12] = Inflow_Flores.bu_in;
    Inflow_Flores.Inflow[13] = Inflow_Flores.va_in;
    Inflow_Flores.Inflow[14] = Inflow_Flores.Ssu_in;
    Inflow_Flores.Inflow[15] = Inflow_Flores.Saa_in;
    Inflow_Flores.Inflow[16] = Inflow_Flores.Sfa_in;
    Inflow_Flores.Inflow[17] = Inflow_Flores.Si_in;
    Inflow_Flores.Inflow[18] = Inflow_Flores.tBMP_VS_in;
    Inflow_Flores.Inflow[19] = Inflow_Flores.Xi_in;
    Inflow_Flores.Inflow[20] = Inflow_Flores.Xpr_in;
    Inflow_Flores.Inflow[21] = Inflow_Flores.Xli_in;
    Inflow_Flores.Inflow[22] = Inflow_Flores.Xch_in;
    digester.f_ch1 = 1;
    digester.f_ch2 = 0;
    digester.f_ch3 = 0;
    digester.f_pr1 = 1;
    digester.f_pr2 = 0;
    digester.f_pr3 = 0;
    digester.f_li1 = 1;
    digester.f_li2 = 0;
    digester.f_li3 = 0;
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{18.5, 34}, {18.5, 56}, {46, 56}}));
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
    connect(digester.T_op, Probe_T.y_T) annotation(
      Line(points = {{-11.5, 0}, {-19, 0}, {-19, -18}}, color = {0, 0, 127}));
    connect(Inflow_Flores.Feed_Out, digester.FeedMix_In) annotation(
      Line(points = {{-56, 10}, {-12, 10}, {-12, 26}}));
    connect(Input_Flores.y, Inflow_Flores.Inflow) annotation(
      Line(points = {{-106, 12}, {-72, 12}}, color = {0, 0, 127}, thickness = 0.5));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 240),
      Diagram);
  end BSM2;

  class BSM2_
    ADM1_P.BlockLibrary.Feed_Source_1 CattleManure annotation(
      Placement(visible = true, transformation(origin = {-126, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_3 MaizeSilage annotation(
      Placement(visible = true, transformation(origin = {-120, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester digester(ideality = 1.0) annotation(
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
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-186, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_2 CattleSlurry annotation(
      Placement(visible = true, transformation(origin = {-128, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_MaizeSilage(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Literature_Input_MaizeSilage.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-188, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleManure(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Literature_Input_CattleManure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-186, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//CattleSlurry > Flores
    CattleSlurry.Inflow[1] = CattleSlurry.Flow_in;
    CattleSlurry.Inflow[2] = CattleSlurry.TS_in;
    CattleSlurry.Inflow[3] = CattleSlurry.VS_in;
    CattleSlurry.Inflow[4] = CattleSlurry.pH_in;
    CattleSlurry.Inflow[5] = CattleSlurry.Alk_in;
    CattleSlurry.Inflow[6] = CattleSlurry.Ammonium_in;
    CattleSlurry.Inflow[7] = CattleSlurry.Fosfates_in;
    CattleSlurry.Inflow[8] = CattleSlurry.Ca_in;
    CattleSlurry.Inflow[9] = CattleSlurry.Mg_in;
    CattleSlurry.Inflow[10] = CattleSlurry.ac_in;
    CattleSlurry.Inflow[11] = CattleSlurry.pro_in;
    CattleSlurry.Inflow[12] = CattleSlurry.bu_in;
    CattleSlurry.Inflow[13] = CattleSlurry.va_in;
    CattleSlurry.Inflow[14] = CattleSlurry.Ssu_in;
    CattleSlurry.Inflow[15] = CattleSlurry.Saa_in;
    CattleSlurry.Inflow[16] = CattleSlurry.Sfa_in;
    CattleSlurry.Inflow[17] = CattleSlurry.Si_in;
    CattleSlurry.Inflow[18] = CattleSlurry.tBMP_VS_in;
    CattleSlurry.Inflow[19] = CattleSlurry.Xi_in;
    CattleSlurry.Inflow[20] = CattleSlurry.Xpr_in;
    CattleSlurry.Inflow[21] = CattleSlurry.Xli_in;
    CattleSlurry.Inflow[22] = CattleSlurry.Xch_in;
//MaizeSilage
    0 = MaizeSilage.Flow_in;
    MaizeSilage.Inflow[2] = MaizeSilage.TS_in;
    MaizeSilage.Inflow[3] = MaizeSilage.VS_in;
    MaizeSilage.Inflow[4] = MaizeSilage.pH_in;
    MaizeSilage.Inflow[5] = MaizeSilage.Alk_in;
    MaizeSilage.Inflow[6] = MaizeSilage.Ammonium_in;
    MaizeSilage.Inflow[7] = MaizeSilage.Fosfates_in;
    MaizeSilage.Inflow[8] = MaizeSilage.Ca_in;
    MaizeSilage.Inflow[9] = MaizeSilage.Mg_in;
    MaizeSilage.Inflow[10] = MaizeSilage.ac_in;
    MaizeSilage.Inflow[11] = MaizeSilage.pro_in;
    MaizeSilage.Inflow[12] = MaizeSilage.bu_in;
    MaizeSilage.Inflow[13] = MaizeSilage.va_in;
    MaizeSilage.Inflow[14] = MaizeSilage.Ssu_in;
    MaizeSilage.Inflow[15] = MaizeSilage.Saa_in;
    MaizeSilage.Inflow[16] = MaizeSilage.Sfa_in;
    MaizeSilage.Inflow[17] = MaizeSilage.Si_in;
    MaizeSilage.Inflow[18] = MaizeSilage.tBMP_VS_in;
    MaizeSilage.Inflow[19] = MaizeSilage.Xi_in;
    MaizeSilage.Inflow[20] = MaizeSilage.Xpr_in;
    MaizeSilage.Inflow[21] = MaizeSilage.Xli_in;
    MaizeSilage.Inflow[22] = MaizeSilage.Xch_in;
//CattleManure
    0 = CattleManure.Flow_in;
    CattleManure.Inflow[2] = CattleManure.TS_in;
    CattleManure.Inflow[3] = CattleManure.VS_in;
    CattleManure.Inflow[4] = CattleManure.pH_in;
    CattleManure.Inflow[5] = CattleManure.Alk_in;
    CattleManure.Inflow[6] = CattleManure.Ammonium_in;
    CattleManure.Inflow[7] = CattleManure.Fosfates_in;
    CattleManure.Inflow[8] = CattleManure.Ca_in;
    CattleManure.Inflow[9] = CattleManure.Mg_in;
    CattleManure.Inflow[10] = CattleManure.ac_in;
    CattleManure.Inflow[11] = CattleManure.pro_in;
    CattleManure.Inflow[12] = CattleManure.bu_in;
    CattleManure.Inflow[13] = CattleManure.va_in;
    CattleManure.Inflow[14] = CattleManure.Ssu_in;
    CattleManure.Inflow[15] = CattleManure.Saa_in;
    CattleManure.Inflow[16] = CattleManure.Sfa_in;
    CattleManure.Inflow[17] = CattleManure.Si_in;
    CattleManure.Inflow[18] = CattleManure.tBMP_VS_in;
    CattleManure.Inflow[19] = CattleManure.Xi_in;
    CattleManure.Inflow[20] = CattleManure.Xpr_in;
    CattleManure.Inflow[21] = CattleManure.Xli_in;
    CattleManure.Inflow[22] = CattleManure.Xch_in;
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{18.5, 34}, {18.5, 56}, {46, 56}}));
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
    connect(CattleManure.Feed_Out, feeding_Tank.Manure_In) annotation(
      Line(points = {{-118, 50}, {-82, 50}, {-82, 30}}));
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-50, 17}, {-12, 17}, {-12, 26}}));
    connect(feeding_Tank.Fractions_Out, digester.Fractions_In) annotation(
      Line(points = {{-50, 13}, {-30, 13}, {-30, 6}, {-12, 6}}, color = {0, 0, 127}, thickness = 0.5));
    connect(MaizeSilage.Feed_Out, feeding_Tank.MaizeSilage_In) annotation(
      Line(points = {{-112, -12}, {-82, -12}, {-82, 4}}));
    connect(digester.T_op, Probe_T.y_T) annotation(
      Line(points = {{-11.5, 0}, {-19, 0}, {-19, -18}}, color = {0, 0, 127}));
    connect(Input_CattleSlurry.y, CattleSlurry.Inflow) annotation(
      Line(points = {{-174, 20}, {-136, 20}, {-136, 18}}, color = {0, 0, 127}, thickness = 0.5));
    connect(CattleSlurry.Feed_Out, feeding_Tank.Slurry_In) annotation(
      Line(points = {{-120, 16}, {-82, 16}, {-82, 20}}));
    connect(Input_MaizeSilage.y, MaizeSilage.Inflow) annotation(
      Line(points = {{-176, -10}, {-128, -10}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Input_CattleManure.y, CattleManure.Inflow) annotation(
      Line(points = {{-174, 52}, {-134, 52}}, color = {0, 0, 127}, thickness = 0.5));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 240),
      Diagram);
  end BSM2_;

  class SAntonio
    extends ADM1_P.ParametersADM1_operational;
    ADM1_P.BlockLibrary.Feed_Source_1 CattleManure annotation(
      Placement(visible = true, transformation(origin = {-162, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_3 MaizeSilage annotation(
      Placement(visible = true, transformation(origin = {-156, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-102, 2}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester digester(ideality = 1.0) annotation(
      Placement(visible = true, transformation(origin = {-29, 1}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {20, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_CH4_perc probe_CH4_perc annotation(
      Placement(visible = true, transformation(origin = {10, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_CO2_perc probe_CO2_perc annotation(
      Placement(visible = true, transformation(origin = {40, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.InitPID.NoInit, k = 1.5, limitsAtInit = true, strict = false, yMax = 10000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {-24, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_P Probe_P annotation(
      Placement(visible = true, transformation(origin = {-104, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_CattleSlurry.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_2 CattleSlurry annotation(
      Placement(visible = true, transformation(origin = {-164, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_MaizeSilage(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_MaizeSilage.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-224, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleManure(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_CattleManure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Probe_T_ probe_T_ annotation(
      Placement(visible = true, transformation(origin = {-68, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_T.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-100, -58}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    ADM1_P.BlockLibrary.PostDigester postDigester annotation(
      Placement(visible = true, transformation(origin = {77, -3}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter gas_Meter annotation(
      Placement(visible = true, transformation(origin = {114, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.InitPID.NoInit, k = 1.5, limitsAtInit = true, strict = false, yMax = 10000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {74, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter gas_Meter1 annotation(
      Placement(visible = true, transformation(origin = {114, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sludge_Discharge sludge_Discharge annotation(
      Placement(visible = true, transformation(origin = {130, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//CattleSlurry > Flores
    CattleSlurry.Inflow[1] = CattleSlurry.Flow_in;
    CattleSlurry.Inflow[2] = CattleSlurry.TS_in;
    CattleSlurry.Inflow[3] = CattleSlurry.VS_in;
    CattleSlurry.Inflow[4] = CattleSlurry.pH_in;
    CattleSlurry.Inflow[5] = CattleSlurry.Alk_in;
    CattleSlurry.Inflow[6] = CattleSlurry.Ammonium_in;
    CattleSlurry.Inflow[7] = CattleSlurry.Fosfates_in;
    CattleSlurry.Inflow[8] = CattleSlurry.Ca_in;
    CattleSlurry.Inflow[9] = CattleSlurry.Mg_in;
    CattleSlurry.Inflow[10] = CattleSlurry.ac_in;
    CattleSlurry.Inflow[11] = CattleSlurry.pro_in;
    CattleSlurry.Inflow[12] = CattleSlurry.bu_in;
    CattleSlurry.Inflow[13] = CattleSlurry.va_in;
    CattleSlurry.Inflow[14] = CattleSlurry.Ssu_in;
    CattleSlurry.Inflow[15] = CattleSlurry.Saa_in;
    CattleSlurry.Inflow[16] = CattleSlurry.Sfa_in;
    CattleSlurry.Inflow[17] = CattleSlurry.Si_in;
    CattleSlurry.Inflow[18] = CattleSlurry.tBMP_VS_in;
    CattleSlurry.Inflow[19] = CattleSlurry.Xi_in;
    CattleSlurry.Inflow[20] = CattleSlurry.Xpr_in;
    CattleSlurry.Inflow[21] = CattleSlurry.Xli_in;
    CattleSlurry.Inflow[22] = CattleSlurry.Xch_in;
//MaizeSilage
    0 = MaizeSilage.Flow_in;
    MaizeSilage.Inflow[2] = MaizeSilage.TS_in;
    MaizeSilage.Inflow[3] = MaizeSilage.VS_in;
    MaizeSilage.Inflow[4] = MaizeSilage.pH_in;
    MaizeSilage.Inflow[5] = MaizeSilage.Alk_in;
    MaizeSilage.Inflow[6] = MaizeSilage.Ammonium_in;
    MaizeSilage.Inflow[7] = MaizeSilage.Fosfates_in;
    MaizeSilage.Inflow[8] = MaizeSilage.Ca_in;
    MaizeSilage.Inflow[9] = MaizeSilage.Mg_in;
    MaizeSilage.Inflow[10] = MaizeSilage.ac_in;
    MaizeSilage.Inflow[11] = MaizeSilage.pro_in;
    MaizeSilage.Inflow[12] = MaizeSilage.bu_in;
    MaizeSilage.Inflow[13] = MaizeSilage.va_in;
    MaizeSilage.Inflow[14] = MaizeSilage.Ssu_in;
    MaizeSilage.Inflow[15] = MaizeSilage.Saa_in;
    MaizeSilage.Inflow[16] = MaizeSilage.Sfa_in;
    MaizeSilage.Inflow[17] = MaizeSilage.Si_in;
    MaizeSilage.Inflow[18] = MaizeSilage.tBMP_VS_in;
    MaizeSilage.Inflow[19] = MaizeSilage.Xi_in;
    MaizeSilage.Inflow[20] = MaizeSilage.Xpr_in;
    MaizeSilage.Inflow[21] = MaizeSilage.Xli_in;
    MaizeSilage.Inflow[22] = MaizeSilage.Xch_in;
//CattleManure
    0 = CattleManure.Flow_in;
    CattleManure.Inflow[2] = CattleManure.TS_in;
    CattleManure.Inflow[3] = CattleManure.VS_in;
    CattleManure.Inflow[4] = CattleManure.pH_in;
    CattleManure.Inflow[5] = CattleManure.Alk_in;
    CattleManure.Inflow[6] = CattleManure.Ammonium_in;
    CattleManure.Inflow[7] = CattleManure.Fosfates_in;
    CattleManure.Inflow[8] = CattleManure.Ca_in;
    CattleManure.Inflow[9] = CattleManure.Mg_in;
    CattleManure.Inflow[10] = CattleManure.ac_in;
    CattleManure.Inflow[11] = CattleManure.pro_in;
    CattleManure.Inflow[12] = CattleManure.bu_in;
    CattleManure.Inflow[13] = CattleManure.va_in;
    CattleManure.Inflow[14] = CattleManure.Ssu_in;
    CattleManure.Inflow[15] = CattleManure.Saa_in;
    CattleManure.Inflow[16] = CattleManure.Sfa_in;
    CattleManure.Inflow[17] = CattleManure.Si_in;
    CattleManure.Inflow[18] = CattleManure.tBMP_VS_in;
    CattleManure.Inflow[19] = CattleManure.Xi_in;
    CattleManure.Inflow[20] = CattleManure.Xpr_in;
    CattleManure.Inflow[21] = CattleManure.Xli_in;
    CattleManure.Inflow[22] = CattleManure.Xch_in;
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{-17.5, 20}, {-17.5, 36}, {12, 36}}));
    connect(Gas_Meter.CH4_perc_exp, probe_CH4_perc.y_CH4) annotation(
      Line(points = {{17, 44}, {10, 44}, {10, 57}}, color = {0, 0, 127}));
    connect(Gas_Meter.CO2_perc_exp, probe_CO2_perc.y_CO2) annotation(
      Line(points = {{23, 44}, {40, 44}, {40, 57}}, color = {0, 0, 127}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{-13, 64}, {-13, 41.25}, {-29, 41.25}, {-29, 24.5}}, color = {0, 0, 127}));
    connect(Probe_P.y_P, PID_Pgas.u_m) annotation(
      Line(points = {{-95, 68}, {-73, 68}, {-73, 52}, {-24, 52}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-36, 64}, {-36, 45.25}, {-32, 45.25}, {-32, 24.5}}, color = {0, 0, 127}));
    connect(CattleManure.Feed_Out, feeding_Tank.Manure_In) annotation(
      Line(points = {{-153.2, 35}, {-117.2, 35}, {-117.2, 15}}));
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-85.72, 3.32}, {-47.72, 3.32}, {-47.72, 12.32}}));
    connect(feeding_Tank.Fractions_Out, digester.Fractions_In) annotation(
      Line(points = {{-85.72, -1.08}, {-65.72, -1.08}, {-65.72, -8.08}, {-47.72, -8.08}}, color = {0, 0, 127}, thickness = 0.5));
    connect(MaizeSilage.Feed_Out, feeding_Tank.MaizeSilage_In) annotation(
      Line(points = {{-147.2, -27}, {-117.2, -27}, {-117.2, -11}}));
    connect(Input_CattleSlurry.y, CattleSlurry.Inflow) annotation(
      Line(points = {{-211, 6}, {-173, 6}, {-173, 4}}, color = {0, 0, 127}, thickness = 0.5));
    connect(CattleSlurry.Feed_Out, feeding_Tank.Slurry_In) annotation(
      Line(points = {{-155.2, 1}, {-117.2, 1}, {-117.2, 5}}));
    connect(Input_MaizeSilage.y, MaizeSilage.Inflow) annotation(
      Line(points = {{-213, -24}, {-165, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Input_CattleManure.y, CattleManure.Inflow) annotation(
      Line(points = {{-211, 38}, {-171, 38}}, color = {0, 0, 127}, thickness = 0.5));
    connect(probe_T_.y_T, digester.T_op) annotation(
      Line(points = {{-58, -50}, {-48, -50}, {-48, -14}}, color = {0, 0, 127}));
    connect(temperature.y[1], probe_T_.Input_T) annotation(
      Line(points = {{-94, -58}, {-76, -58}, {-76, -56}}, color = {0, 0, 127}));
    connect(digester.Digestate_Out, postDigester.FeedMix_In) annotation(
      Line(points = {{-10, -16}, {30, -16}, {30, 6}, {58, 6}}));
    connect(probe_T_.y_T, postDigester.T_op) annotation(
      Line(points = {{-58, -50}, {60, -50}, {60, -16}}, color = {0, 0, 127}));
    connect(feeding_Tank.Fractions_Out, postDigester.Fractions_In) annotation(
      Line(points = {{-86, -2}, {60, -2}, {60, -12}}, color = {0, 0, 127}, thickness = 0.5));
    connect(postDigester.Biogas_Out, gas_Meter1.Biogas_In) annotation(
      Line(points = {{88, 14}, {106, 14}, {106, 36}}));
    connect(limPID.y, postDigester.u) annotation(
      Line(points = {{86, 54}, {88, 54}, {88, 18}, {78, 18}}, color = {0, 0, 127}));
    connect(limPID.u_s, postDigester.P_gas) annotation(
      Line(points = {{62, 54}, {62, 28}, {74, 28}, {74, 18}}, color = {0, 0, 127}));
    connect(Probe_P.y_P, limPID.u_m) annotation(
      Line(points = {{-94, 68}, {-58, 68}, {-58, 88}, {54, 88}, {54, 36}, {74, 36}, {74, 42}}, color = {0, 0, 127}));
    connect(probe_CO2_perc.y_CO2, gas_Meter1.CO2_perc_exp) annotation(
      Line(points = {{40, 58}, {116, 58}, {116, 44}}, color = {0, 0, 127}));
    connect(probe_CH4_perc.y_CH4, gas_Meter1.CH4_perc_exp) annotation(
      Line(points = {{10, 58}, {112, 58}, {112, 44}}, color = {0, 0, 127}));
    connect(postDigester.Digestate_Out, sludge_Discharge.Digestate_In) annotation(
      Line(points = {{94, -18}, {122, -18}, {122, -20}}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 240),
      Diagram);
  end SAntonio;

  model Multiple_SAntonio
    SAntonio_ sAntonio(digester.V_liq = 1350*2, digester.V_gas = (1527 - 1350)*2, digester.ideality = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-16, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.SAntonio_ sAntonio2(digester.V_liq = 1350*4, digester.V_gas = (1527 - 1350)*4, digester.ideality = 0.0) annotation(
      Placement(visible = true, transformation(origin = {22, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Ciocca biogas plant (originally 600 kWe, now 1 MWe)
    //2 parallel fermenters (H=6 m, D=18m, Vtot=1527 m3, Hutile=5.3m)
    //1 post-fermenter (H=6 m, D=30m, Vtot=4241 m3, Hutile=5.3m). Hactual=4.5 m
    //additional: fermenter 27 cm wall with 8 cm insulation (reinforced concrete ceiling)
    //additional: postfermenter 30 cm wall with 5 cm insulation (plastic ceiling)
    //Matteo: 1800 m3/vasca, 12 km3 biogas. 48 ton/d palabili (16 ton/d letame, 8 ton/d foglie mais, 2 ton/d tutoli granella, 4 ton/d semola umida, 20 ton/d silosorgo)+130 m3/d liquame
    //Ricetta in base a quello che si trova sul terrotorio es. no semola? Più liquame, stesso OLR ma meno HRT. Palabili pressati in estate e sigillati, muffa sopra umido ma dentro secco, 90 days di lenta fermentazione anaerobica e poi fronte fresco tutti i giorni in inverno. Prevasca liquame HRT=2 days max. Letame in stock 20 days al max, meno in estate.
    //Pulizia once/anno per corrosione in cima. Once/5-10 anni svuotamento completo per sabbia fondale
    //Mixing forte
    //Perchè HRT ridotto rispetto a design? Stock?
  equation

    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+06, Tolerance = 1e-08, Interval = 500.077),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", idaSensitivity = "()"));
  end Multiple_SAntonio;

  class SAntonio_
    extends ADM1_P.ParametersADM1_operational;
    ADM1_P.BlockLibrary.Feed_Source_1 CattleManure annotation(
      Placement(visible = true, transformation(origin = {-162, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_3 MaizeSilage annotation(
      Placement(visible = true, transformation(origin = {-156, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-102, 2}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester digester(ideality = 1.0) annotation(
      Placement(visible = true, transformation(origin = {-29, 1}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {20, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_CH4_perc probe_CH4_perc annotation(
      Placement(visible = true, transformation(origin = {10, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_CO2_perc probe_CO2_perc annotation(
      Placement(visible = true, transformation(origin = {40, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.InitPID.NoInit, k = 1.5, limitsAtInit = true, strict = false, yMax = 10000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {-36, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_P Probe_P annotation(
      Placement(visible = true, transformation(origin = {-104, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_CattleSlurry.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_2 CattleSlurry annotation(
      Placement(visible = true, transformation(origin = {-164, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_MaizeSilage(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_MaizeSilage.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-224, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleManure(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_CattleManure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Probe_T_ probe_T_ annotation(
      Placement(visible = true, transformation(origin = {-68, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_T.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-100, -58}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BlockLibrary.Sludge_Discharge sludge_Discharge annotation(
      Placement(visible = true, transformation(origin = {26, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//CattleSlurry > Flores
    CattleSlurry.Inflow[1] = CattleSlurry.Flow_in;
    CattleSlurry.Inflow[2] = CattleSlurry.TS_in;
    CattleSlurry.Inflow[3] = CattleSlurry.VS_in;
    CattleSlurry.Inflow[4] = CattleSlurry.pH_in;
    CattleSlurry.Inflow[5] = CattleSlurry.Alk_in;
    CattleSlurry.Inflow[6] = CattleSlurry.Ammonium_in;
    CattleSlurry.Inflow[7] = CattleSlurry.Fosfates_in;
    CattleSlurry.Inflow[8] = CattleSlurry.Ca_in;
    CattleSlurry.Inflow[9] = CattleSlurry.Mg_in;
    CattleSlurry.Inflow[10] = CattleSlurry.ac_in;
    CattleSlurry.Inflow[11] = CattleSlurry.pro_in;
    CattleSlurry.Inflow[12] = CattleSlurry.bu_in;
    CattleSlurry.Inflow[13] = CattleSlurry.va_in;
    CattleSlurry.Inflow[14] = CattleSlurry.Ssu_in;
    CattleSlurry.Inflow[15] = CattleSlurry.Saa_in;
    CattleSlurry.Inflow[16] = CattleSlurry.Sfa_in;
    CattleSlurry.Inflow[17] = CattleSlurry.Si_in;
    CattleSlurry.Inflow[18] = CattleSlurry.tBMP_VS_in;
    CattleSlurry.Inflow[19] = CattleSlurry.Xi_in;
    CattleSlurry.Inflow[20] = CattleSlurry.Xpr_in;
    CattleSlurry.Inflow[21] = CattleSlurry.Xli_in;
    CattleSlurry.Inflow[22] = CattleSlurry.Xch_in;
//MaizeSilage
    0 = MaizeSilage.Flow_in;
    MaizeSilage.Inflow[2] = MaizeSilage.TS_in;
    MaizeSilage.Inflow[3] = MaizeSilage.VS_in;
    MaizeSilage.Inflow[4] = MaizeSilage.pH_in;
    MaizeSilage.Inflow[5] = MaizeSilage.Alk_in;
    MaizeSilage.Inflow[6] = MaizeSilage.Ammonium_in;
    MaizeSilage.Inflow[7] = MaizeSilage.Fosfates_in;
    MaizeSilage.Inflow[8] = MaizeSilage.Ca_in;
    MaizeSilage.Inflow[9] = MaizeSilage.Mg_in;
    MaizeSilage.Inflow[10] = MaizeSilage.ac_in;
    MaizeSilage.Inflow[11] = MaizeSilage.pro_in;
    MaizeSilage.Inflow[12] = MaizeSilage.bu_in;
    MaizeSilage.Inflow[13] = MaizeSilage.va_in;
    MaizeSilage.Inflow[14] = MaizeSilage.Ssu_in;
    MaizeSilage.Inflow[15] = MaizeSilage.Saa_in;
    MaizeSilage.Inflow[16] = MaizeSilage.Sfa_in;
    MaizeSilage.Inflow[17] = MaizeSilage.Si_in;
    MaizeSilage.Inflow[18] = MaizeSilage.tBMP_VS_in;
    MaizeSilage.Inflow[19] = MaizeSilage.Xi_in;
    MaizeSilage.Inflow[20] = MaizeSilage.Xpr_in;
    MaizeSilage.Inflow[21] = MaizeSilage.Xli_in;
    MaizeSilage.Inflow[22] = MaizeSilage.Xch_in;
//CattleManure
    0 = CattleManure.Flow_in;
    CattleManure.Inflow[2] = CattleManure.TS_in;
    CattleManure.Inflow[3] = CattleManure.VS_in;
    CattleManure.Inflow[4] = CattleManure.pH_in;
    CattleManure.Inflow[5] = CattleManure.Alk_in;
    CattleManure.Inflow[6] = CattleManure.Ammonium_in;
    CattleManure.Inflow[7] = CattleManure.Fosfates_in;
    CattleManure.Inflow[8] = CattleManure.Ca_in;
    CattleManure.Inflow[9] = CattleManure.Mg_in;
    CattleManure.Inflow[10] = CattleManure.ac_in;
    CattleManure.Inflow[11] = CattleManure.pro_in;
    CattleManure.Inflow[12] = CattleManure.bu_in;
    CattleManure.Inflow[13] = CattleManure.va_in;
    CattleManure.Inflow[14] = CattleManure.Ssu_in;
    CattleManure.Inflow[15] = CattleManure.Saa_in;
    CattleManure.Inflow[16] = CattleManure.Sfa_in;
    CattleManure.Inflow[17] = CattleManure.Si_in;
    CattleManure.Inflow[18] = CattleManure.tBMP_VS_in;
    CattleManure.Inflow[19] = CattleManure.Xi_in;
    CattleManure.Inflow[20] = CattleManure.Xpr_in;
    CattleManure.Inflow[21] = CattleManure.Xli_in;
    CattleManure.Inflow[22] = CattleManure.Xch_in;
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{-17.5, 20}, {-17.5, 38}, {12, 38}}));
    connect(Gas_Meter.CH4_perc_exp, probe_CH4_perc.y_CH4) annotation(
      Line(points = {{17, 46}, {10, 46}, {10, 57}}, color = {0, 0, 127}));
    connect(Gas_Meter.CO2_perc_exp, probe_CO2_perc.y_CO2) annotation(
      Line(points = {{23, 46}, {40, 46}, {40, 57}}, color = {0, 0, 127}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{-25, 58}, {-25, 41.25}, {-29, 41.25}, {-29, 24.5}}, color = {0, 0, 127}));
    connect(Probe_P.y_P, PID_Pgas.u_m) annotation(
      Line(points = {{-95, 68}, {-73, 68}, {-73, 36}, {-36, 36}, {-36, 46}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-48, 58}, {-64, 58}, {-64, 38}, {-32, 38}, {-32, 24.5}}, color = {0, 0, 127}));
    connect(CattleManure.Feed_Out, feeding_Tank.Manure_In) annotation(
      Line(points = {{-153.2, 35}, {-117.2, 35}, {-117.2, 15}}));
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-85.72, 3.32}, {-47.72, 3.32}, {-47.72, 12.32}}));
    connect(feeding_Tank.Fractions_Out, digester.Fractions_In) annotation(
      Line(points = {{-85.72, -1.08}, {-65.72, -1.08}, {-65.72, -8.08}, {-47.72, -8.08}}, color = {0, 0, 127}, thickness = 0.5));
    connect(MaizeSilage.Feed_Out, feeding_Tank.MaizeSilage_In) annotation(
      Line(points = {{-147.2, -27}, {-117.2, -27}, {-117.2, -11}}));
    connect(Input_CattleSlurry.y, CattleSlurry.Inflow) annotation(
      Line(points = {{-211, 6}, {-173, 6}, {-173, 4}}, color = {0, 0, 127}, thickness = 0.5));
    connect(CattleSlurry.Feed_Out, feeding_Tank.Slurry_In) annotation(
      Line(points = {{-155.2, 1}, {-117.2, 1}, {-117.2, 5}}));
    connect(Input_MaizeSilage.y, MaizeSilage.Inflow) annotation(
      Line(points = {{-213, -24}, {-165, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Input_CattleManure.y, CattleManure.Inflow) annotation(
      Line(points = {{-211, 38}, {-171, 38}}, color = {0, 0, 127}, thickness = 0.5));
    connect(probe_T_.y_T, digester.T_op) annotation(
      Line(points = {{-58, -50}, {-48, -50}, {-48, -14}}, color = {0, 0, 127}));
    connect(temperature.y[1], probe_T_.Input_T) annotation(
      Line(points = {{-94, -58}, {-76, -58}, {-76, -56}}, color = {0, 0, 127}));
    connect(digester.Digestate_Out, sludge_Discharge.Digestate_In) annotation(
      Line(points = {{-10, -16}, {18, -16}, {18, -18}}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 240),
      Diagram);
  end SAntonio_;
  annotation(
    uses(Modelica(version = "3.2.3")));
end ADM1_P;
