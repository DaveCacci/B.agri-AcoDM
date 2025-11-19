package ADM1
  import SI = Modelica.Units.SI;
  import NSI = Modelica.Units.NonSI;
  //import Modelica.Constants.*;
  import R = Modelica.Constants.R;
  extends Modelica.Icons.Package;

  package Types
    extends Modelica.Icons.TypesPackage;
    type FlowRate_d = Real(final quantity = "Daily flow rate", final unit = "m3/d", final displayUnit = "l/d");
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

  package Parameters
    record Parameters_Operative
      //
      /* Constant parameters common to pilot-scale digester and lab-scale batch tests */
      //constant Types.GasConstant R = 8.31446261815324 "Ideal gas constant [Pa*m3/mol/K]";
      constant SI.Temperature T_ref = 273.15 "Reference temperature at normal conditions [K]";
      constant SI.Temperature T_ref_phychem = 298.15 "Reference temperature for physicochemical parameters (pKa, enthalpy) [K]";
      constant SI.Temperature T_ref_bio = 308.15 "Reference temperature for biological kinetic parameters [K]";
      constant SI.Pressure P_atm_Pa = 101325 "Atmospheric pressure [Pa]";
      constant SI.Density d_h2o = 1000 "Water density [kg/m3]";
      constant SI.Density d_vs = 1050 "Water density [kg/m3]";
      constant SI.Density d_nvs = 2500 "Water density [kg/m3]";
      //
      /* Pilot-scale digester operative parameters */
      parameter SI.Volume V_tot = 0.077 "Digester total volume [m3]";
      parameter SI.Volume V_liq_0 = 0.051 "Digester working volume [m3]";
      constant SI.Temperature T_op_mean = 298.15 "310.15 Mean operative temperature in pilot-scale digester [K]";
      parameter Types.Kinetic_d kla_d_o2 = 80 "Volume-specific liquid-gas transfer coefficient in pilot-scale digester [1/d]";
      //
      /* Batch Test operative parameters */
      parameter SI.Time t_sampling_test = 12*86400 "Inoculum sampling time for test";
      parameter SI.Volume V_tot_test = 0.0077 "Batch reactor total volume [m3]";
      parameter SI.Volume V_inoculum_test = 0.0051 "Volume of inoculum dosed [m3]";
      parameter SI.Volume V_substrate_test = 0.001 "Volume of substrate solution dosed [m3]";
      parameter SI.Volume V_water_test = 0.051 "Volume of water dosed [m3]";
      constant SI.Temperature T_op_test = 310.15 "Mean operative temperature in lab-scale batch tests [K]";
      parameter Types.Kinetic_d kla_d_o2_test = 13 "Volume-specific liquid-gas transfer coefficient in lab-scale batch tests[1/d]";
      //
      annotation(
        Documentation(info = "<html><p> This record contains the operational parameters and constants of the digester. </p>
    <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
    <p> Last review: <em> August 24, 2022 </em></p></html>"));
    end Parameters_Operative;

    record Parameters_BatchTest
      //
      /* Other fixed variables for substrate */
      parameter SI.MassConcentration S_h2_substrate_test = 0 "Soluble hydrogen gas concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration S_ch4_substrate_test = 0 "Soluble methane concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration S_i_substrate_test = 0 "Soluble inerts concentration in substrate solution [kgCOD/m3]";
      parameter SI.MolarDensity S_ic_substrate_test = 0 "Soluble inorganic carbon concentration in substrate solution [mol/m3]";
      parameter SI.MolarDensity S_hco3_substrate_test = 0 "Soluble bicarbonate concentration in substrate solution [mol/m3]";
      parameter SI.MolarDensity S_an_substrate_test = 0.02 "Soluble anionic ions concentration in substrate solution [mol/m3]";
      parameter SI.MassConcentration X_c_substrate_test = 0 "Complex particulate concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_ch_substrate_test = 0 "Particulate carbohydrates concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_pr_substrate_test = 0 "Particulate proteins concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_li_substrate_test = 0 "Particulate lipids concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_su_substrate_test = 0 "Monosaccharide degrading organisms concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_aa_substrate_test = 0 "Amino Acid degrading organisms concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_fa_substrate_test = 0 "Long chain fatty acid degrading organisms concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_c4_substrate_test = 0 "C4 degrading organisms concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_pro_substrate_test = 0 "Propionate degrading organisms concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_ac_substrate_test = 0 "Acetate degrading organisms concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_h2_substrate_test = 0 "Hydrogen degrading organisms concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration X_i_substrate_test = 0 "Particulate inerts concentration in substrate solution [kgCOD/m3]";
      //
      /*Other fixed variables for water */
      parameter SI.MassConcentration S_su_water_test = 0 "Soluble monosaccharides concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_aa_water_test = 0 "Soluble amino acids concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_fa_water_test = 0 "Soluble long chain fatty acids concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_va_water_test = 0 "Valeric acid concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_bu_water_test = 0 "Butyric concentration in dilution water[kgCOD/m3]";
      parameter SI.MassConcentration S_pro_water_test = 0 "Propionic acid concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_ac_water_test = 0 "Acetic acid concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_vam_water_test = 0 "Valeric acid concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_bum_water_test = 0 "Butyric concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_prom_water_test = 0 "Propionic acid concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_acm_water_test = 0 "Acetic acid concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_h2_water_test = 0 "Soluble hydrogen gas concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration S_ch4_water_test = 0 "Soluble methane concentration in dilution water [kgCOD/m3]";
      parameter SI.MolarDensity S_in_water_test = 0 "Soluble inorganic nitrogen concentration in dilution water [mol/m3]";
      parameter SI.MolarDensity S_nh3_water_test = 0 "Soluble ammonia concentration in dilution water [mol/m3]";
      parameter SI.MolarDensity S_nh4_water_test = 0 "Soluble ammonium nitrogen concentration in dilution water [mol/m3]";
      parameter SI.MassConcentration S_i_water_test = 0 "Soluble inerts concentration in dilution water [kgCOD/m3]";
      parameter SI.MolarDensity S_an_water_test = 0.02 "Soluble anionic ions concentration in dilution water [mol/m3]";
      parameter SI.MassConcentration X_c_water_test = 0 "Complex particulate concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_ch_water_test = 0 "Particulate carbohydrates concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_pr_water_test = 0 "Particulate proteins concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_li_water_test = 0 "Particulate lipids concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_su_water_test = 0 "Monosaccharide degrading organisms concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_aa_water_test = 0 "Amino Acid degrading organisms concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_fa_water_test = 0 "Long chain fatty acid degrading organisms concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_c4_water_test = 0 "C4 degrading organisms concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_pro_water_test = 0 "Propionate degrading organisms concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_ac_water_test = 0 "Acetate degrading organisms concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_h2_water_test = 0 "Hydrogen degrading organisms concentration in dilution water [kgCOD/m3]";
      parameter SI.MassConcentration X_i_water_test = 0 "Particulate inerts concentration in dilution water [kgCOD/m3]";
      //
      parameter SI.VolumeFlowRate Q_test = 0 "Dummy flowrate [m3/s]";
    end Parameters_BatchTest;

    record Parameters_Conversion
      parameter SI.MassFraction f_newbio_BMP = 0.08 "Substrates COD fraction resulting in new biomass during BMP tests [kgCOD/kgCOD]";
      //
      /* Composition of feeding substrate #1 */
      parameter SI.MassFraction f_Xc_in1 = 0.10 "Fraction of substrate #1 COD entering the digester in the aggregated form, X_c [kgCOD/kgCOD]";
      parameter SI.MolarDensity S_an_input1 = 0.08*1000 "Soluble anion concentration in substrate #1 [mol/m3]";
      parameter SI.MassConcentration S_h2_input1 = 1e-8 "Soluble hydrogen concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration S_ch4_input1 = 1e-5 "Soluble methane concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration S_su_input1 = 0 "Soluble monosaccharides concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration S_aa_input1 = 0 "Soluble amino acids concentrationin substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration S_fa_input1 = 0 "Soluble fatty acids concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration S_i_input1 = 0 "Soluble inerts concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration X_su_input1 = 0 "Monosaccharide degrading organisms concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration X_aa_input1 = 0 "Amino Acid degrading organisms concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration X_fa_input1 = 0 "Long chain fatty acid degrading organisms concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration X_c4_input1 = 0 "C4 degrading organisms concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration X_pro_input1 = 0 "Propionate degrading organisms concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration X_ac_input1 = 0 "Acetate degrading organisms concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassConcentration X_h2_input1 = 0 "Hydrogen degrading organisms concentration in substrate #1 [kgCOD/m3]";
      parameter SI.MassFraction f_xch_xc_in1 = 0.2 "COD fraction of carbohydrates from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xpr_xc_in1 = 0.6 "COD fraction of proteins from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xli_xc_in1 = 0.1 "COD fraction of lipids from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_si_xc_in1 = 0 "COD fraction of soluble interts from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xi_ch_xc_in1 = 0.1 "COD fraction of carbohydrate particulate inerts from complex particulate Xc, in substrate #1[kgCOD/kgCOD]";
      parameter SI.MassFraction f_xi_pr_xc_in1 = 0.55 "COD fraction of protein particulate inerts from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xch_xi_in1 = 0.1 "COD fraction of carbohydrates from particulate inerts Xi, in substrate #1 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xpr_xi_in1 = 0.55 "COD fraction of proteins from particulate inerts Xi, in substrate #1 [kgCOD/kgCOD]";
      //
      /* Composition of feeding substrate #2 */
      parameter SI.MolarDensity S_an_input2 = 0.08*1000 "Soluble anion concentration in substrate #2 [mol/m3]";
      parameter SI.MassConcentration S_h2_input2 = 1e-8 "Soluble hydrogen concentration in substrate #2[kgCOD/m3]";
      parameter SI.MassConcentration S_ch4_input2 = 1e-5 "Soluble methane concentration in substrate #2[kgCOD/m3]";
      parameter SI.MassConcentration S_i_input2 = 0 "Soluble inerts concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_su_input2 = 0 "Monosaccharide degrading organisms concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_aa_input2 = 0 "Amino acid degrading organisms concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_fa_input2 = 0 "Long chain fatty acid degrading organisms concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_c4_input2 = 0 "C4 degrading organisms concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_pro_input2 = 0 "Propionate degrading organisms concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_ac_input2 = 0 "Acetate degrading organisms concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_h2_input2 = 0 "Hydrogen degrading organisms concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_i_input2 = 0 "Particulate inerts concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassConcentration X_c_input2 = 0 "Complex particulate concentration in substrate #2 [kgCOD/m3]";
      parameter SI.MassFraction f_xch_xc_in2 = 0.2 "COD fraction of carbohydrates from complex particulate Xc, in substrate #2 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xpr_xc_in2 = 0.2 "COD fraction of proteins from complex particulate Xc, in substrate #2 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xli_xc_in2 = 0.3 "COD fraction of lipids from complex particulate Xc, in substrate #2 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xi_xc_in2 = 0.2 "COD fraction of particulate inerts from complex particulate Xc, in substrate #2 [kgCOD/kgCOD]";
      parameter SI.MassFraction f_si_xc_in2 = 0.1 "COD fraction of soluble interts from complex particulate Xc, in substrate #2 [kgCOD/kgCOD]";
      //
      /*Composition of digestate*/
      parameter SI.MassFraction f_xch_xc_out = 0.20 "COD fraction of carbohydrates from complex particulate Xc, in digestate [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xpr_xc_out = 0.60 "COD fraction of proteins from complex particulate Xc, in digestate [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xch_xi_out = 0.45 "COD fraction of carbohydrates from particulate inerts Xi, in digestate [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xpr_xi_out = 0.50 "COD fraction of proteins from particulate inerts Xi, in digestate [kgCOD/kgCOD]";
      parameter SI.MassFraction f_si_ch_out = 0.5 "COD fraction of carbohydrates from soluble inerts Si, in digestate [kgCOD/kgCOD]";
      parameter SI.MassFraction f_si_pr_out = 0.4 "COD fraction of proteins from soluble inerts Si, in digestate [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xbac_ch_out = 0.10 "COD fraction of carbohydrates in biomass [kgCOD/kgCOD]";
      parameter SI.MassFraction f_xbac_pr_out = 0.8 "COD fraction of proteins in biomass [kgCOD/kgCOD]";
      //
      /* COD conversion factors for substrates and digestate components */
      parameter Types.MassConversion COD_CH_in = 32*6/180 "COD conversion factor for influent carbohydrates [kgCOD/kgVS]";
      parameter Types.MassConversion COD_PR_in = 1.45 "COD conversion factor for influent proteins [kgCOD/kgVS]";
      parameter Types.MassConversion PR_N_in = 7.5 "Conversion factor for influent proteins to organic nitrogen [kgVS/kgN]";
      parameter Types.MassConversion COD_LI_in = 2.90 "COD conversion factor for influent lipids [kgCOD/kgVS]";
      parameter Types.MassConversion COD_CH_out = 1.2 "COD conversion factor for effluent carbohydrates [kgCOD/kgVS]";
      parameter Types.MassConversion COD_PR_BSA_in = 1.58 "COD conversion factor for influent proteins measured with the BCA method [kgCOD/kgVS]";
      parameter Types.MassConversion COD_PR_BSA_out = 1.58 "COD conversion factor for effluent proteins measured with the BCA method [kgCOD/kgVS]";
      parameter Types.MassConversion COD_PR_out = 1.45 "COD conversion factor for effluent proteins [kgCOD/kgVS]";
      parameter Types.MassConversion PR_N_out = 7.5 "Conversion factor for effluent proteins to organic nitrogen [kgVS/kgN]";
      parameter Types.MassConversion COD_LI_out = 2.0 "COD conversion factor for effluent lipids [kgCOD/kgVS]";
      annotation(
        Documentation(info = "<html><p> This record contains COD conversion parameters for substrates and digestate and influent substrates concentrations (state variables) that are kept constant during simulation. </p>
    <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
    <p> Last review: <em> August 24, 2022 </em></p></html>"));
    end Parameters_Conversion;

    record Parameters_Stoichiometric
      /* Carbon and Nitrogen contents */
      parameter Types.MolarContent N_xc = 0.0376/14*1000 "Nitrogen content of particulate degradable COD [molN/kgCOD]";
      parameter Types.MolarContent N_i = 0.06/14*1000 "Nitrogen content of inert COD: 6% on weight basis in benchmark ASM [molN/kgCOD]";
      parameter Types.MolarContent N_aa = 0.007*1000 "Nitrogen content of amino acids [molN/kgCOD]";
      parameter Types.MolarContent N_bac = 0.08/14*1000 "Nitrogen content of biomass: 8% on weight basis in benchmark ASM [molN/kgCOD]";
      parameter Types.MolarContent C_xc = 0.02786*1000 "Carbon content of complex particulate COD [molC/kgCOD]";
      parameter Types.MolarContent C_xi = 0.03*1000 "Carbon content of particulate inert COD [molC/kgCOD]";
      parameter Types.MolarContent C_si = 0.03*1000 "Carbon content of soluble inert COD [molC/kgCOD]";
      parameter Types.MolarContent C_ch = 0.0313*1000 "Carbon content of carbohydrates [molC/kgCOD]";
      parameter Types.MolarContent C_pr = 0.03*1000 "Carbon content of proteins [molC/kgCOD]";
      parameter Types.MolarContent C_li = 0.022*1000 "Carbon content of lipids [molC/kgCOD]";
      parameter Types.MolarContent C_su = 0.0313*1000 "Carbon content of sugars [molC/kgCOD]";
      parameter Types.MolarContent C_aa = 0.03*1000 "Carbon content of amino acids [molC/kgCOD]";
      parameter Types.MolarContent C_fa = 0.0217*1000 "Carbon content of long chain fatty acids [molC/kgCOD]";
      parameter Types.MolarContent C_va = 0.024*1000 "Carbon content of valerate [molC/kgCOD]";
      parameter Types.MolarContent C_bu = 0.025*1000 "Carbon content of butyrate [molC/kgCOD]";
      parameter Types.MolarContent C_pro = 0.0268*1000 "Carbon content of propionate [molC/kgCOD]";
      parameter Types.MolarContent C_ac = 0.0313*1000 "Carbon content of acetate [molC/kgCOD]";
      parameter Types.MolarContent C_ch4 = 0.0156*1000 "Carbon content of methane [molC/kgCOD]";
      parameter Types.MolarContent C_bac = 0.0313*1000 "Carbon content of biomass [molC/kgCOD]";
      //
      /* Stoichiometric coefficients */
      parameter SI.MassFraction f_fa_li = 0.95 "COD fraction of long chain fatty acids (as opposed to glycerol) that degrades from lipids [kgCOD/kgCOD]";
      parameter SI.MassFraction nu_1_su = 0.495 "COD fraction of sucrose that degrades to acetate only [kgCOD/kgCOD]";
      parameter SI.MassFraction nu_2_su = 0.345 "COD fraction of sucrose that degrades to acetate and propionate [kgCOD/kgCOD]";
      parameter SI.MassFraction f_h2_aa = 0.06 "COD fraction of hydrogen from amino acid degradation [kgCOD/kgCOD]";
      parameter SI.MassFraction f_va_aa = 0.23 "COD fraction of valerate from amino acid degradation [kgCOD/kgCOD]";
      parameter SI.MassFraction f_bu_aa = 0.26 "COD fraction of butyrate from amino acid degradation [kgCOD/kgCOD]";
      parameter SI.MassFraction f_pro_aa = 0.05 "COD fraction of propionate from amino acid degradation [kgCOD/kgCOD]";
      parameter SI.MassFraction f_ac_aa = 0.4 "COD fraction of acetate from amino acid degradation [kgCOD/kgCOD]";
      //parameter Types.MassFraction_COD f_si_xc = 0 "COD fration of soluble inert from complex particulate disintegration [kgCOD/kgCOD]";
      //
      /* Yields of biomass on uptake of substrates */
      parameter SI.MassFraction Y_su = 0.1 "Yield of biomass on uptake of monosaccharides [kgCODx/kgCODs]";
      parameter SI.MassFraction Y_aa = 0.08 "Yield of biomass on uptake of amino acids [kgCODx/kgCODs]";
      parameter SI.MassFraction Y_fa = 0.06 "Yield of biomass on uptake of long chain fatty acids [kgCODx/kgCODs]";
      parameter SI.MassFraction Y_c4 = 0.06 "Yield of biomass on uptake of valerate or butyrate [kgCODx/kgCODs]";
      parameter SI.MassFraction Y_pro = 0.04 "Yield of biomass on uptake of propionate [kgCODx/kgCODs]";
      parameter SI.MassFraction Y_ac = 0.05 "Yield of biomass on uptake of acetate [kgCODx/kgCODs]";
      parameter SI.MassFraction Y_h2 = 0.06 "Yield of biomass on uptake of hydrogen [kgCODx/kgCODs]";
      annotation(
        Documentation(info = "<html><p> This record contains process stoichiometric coefficients as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
    <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
    <p> Last review: <em> August 24, 2022 </em></p></html>"),
        Icon);
    end Parameters_Stoichiometric;

    record Parameters_Kinetic
      parameter Types.Kinetic_d k_dis = 1.2 "Complex particulate disintegration first order constant [1/d]";
      parameter Types.Kinetic_d k_hyd_ch = 0.25 "Carbohydrate hydrolysis first order constant [1/d]";
      parameter Types.Kinetic_d k_hyd_pr = 0.3 "Protein hydrolysis first order constant [1/d]";
      parameter Types.Kinetic_d k_hyd_li = 0.25 "Lipid hydrolysis first order constant [1/d]";
      parameter Types.Kinetic_d k_m_su = 8 "Maximum uptake rate for monosaccharide degrading organisms [kgCODs/kgCODx/d]";
      parameter Types.Kinetic_d k_m_aa = 8 "Maximum uptake rate amino acid degrading organisms [kgCODs/kgCODx/d]";
      parameter Types.Kinetic_d k_m_fa = 6 "Maximum uptake rate for long chain fatty acid degrading organisms [kgCODs/kgCODx/d]";
      parameter Types.Kinetic_d k_m_c4 = 20 "Maximum uptake rate for c4 degrading organisms [kgCODs/kgCODx/d]";
      parameter Types.Kinetic_d k_m_pro = 20 "Maximum uptake rate for propionate degrading organisms [kgCODs/kgCODx/d]";
      parameter Types.Kinetic_d k_m_ac = 8 "Maximum uptake rate for acetate degrading organisms [kgCODs/kgCODx/d]";
      parameter Types.Kinetic_d k_m_h2 = 35 "Maximum uptake rate for hydrogen degrading organisms [kgCODs/kgCODx/d]";
      parameter SI.MassConcentration Ks_su = 0.5 "Half saturation constant for monosaccharide degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration Ks_aa = 0.3 "Half saturation constant for amino acid degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration Ks_fa = 0.4 "Half saturation constant for long chain fatty acid degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration Ks_c4 = 0.1 "Half saturation constant for c4 degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration Ks_pro = 0.3 "Half saturation constant for propionate degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration Ks_ac = 0.15 "Half saturation constant for acetate degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration Ks_h2 = 2.5e-5 "Half saturation constant for hydrogen degrading organisms [kgCOD/m3]";
      parameter Types.Kinetic_d k_dec_su = 0.02 "Decay rate for monosaccharide degrading organisms [1/d]";
      parameter Types.Kinetic_d k_dec_aa = 0.02 "Decay rate for amino acid degrading organisms [1/d]";
      parameter Types.Kinetic_d k_dec_fa = 0.02 "Decay rate for long chain fatty acid degrading organisms [1/d]";
      parameter Types.Kinetic_d k_dec_c4 = 0.02 "Decay rate for c4 degrading organisms [1/d]";
      parameter Types.Kinetic_d k_dec_pro = 0.02 "Decay rate for propionate degrading organisms [1/d]";
      parameter Types.Kinetic_d k_dec_ac = 0.02 "Decay rate for acetate degrading organisms [1/d]";
      parameter Types.Kinetic_d k_dec_h2 = 0.02 "Decay rate for hydrogen degrading organisms [1/d]";
      parameter SI.MolarDensity Ks_IN = 1e-4*1000 "Inorganic nitrogen concentration at which growth ceases [mol/m3]";
      parameter SI.MassConcentration Ki_h2_fa = 5e-6 "Hydrogen inhibitory concentration for LCFA degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration Ki_h2_c4 = 1e-5 "Hydrogen inhibitory concentration for C4 degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration Ki_h2_pro = 3.5e-6 "Hydrogen inhibitory concentration for propionate degrading organisms [kgCOD/m3]";
      parameter SI.MolarDensity Ki_nh3_ac = 0.0018*1000 "Inhibitory free ammonia concentration for acetate degrading organisms [mol/m3]";
      parameter SI.MassConcentration K_HPro_haldane = 6 "Haldane inhibition constant for propionate degrading organisms [kgCOD/m3]";
      parameter SI.MassConcentration K_HAc_haldane = 2.2 "Haldane inhibition constant for acetate degrading organisms [kgCOD/m3]";
      parameter SI.PerUnit pH_UL_aa = 5.5 "pH level at where there is no inhibition of amino acid degrading organisms";
      parameter SI.PerUnit pH_LL_aa = 4 "pH level at where there is full inhibition of amino acid degrading organisms";
      parameter SI.PerUnit pH_UL_ac = 7 "pH level at where there is no inhibition of acetate degrading organisms";
      parameter SI.PerUnit pH_LL_ac = 6 "pH level at where there is full inhibition of acetate degrading organisms";
      parameter SI.PerUnit pH_UL_h2 = 6 "pH level at where there is no inhibition of hydrogen degrading organisms";
      parameter SI.PerUnit pH_LL_h2 = 5 "pH level at where there is full inhibition of hydrogen degrading organisms";
      //Arrhenius temperature coefficients (Siegrist et al., 2002, for mesophilic conditions, 30-40 °C)
      parameter SI.LinearTemperatureCoefficient expth_k_hyd = 0.024 "Arrhenius temperature coefficient for hydrolysis first order constants [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_m_su = 0.069 "Arrhenius temperature coefficient for k_m_su [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_m_aa = 0.069 "Arrhenius temperature coefficient for k_m_aa [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_m_fa = 0.055 "Arrhenius temperature coefficient for k_m_fa [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_m_pro = 0.055 "Arrhenius temperature coefficient for k_m_pro [1/K]";
      //parameter SI.LinearTemperatureCoefficient expth_k_m_c4 = ? "Arrhenius temperature coefficient for k_m_c4 [1/K]"; not found
      parameter SI.LinearTemperatureCoefficient expth_k_m_ac = 0.069 "Arrhenius temperature coefficient for k_m_ac [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_m_h2 = 0.069 "Arrhenius temperature coefficient for k_m_h2 [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_Ks_su = 0.069 "Arrhenius temperature coefficient for Ks_su [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_Ks_aa = 0.069 "Arrhenius temperature coefficient for Ks_aa [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_Ks_fa = 0.035 "Arrhenius temperature coefficient for Ks_fa [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_Ks_pro = 0.10 "Arrhenius temperature coefficient for Ks_pro [1/K]";
      //parameter SI.LinearTemperatureCoefficient expth_Ks_c4 = ? "Arrhenius temperature coefficient for Ks_c4 [1/K]"; not found
      parameter SI.LinearTemperatureCoefficient expth_Ks_ac = 0.10 "Arrhenius temperature coefficient for Ks_ac [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_Ks_h2 = 0.08 "Arrhenius temperature coefficient for Ks_h2 [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_dec_su = 0.069 "Arrhenius temperature coefficient for k_dec_su [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_dec_aa = 0.069 "Arrhenius temperature coefficient for k_dec_aa [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_dec_fa = 0.055 "Arrhenius temperature coefficient for k_dec_fa [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_dec_pro = 0.055 "Arrhenius temperature coefficient for k_dec_pro [1/K]";
      //parameter SI.LinearTemperatureCoefficient expth_k_dec_c4 = ? "Arrhenius temperature coefficient for k_dec_c4 [1/K]"; not found
      parameter SI.LinearTemperatureCoefficient expth_k_dec_ac = 0.069 "Arrhenius temperature coefficient for k_dec_ac [1/K]";
      parameter SI.LinearTemperatureCoefficient expth_k_dec_h2 = 0.069 "Arrhenius temperature coefficient for k_dec_h2 [1/K]";
      // OtherVariables_Discharge
      parameter SI.MassConcentration epsilon = 1e-16 "value to avoid division by zero [kgCOD/m3]";
      annotation(
        Documentation(info = "<html><p> This record contains process kinetic parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
    <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
    <p> Last review: <em> August 26, 2022 </em></p></html>"),
        Icon);
    end Parameters_Kinetic;

    record Parameters_Physiochemical
      /* General */
      constant SI.PerUnit pKa_va = 4.86 "- log10Ka valerate at 298K";
      constant SI.PerUnit pKa_bu = 4.82 "- log10Ka butyrate at 298K";
      constant SI.PerUnit pKa_pro = 4.88 "- log10Ka propionate at 298K";
      constant SI.PerUnit pKa_ac = 4.76 "- log10Ka acetate at 298K";
      constant SI.PerUnit pKa_co2 = 6.35 "- log10Ka CO2 at 298K";
      constant SI.PerUnit pKa_hco3 = 10.33 "- log10Ka HCO3 at 298K";
      constant SI.PerUnit pKa_nh3 = 9.25 "- log10ka NH4+ at 298K ";
      constant SI.PerUnit pKa_h3po4 = 2.12 "-log10kaH3PO4";
      constant SI.PerUnit pKa_h2po4 = 7.21 "-log10kaH2PO4";
      constant SI.PerUnit pKa_hpo4 = 12.67 "-log10kaHPO4";
      constant SI.PerUnit pKa_h2o = 14 "- log10ka water at 298K ";
      constant SI.MolarDensity convKa = 1 "Conversion coefficient for Ka unit measure [mol/m3]";
      constant SI.MolarEnthalpy deltaH0_Ka_co2 = 7646 "Enthalpy of reaction CO2 -> HCO3 at standard T and P [J/mol]";
      constant SI.MolarEnthalpy deltaH0_Ka_hco3 = -14900 "Enthalpy of reaction of HCO3 -> CO3 at standard T and P [J/mol]";
      constant SI.MolarEnthalpy deltaH0_Ka_hpo4 = 14700 "enthalpy of reaction HPO4->PO4. To be verified!";
      constant SI.MolarEnthalpy deltaH0_Ka_h2po4 = 4200 "enthalpy of reaction H2PO4->HPO4. To be verified!";
      constant SI.MolarEnthalpy deltaH0_Ka_h3po4 = -41900 "enthalpy of reaction H3PO4->H2PO4. To be verified!";
      constant SI.MolarEnthalpy deltaH0_Ka_nh3 = 51965 "Enthalpy of reaction NH4 -> NH3 at standard T and P [J/mol]";
      constant SI.MolarEnthalpy deltaH0_Ka_h2o = 55900 "Enthalpy of reaction H2O -> OH + H+ at standard T and P [J/mol]";
      constant SI.MolarEnthalpy deltaH0_KH_ch4 = -14240 "Enthalpy of reaction of CH4gas -> CH4liq at standard T and P [J/mol]";
      constant SI.MolarEnthalpy deltaH0_KH_co2 = -19410 "Enthalpy of reaction of CO2gas -> CO2liq at standard T and P [J/mol]";
      constant SI.MolarEnthalpy deltaH0_KH_h2 = -4180 "Enthalpy of reaction of H2gas -> H2liq at standard T and P [J/mol]";
      constant Types.Henry KH_ch4_Tref = 0.0014/10^5*1000 "Henry constant for methane at standard T and P [mol/m3/Pa]";
      constant Types.Henry KH_co2_Tref = 0.035/10^5*1000 "Henry constant for carbon dioxide at standard T and P [mol/m3/Pa]";
      constant Types.Henry KH_h2_Tref = 0.00078/10^5*1000 "Henry constant for hydrogen gas at standard T and P [mol/m3/Pa]";
      constant Types.Henry KH_nh3_Tref = 61/10^5*1000 "Henry constant for ammonia at standard T and P [mol/m3/Pa]";
      constant Types.Henry KH_n2_Tref = 0.00065/10^5*1000 "Henry constant for nitrogen gas at standard T and P [mol/m3/Pa]";
      constant SI.Temperature coeffph20_T = 5290 "Enthalpy of reaction H2Ogas -> H2Oliq at standard T and P normalized by R [K]";
      constant SI.Pressure coeffph20_p = 0.0313*10^5 "Vapor pressure at standard T and P [Pa] (bar 0.0313)";
      //
      /* Kinetic constant for acid-base reactions: set to be at least three orders of magnitude higher than the fastest time constant of the system */
      parameter Types.InvMolConcRate k_AB_va = 1e10/86400/1000 "Molar rate coefficient for valerate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_bu = 1e10/86400/1000 "Molar rate coefficient for butyrate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_pro = 1e10/86400/1000 "Molar rate coefficient for propionate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_ac = 1e10/86400/1000 "Molar rate coefficient for acetate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_co2 = 1e10/86400/1000 "Molar rate coefficient for bicarbonate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_hco3 = 1e10/86400/1000 "Molar rate coefficient for carbonate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_h2po4 = 1e10/86400/1000 "Molar rate coefficient for dihydrogen phospate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_hpo4 = 1e10/86400/1000 "Molar rate coefficient for hydrogen phospate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_po4 = 1e10/86400/1000 "Molar rate coefficient for orto phosphate acid-base equilibrium process [m3/mol/s]";
      parameter Types.InvMolConcRate k_AB_in = 1e10/86400/1000 "Molar rate coefficient for ammonium acid-base equilibrium process [m3/mol/s]";
      //
      /* Gas diffusivities */
      parameter SI.ThermalDiffusivity D_o2 = 2.8e-9 "Oxygen diffusivity [m^2/s]";
      parameter SI.ThermalDiffusivity D_ch4 = 1.57e-9 "Methane diffusivity [m^2/s]";
      parameter SI.ThermalDiffusivity D_h2 = 4.65e-9 "Hydrogen diffusivity [m^2/s]";
      parameter SI.ThermalDiffusivity D_co2 = 1.98e-9 "Carbon dioxide diffusivity [m^2/s]";
      parameter SI.ThermalDiffusivity D_nh3 = 0.000169/86400 "Carbon dioxide diffusivity [m^2/s]";
      parameter SI.ThermalDiffusivity D_n2 = 0.0001536/86400 "Carbon dioxide diffusivity [m^2/s]";
      //
      /* Molecular weights */
      constant SI.MolarMass MWHAc = 60/1000 "Molecular weight of acetic acid [kg/mol]";
      constant SI.MolarMass MWHPro = 74/1000 "Molecular weight of propionic acid [kg/mol]";
      constant SI.MolarMass MWHBu = 88/1000 "Molecular weight of butyric acid [kg/mol]";
      constant SI.MolarMass MWHVa = 102/1000 "Molecular weight of valeric acid [kg/mol]";
      constant SI.MolarMass MWCaCO3 = 100/1000 "Molecular weight of calcium carbonate [kg/mol]";
      constant SI.MolarMass MWHCO3 = 61/1000 "Molecular weight of bicarbonate ion [kg/mol]";
      constant SI.MolarMass MWCO3 = 60/1000 "Molecular weight of carbonate ion [kg/mol]";
      constant SI.MolarMass MWPO4 = 95/1000 "Molecular weight of orto phosphate ion [kg/mol]";
      constant SI.MolarMass MWHPO4 = 96/1000 "Molecular weight of hydrogen phosphate ion [kg/mol]";
      constant SI.MolarMass MWH2PO4 = 97/1000 "Molecular weight of hydrogen phosphate ion [kg/mol]";
      constant SI.MolarMass MWP = 31/1000 "Molecular weight of nitrogen [kg/mol]";
      constant SI.MolarMass MWN = 14/1000 "Molecular weight of nitrogen [kg/mol]";
      constant SI.MolarMass MWO2 = 32/1000 "Molecular weight of molecular oxygen [kg/mol]";
      constant SI.MolarMass MWNH3 = 17/1000 "Molecular weight of ammonia [kg/mol]";
      //
      /* Stoichiometric conversion coefficients */
      constant SI.MolarMass COD_Ac = 64/1000 "Stoichiometric COD per molar unit of acetate [kgCOD/mol]";
      constant SI.MolarMass COD_Pro = 112/1000 "Stoichiometric COD per molar unit of propionate [kgCOD/mol]";
      constant SI.MolarMass COD_Bu = 160/1000 "Stoichiometric COD per molar unit of butyrate [kgCOD/mol]";
      constant SI.MolarMass COD_Va = 208/1000 "Stoichiometric COD per molar unit of valerate [kgCOD/mol]";
      constant SI.MolarMass COD_ch4 = 64/1000 "Stoichiometric COD per molar unit of methane [kgCOD/mol]";
      constant SI.MolarMass COD_h2 = 16/1000 "Stoichiometric COD per molar unit of hydrogen [kgCOD/mol]";
      annotation(
        Documentation(info = "<html><p> This record contains physiochemical parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
    <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
    <p> Last review: <em> August 26, 2022 </em></p></html>"),
        Icon);
    end Parameters_Physiochemical;
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(origin = {-3, 18}, textColor = {126, 126, 126}, extent = {{-77, 62}, {83, -98}}, textString = "p")}),
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      uses(Modelica(version = "4.0.0")));
  end Parameters;

  package Variables
    record StateVariables_Digester
      extends Parameters.Parameters_Operative;
      /* Biomass */
      SI.MassConcentration X_su(fixed = true, start = 0.171844477851955) "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_aa(fixed = true, start = 0.61923061050481) "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_fa(fixed = true, start = 0.176756083950276) "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_c4(fixed = true, start = 0.236115793848027) "C4 degrading organisms concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_pro(fixed = true, start = 0.0707860907968375) "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_ac(fixed = true, start = 0.44625608307655) "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_h2(fixed = true, start = 0.21027420887601) "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
      //
      //  SI.MassConcentration X_su_in(fixed = false, start = 0.171844477851955) "Monosaccharide degrading organisms concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_aa_in(fixed = false, start = 0.61923061050481) "Amino Acid degrading organisms concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_fa_in(fixed = false, start = 0.176756083950276) "Long chain fatty acid degrading organisms concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_c4_in(fixed = false, start = 0.236115793848027) "C4 degrading organisms concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_pro_in(fixed = false, start = 0.0707860907968375) "Propionate degrading organisms concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_ac_in(fixed = false, start = 0.44625608307655) "Acetate degrading organisms concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_h2_in(fixed = false, start = 0.21027420887601) "Hydrogen degrading organisms concentration in the feeding [kgCOD/m3]";
      //
      /* Organic particulate components */
      SI.MassConcentration X_c(fixed = true, start = 0.188523943307974) "Complex particulate concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_i(fixed = true, start = 8.82083748012884) "Particulate inerts concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_ch(fixed = true, start = 0.493907425992654) "Particulate carbohydrates concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_pr(fixed = true, start = 1.12771809418909) "Particulate proteins concentration in digestate [kgCOD/m3]";
      SI.MassConcentration X_li(fixed = true, start = 0.965732116587352) "Particulate lipids concentration in digestate [kgCOD/m3]";
      //
      //  SI.MassConcentration X_c_in(fixed = false, start = 0.188523943307974) "Complex particulate concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_i_in(fixed = false, start = 8.82083748012884) "Particulate inerts concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_ch_in(fixed = false, start = 0.493907425992654) "Particulate carbohydrates concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_pr_in(fixed = false, start = 1.12771809418909) "Particulate proteins concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration X_li_in(fixed = false, start = 0.965732116587352) "Particulate lipids concentration in the feeding [kgCOD/m3]";
      //
      /* Organic soluble components */
      SI.MassConcentration S_i(fixed = true, start = 8.95946506102146e-07) "Soluble inerts concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_su(fixed = true, start = 0.0430230761137466) "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_aa(fixed = true, start = 0.046267901457183) "Soluble amino acids concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_fa(fixed = true, start = 0.078270201571595) "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_va(fixed = true, start = 0) "Valeric acid concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_bu(fixed = true, start = 0.0223872727272727) "Butyric concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_pro(fixed = true, start = 0.0672) "Propionic acid concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_ac(fixed = true, start = 0.0674112) "Acetic acid concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_vam(fixed = true, start = 0) "Valerate ion concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_bum(fixed = true, start = 0.022730428912437) "Butyrate ion concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_prom(fixed = true, start = 0.067) "Propionate ion concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_acm(fixed = true, start = 0.0671114242792856) "Acetate ion inerts concentration in digestate [kgCOD/m3]";
      //
      //  SI.MassConcentration S_i_in(fixed = false, start = 8.95946506102146e-07) "Soluble inerts concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration S_su_in(fixed = false, start = 0.0430230761137466) "Soluble monosaccharides concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration S_aa_in(fixed = false, start = 0.046267901457183) "Soluble amino acids concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration S_fa_in(fixed = false, start = 0.078270201571595) "Soluble long chain fatty acids  concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration S_va_in(fixed = false, start = 0) "Valeric acid concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration S_bu_in(fixed = false, start = 0.0223872727272727) "Butyric concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration S_pro_in(fixed = false, start = 0.0672) "Propionic acid concentration in the feeding [kgCOD/m3]";
      //  SI.MassConcentration S_ac_in(fixed = false, start = 0.0674112) "Acetic acid concentration in the feeding [kgCOD/m3]";
      //  //
      /* Inorganic soluble components */
      SI.MassConcentration S_h2(fixed = true, start = 9.71595541886631e-07) "Soluble hydrogen concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_ch4(fixed = true, start = 0.035718304294732) "Soluble methane concentration in digestate [kgCOD/m3]";
      SI.MolarDensity S_ic(fixed = true, start = 0.103271599042417*1000) "Soluble inorganic carbon concentration in digestate [mol/m3]";
      SI.MolarDensity S_in(fixed = true, start = 0.0404285714285714*1000) "Soluble inorganic nitrogen concentration in digestate [mol/m3]";
      SI.MolarDensity S_ip(fixed = true, start = 0.0404285714285714*1000) "Soluble inorganic phosphorous concentration in digestate [mol/m3]";
      SI.MolarDensity S_cat(fixed = true, start = 0.0708801468406167*1000) "Soluble cationic ion concentration in digestate [mol/m3]";
      SI.MolarDensity S_an(fixed = true, start = 0.020*1000) "Soluble anionic ions concentration in digestate [mol/m3]";
      SI.MolarDensity S_co2(fixed = false, start = 0.0137994215648506*1000) "Soluble carbon dioxide concentration in digestate [mol/m3]";
      SI.MolarDensity S_hco3(fixed = true, start = 0.0894721774775659*1000) "Soluble bicarbonate ion concentration in digestate [mol/m3]";
      SI.MolarDensity S_co3(fixed = true, start = 0.0894721774775659*1000) "Soluble carbonate ion concentration in digestate [mol/m3]";
      SI.MolarDensity S_nh3(fixed = true, start = 0.000648487639882837*1000) "Soluble free ammonia concentration in digestate [mol/m3]";
      SI.MolarDensity S_nh4(fixed = false, start = 0.0397800837886886*1000) "Soluble ammonium ion concentration in digestate [mol/m3]";
      SI.MolarDensity S_po4(fixed = false, start = 0) "Soluble orto phosphate ion concentration in digestate [mol/m3]";
      SI.MolarDensity S_hpo4(fixed = false, start = 0) "Soluble hydrogen phosphate ion concentration in digestate [mol/m3]";
      SI.MolarDensity S_h2po4(fixed = false, start = 0) "Soluble dihydrogen phosphate ion concentration in digestate [mol/m3]";
      SI.MolarDensity S_h3po4(fixed = false, start = 0) "Soluble phosphoric acid concentration in digestate [mol/m3]";
      SI.PerUnit pH(fixed = false, start = 7.11) "Digestate pH [-]";
      SI.MolarDensity S_h(fixed = true, start = 7.76247116628689e-08*1000) "Hydrogen ion concentration in digestate [mol/m3]";
      SI.MolarDensity S_oh(fixed = false, start = 3.08254016984734e-07*1000) "Hydroxide ion concentration in digestate [mol/m3]";
      //  SI.MolarDensity pos(fixed = false, start = 0.1 * 1000) "Concentration of total positive charges (ions) in digestate [mol/m3]";
      //  SI.MolarDensity neg(fixed = false, start = 0.1 * 1000) "Concentration of total negative charges (ions) in digestate [mol/m3]";
      //  SI.MolarDensity Theta(fixed = false, start = 0) "Charge balance in digestate [mol/m3]";
      //  SI.MolarDensity charge(fixed = false, start = 0) "Charge balance in digestate [mol/m3]";
      //
      //  SI.MassConcentration S_h2_in(fixed = false, start = 9.71595541886631e-07) "Soluble hydrogen concentration in   the feeding [kgCOD/m3]";
      //  SI.MassConcentration S_ch4_in(fixed = false, start = 0.035718304294732) "Soluble methane concentration in the feeding [kgCOD/m3]";
      //  SI.MolarDensity S_ic_in(fixed = false, start = 0.103271599042417*1000) "Soluble inorganic carbon concentration in the feeding [mol/m3]";
      //  SI.MolarDensity S_in_in(fixed = false, start = 0.0404285714285714*1000) "Soluble inorganic nitrogen concentration in the feeding [mol/m3]";
      //  SI.MolarDensity S_cat_in(fixed = false, start = 0.0708801468406167*1000) "Soluble cationic ion concentration in the feeding [mol/m3]";
      //  SI.MolarDensity S_an_in(fixed = false, start = 0.020*1000) "Soluble anionic ions concentration in the feedinge [mol/m3]";
      //
      /* Gas components */
      SI.MassConcentration S_gas_h2(fixed = false, start = 0.0000409814975443494) "Soluble gaseous hydrogen concentration in digestate [kgCOD/m3]";
      SI.MassConcentration S_gas_ch4(fixed = false, start = 1.06438615874316) "Soluble gaseous methane concentration in digestate [kgCOD/m3]";
      SI.MolarDensity S_gas_co2(fixed = false, start = 0.0211180300722813*1000) "Soluble gaseous carbon dioxide concentration in digestate [mol/m3]";
      SI.MolarDensity S_gas_nh3(fixed = false, start = 0.0211180300722813*1000) "Soluble gaseous ammonia concentration in digestate [mol/m3]";
      SI.Pressure p_gas_h2(fixed = true, start = 1.54075) "Hydrogen partial pressure [Pa]";
      SI.Pressure p_gas_ch4(fixed = true, start = 88218.5) "Methane partial pressure [Pa]";
      SI.Pressure p_gas_co2(fixed = false, start = 35298.5) "Carbon dioxide partial pressure [Pa]";
      SI.Pressure p_gas_nh3(fixed = true, start = 1.54075) "Ammonia partial pressure [Pa]";
      //
      /* Inorganic carbon coefficients on processes */
      Types.MolarContent v1(fixed = false, start = 0) "Inorganic carbon coefficient for complex particulate disintegration [molC/kgCOD]";
      Types.MolarContent v2(fixed = false, start = 0) "Inorganic carbon coefficient for particulate carbohydrates hydrolysis [molC/kgCOD]";
      Types.MolarContent v3(fixed = false, start = 0) "Inorganic carbon coefficient for particulate proteins hydrolysis [molC/kgCOD]";
      Types.MolarContent v4(fixed = false, start = 0) "Inorganic carbon coefficient for particulate lipids hydrolysis [molC/kgCOD]";
      Types.MolarContent v5(fixed = false, start = 0) "Inorganic carbon coefficient for monosaccharides uptake [molC/kgCOD]";
      Types.MolarContent v6(fixed = false, start = 0) "Inorganic carbon coefficient for amino acids uptake [molC/kgCOD]";
      Types.MolarContent v7(fixed = false, start = 0) "Inorganic carbon coefficient for long chain fatty acids uptake [molC/kgCOD]";
      Types.MolarContent v8(fixed = false, start = 0) "Inorganic carbon coefficient for valerate uptake [molC/kgCOD]";
      Types.MolarContent v9(fixed = false, start = 0) "Inorganic carbon coefficient for butyrate uptake [molC/kgCOD]";
      Types.MolarContent v10(fixed = false, start = 0) "Inorganic carbon coefficient for propionate uptake [molC/kgCOD]";
      Types.MolarContent v11(fixed = false, start = 0) "Inorganic carbon coefficient acetate uptake [molC/kgCOD]";
      Types.MolarContent v12(fixed = false, start = 0) "Inorganic carbon coefficient hydrogen uptake [molC/kgCOD]";
      Types.MolarContent v13(fixed = false, start = 0) "Inorganic carbon coefficient for biomass decay [molC/kgCOD]";
      //
      /* Process rates */
      Types.MassConcRate r1(fixed = false, start = 0) "Disintegration rate [kgCOD/m3/s]";
      Types.MassConcRate r2(fixed = false, start = 0) "Carbohydrates hydrolysis rate [kgCOD/m3/s]";
      Types.MassConcRate r3(fixed = false, start = 0) "Proteins hydrolysis rate [kgCOD/m3/s]";
      Types.MassConcRate r4(fixed = false, start = 0) "Lipids hydrolysis rate [kgCOD/m3/s]";
      Types.MassConcRate r5(fixed = false, start = 0) "Uptake of monosaccharides rate [kgCOD/m3/s]";
      Types.MassConcRate r6(fixed = false, start = 0) "Uptake of amino acids rate [kgCOD/m3/s]";
      Types.MassConcRate r7(fixed = false, start = 0) "Uptake of long chain fatty acids rate [kgCOD/m3/s]";
      Types.MassConcRate r8(fixed = false, start = 0) "Uptake of valerate rate [kgCOD/m3/s]";
      Types.MassConcRate r9(fixed = false, start = 0) "Uptake of butyrate rate [kgCOD/m3/s]";
      Types.MassConcRate r10(fixed = false, start = 0) "Uptake of propionate rate [kgCOD/m3/s]";
      Types.MassConcRate r11(fixed = false, start = 0) "Uptake of acetate rate [kgCOD/m3/s]";
      Types.MassConcRate r12(fixed = false, start = 0) "Uptake of hydrogen rate [kgCOD/m3/s]";
      Types.MassConcRate r13(fixed = false, start = 0) "Decay of X_su rate [kgCOD/m3/s]";
      Types.MassConcRate r14(fixed = false, start = 0) "Decay of X_aa rate [kgCOD/m3/s]";
      Types.MassConcRate r15(fixed = false, start = 0) "Decay of X_fa rate [kgCOD/m3/s]";
      Types.MassConcRate r16(fixed = false, start = 0) "Decay of X_c4 rate [kgCOD/m3/s]";
      Types.MassConcRate r17(fixed = false, start = 0) "Decay of X_pro rate [kgCOD/m3/s]";
      Types.MassConcRate r18(fixed = false, start = 0) "Decay of X_ac rate [kgCOD/m3/s]";
      Types.MassConcRate r19(fixed = false, start = 0) "Decay of X_h2 rate [kgCOD/m3/s]";
      Types.MassConcRate ra4(fixed = false, start = 0) "Acid-base rate for valerate [kgCOD/m3/s]";
      Types.MassConcRate ra5(fixed = false, start = 0) "Acid-base rate for butyrate [kgCOD/m3/s]";
      Types.MassConcRate ra6(fixed = false, start = 0) "Acid-base rate for propionate [kgCOD/m3/s]";
      Types.MassConcRate ra7(fixed = false, start = 0) "Acid-base rate for acetate [kgCOD/m3/s]";
      Types.MolConcRate ra10(fixed = false, start = 0) "Acid-base rate for bicarbonate [mol/m3/s]";
      Types.MolConcRate ra15(fixed = false, start = 0) "Acid-base rate for carbonate[mol/m3/s]";
      Types.MolConcRate ra11(fixed = false, start = 0) "Acid-base rate for inorganic nitrogen [mol/m3/s]";
      Types.MolConcRate ra12(fixed = false, start = 0) "Acid-base rate for hydrogen phosphate[mol/m3/s]";
      Types.MolConcRate ra13(fixed = false, start = 0) "Acid-base rate for orto phosphate[mol/m3/s]";
      Types.MolConcRate ra14(fixed = false, start = 0) "Acid-base rate for dihydrogen phosphate[mol/m3/s]";
      Types.MassConcRate rt8(fixed = false, start = 0) "Gas transfer rate for hydrogen [kgCOD/m3/s]";
      Types.MassConcRate rt9(fixed = false, start = 0) "Gas transfer rate for methane [kgCOD/m3/s]";
      Types.MolConcRate rt10(fixed = false, start = 0) "Gas transfer rate for carbon dioxide [mol/m3/s]";
      Types.MolConcRate rt12(fixed = false, start = 0) "Gas transfer rate for ammonia [mol/m3/s]";
      //
      /*Process inhibition */
      Types.Inhibition I_5(fixed = false, start = 1) "Inhibition function on process 5 (uptake of monosaccharides) [-]";
      Types.Inhibition I_6(fixed = false, start = 1) "Inhibition function on process 6 (uptake of amino acids) [-]";
      Types.Inhibition I_7(fixed = false, start = 1) "Inhibition function on process 7 (uptake of long chain fatty acids) [-]";
      Types.Inhibition I_8(fixed = false, start = 1) "Inhibition function on process 8 (uptake of valerate) [-]";
      Types.Inhibition I_9(fixed = false, start = 1) "Inhibition function on process 9 (uptake of butyrate) [-]";
      Types.Inhibition I_10(fixed = false, start = 1) "Inhibition function on process 10 (uptake of propionate) [-]";
      Types.Inhibition I_11(fixed = false, start = 1) "Inhibition function on process 11 (uptake of acetate) [-]";
      Types.Inhibition I_12(fixed = false, start = 1) "Inhibition function on process 12 (uptake of hydrogen) [-]";
      Types.Inhibition I_pH_aa(fixed = false, start = 1) "pH inhibition (processes from 5 to 10) [-]";
      Types.Inhibition I_pH_ac(fixed = false, start = 1) "pH inhibition (process 11) [-]";
      Types.Inhibition I_pH_h2(fixed = false, start = 1) "pH inhibition (process 12) [-]";
      Types.Inhibition I_in_lim(fixed = false, start = 1) "Inorganic nitrogen limitation (all processes, from 5 to 12) [-]";
      Types.Inhibition I_h2_fa(fixed = false, start = 1) "Hydrogen gas inhibition (process 7) [-]";
      Types.Inhibition I_h2_c4(fixed = false, start = 1) "Hydrogen gas inhibition (processes 8 and 9) [-]";
      Types.Inhibition I_h2_pro(fixed = false, start = 1) "Hydrogen gas inhibition (process 10) [-]";
      Types.Inhibition I_nh3(fixed = false, start = 1) "Free ammonia inhibition (process 11) [-]";
      //
      /* Other variables */
      Types.Kinetic_s kla_s_ch4(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for methane [1/s]";
      Types.Kinetic_s kla_s_h2(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for hydrogen gas [1/s]";
      Types.Kinetic_s kla_s_co2(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for carbon dioxide [1/s]";
      Types.Kinetic_s kla_s_nh3(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for ammonia [1/s]";
      //  SI.Pressure P_gas(fixed = false, start = 101325) "Pressure in digester [Pa]";
      SI.VolumeFlowRate Q_gas(fixed = true, start = 0) "Wet biogas rate at operative temperature and pressure [m3/s]";
      Types.FlowRate_d Q_gas_N(fixed = false, start = 0) "Wet biogas rate at normal temperature and pressure [Nm3/d]";
      SI.VolumeFlowRate Q_wv(fixed = false, start = 0) "Vapour water rate at operative temperature and pressure [m3/s]";
      SI.Volume V_liq(fixed = true, start = V_liq_0) "Digester liquid volume [m3]";
      //SI.Volume V_gas(fixed = true, start = 0) "Digester headspace [m3]";
      SI.Volume V_ch4_cum(fixed = true, start = 0) "Cumulated methane volume [m3]";
      SI.Volume V_feed_cum(fixed = true, start = 0) "Cumulated volume of feeding substrates [m3]";
      //
      /* Stoichiometric parameters */
      //      SI.MassFraction f_si_xc(fixed = false, start = 1) "COD fraction of soluble inerts from complex particulate degradation [kgCOD/kgCOD]";
      //      SI.MassFraction f_xi_xc(fixed = false, start = 1) "COD fraction of particulate inerts from complex particulate degradation [kgCOD/kgCOD]";
      //      SI.MassFraction f_xch_xc(fixed = false, start = 1) "COD fraction of particulate carbohydrates from complex particulate degradation [kgCOD/kgCOD]";
      //      SI.MassFraction f_xpr_xc(fixed = false, start = 1) "COD fraction of particulate proteins from complex particulate degradation [kgCOD/kgCOD]";
      //      SI.MassFraction f_xli_xc(fixed = false, start = 1) "COD fraction of particulate lipids from complex particulate degradation [kgCOD/kgCOD]";
      SI.MassFraction f_h2_su(fixed = false, start = 1) "COD fraction of hydrogen from monosaccharide degradation; set using expression in Appendix D, ADM1 [kgCOD/kgCOD]";
      SI.MassFraction f_bu_su(fixed = false, start = 1) "COD fraction of butyrate from monosaccharide degradation; set using expression in Appendix D, ADM1 [kgCOD/kgCOD]";
      SI.MassFraction f_pro_su(fixed = false, start = 1) "COD fraction of propionate from monosaccharide degradation; set using expression in Appendix D, ADM1 [kgCOD/kgCOD]";
      SI.MassFraction f_ac_su(fixed = false, start = 1) "COD fraction of actetate from monosaccharide degradation; set using expression in Appendix D, ADM1 [kgCOD/kgCOD]";
      //
      /* VFA acid-base constants at standart T and P */
      SI.MolarDensity Ka_va(fixed = false, start = 0) "Acid-base constant for valerate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_bu(fixed = false, start = 0) "Acid-base constant for butyrate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_pro(fixed = false, start = 0) "Acid-base constant for propionate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_ac(fixed = false, start = 0) "Acid-base constant for acetate at standard T and P [mol/m3]";
      //
      /*Temperature dependant parameters */
      Types.Kinetic_s k_dis_T(fixed = false, start = 0) "Disintegration first order constant, corrected for time [1/s]";
      Types.Kinetic_s k_hyd_ch_T(fixed = false, start = 0) "Carbohydrate hydrolysis first order constant, corrected for T and time [1/s]";
      Types.Kinetic_s k_hyd_pr_T(fixed = false, start = 0) "Protein hydrolysis first order constant, corrected for T and time [1/s]]";
      Types.Kinetic_s k_hyd_li_T(fixed = false, start = 0) "Lipid hydrolysis first order constant, corrected for T and time [1/s]";
      Types.Kinetic_s k_m_su_T(fixed = false, start = 0) "Maximum uptake rate for monosaccharide degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_aa_T(fixed = false, start = 0) "Maximum uptake rate amino acid degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_fa_T(fixed = false, start = 0) "Maximum uptake rate for long chain fatty acid degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_c4_T(fixed = false, start = 0) "Maximum uptake rate for c4 degrading organisms, corrected for time, correction for T not found [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_pro_T(fixed = false, start = 0) "Maximum uptake rate for propionate degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_ac_T(fixed = false, start = 0) "Maximum uptake rate for acetate degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_h2_T(fixed = false, start = 0) "Maximum uptake rate for hydrogen degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      SI.MassConcentration Ks_su_T(fixed = false, start = 0) "Half saturation constant for monosaccharide degrading organisms, corrected for T [kgCOD/m3]";
      SI.MassConcentration Ks_aa_T(fixed = false, start = 0) "Half saturation constant for amino acid degrading organisms, corrected for T [kgCOD/m3]";
      SI.MassConcentration Ks_fa_T(fixed = false, start = 0) "Half saturation constant for long chain fatty acid degrading organisms [kgCOD/m3]";
      SI.MassConcentration Ks_c4_T(fixed = false, start = 0) "Half saturation constant for c4 degrading organisms, correction for T not found [kgCOD/m3]";
      SI.MassConcentration Ks_pro_T(fixed = false, start = 0) "Half saturation constant for propionate degrading organisms, corrected for T [kgCOD/m3]";
      SI.MassConcentration Ks_ac_T(fixed = false, start = 0) "Half saturation constant for acetate degrading organisms, corrected for T  [kgCOD/m3]";
      SI.MassConcentration Ks_h2_T(fixed = false, start = 0) "Half saturation constant for hydrogen degrading organisms, corrected for T [kgCOD/m3]";
      Types.Kinetic_s k_dec_su_T(fixed = false, start = 0) "Decay rate for monosaccharide degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_aa_T(fixed = false, start = 0) "Decay rate for amino acid degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_fa_T(fixed = false, start = 0) "Decay rate for long chain fatty acid degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_c4_T(fixed = false, start = 0) "Decay rate for c4 degrading organisms, corrected for time, correction for T not found [1/s]";
      Types.Kinetic_s k_dec_pro_T(fixed = false, start = 0) "Decay rate for propionate degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_ac_T(fixed = false, start = 0) "Decay rate for acetate degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_h2_T(fixed = false, start = 0) "Decay rate for hydrogen degrading organisms, corrected for T and time [1/s]";
      SI.MolarDensity Ka_co2(fixed = false, start = 4.94e-7/1000) "Acid-base constant for carbonic acid at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_hco3(fixed = false, start = 4.94e-7/1000) "Acid-base constant for bicarbonate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h3po4(fixed = false, start = 0) "Acid-base constant for phosphoric acid at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h2po4(fixed = false, start = 0) "Acid-base constant for dihydrogen phospate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_hpo4(fixed = false, start = 0) "Acid-base constant for hydrogen phospate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_nh3(fixed = false, start = 1.11e-9/1000) "Acid-base constant for free ammonia at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h2o(fixed = false, start = 2.08e-14/1000) "Acid-base constant for water at operative temperature and standard pressure [mol/m3]";
      Types.Henry KH_ch4(fixed = false, start = 0.00116/100) "Henry constant for methane at operative temperature and standard pressure [mol/m3/Pa]";
      Types.Henry KH_co2(fixed = false, start = 0.0271/100) "Henry constant for carbon dioxide at operative temperature and standard pressure [mol/m3/Pa]";
      Types.Henry KH_h2(fixed = false, start = 7.38e-4/100) "Henry constant for hydrogen at operative temperature and standard pressure [mol/m3/Pa]";
      Types.Henry KH_nh3(fixed = false, start = 61/100) "Henry constant for ammonia at operative temperature and standard pressure [mol/m3/Pa]";
      SI.Pressure p_gas_h2o(fixed = false, start = 5570) "Vapour partial pressure [Pa]";
      annotation(
        Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
    <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
    <p> Last review: <em> August 26, 2022 </em></p></html>"));
    end StateVariables_Digester;

    record StateVariables_BatchTest
      //
      /* Inorganic carbon coefficients on processes */
      Types.MolarContent v1_test(fixed = false, start = 0) "Inorganic carbon coefficient for complex particulate disintegration [molC/kgCOD]";
      Types.MolarContent v2_test(fixed = false, start = 0) "Inorganic carbon coefficient for particulate carbohydrates hydrolysis [molC/kgCOD]";
      Types.MolarContent v3_test(fixed = false, start = 0) "Inorganic carbon coefficient for particulate proteins hydrolysis [molC/kgCOD]";
      Types.MolarContent v4_test(fixed = false, start = 0) "Inorganic carbon coefficient for particulate lipids hydrolysis [molC/kgCOD]";
      Types.MolarContent v5_test(fixed = false, start = 0) "Inorganic carbon coefficient for monosaccharides uptake [molC/kgCOD]";
      Types.MolarContent v6_test(fixed = false, start = 0) "Inorganic carbon coefficient for amino acids uptake [molC/kgCOD]";
      Types.MolarContent v7_test(fixed = false, start = 0) "Inorganic carbon coefficient for long chain fatty acids uptake [molC/kgCOD]";
      Types.MolarContent v8_test(fixed = false, start = 0) "Inorganic carbon coefficient for valerate uptake [molC/kgCOD]";
      Types.MolarContent v9_test(fixed = false, start = 0) "Inorganic carbon coefficient for butyrate uptake [molC/kgCOD]";
      Types.MolarContent v10_test(fixed = false, start = 0) "Inorganic carbon coefficient for propionate uptake [molC/kgCOD]";
      Types.MolarContent v11_test(fixed = false, start = 0) "Inorganic carbon coefficient acetate uptake [molC/kgCOD]";
      Types.MolarContent v12_test(fixed = false, start = 0) "Inorganic carbon coefficient hydrogen uptake [molC/kgCOD]";
      Types.MolarContent v13_test(fixed = false, start = 0) "Inorganic carbon coefficient for biomass decay [molC/kgCOD]";
      //
      /* Process rates */
      Types.MassConcRate r1_test(fixed = false, start = 0) "Disintegration rate [kgCOD/m3/s]";
      Types.MassConcRate r2_test(fixed = false, start = 0) "Carbohydrates hydrolysis rate [kgCOD/m3/s]";
      Types.MassConcRate r3_test(fixed = false, start = 0) "Proteins hydrolysis rate [kgCOD/m3/s]";
      Types.MassConcRate r4_test(fixed = false, start = 0) "Lipids hydrolysis rate [kgCOD/m3/s]";
      Types.MassConcRate r5_test(fixed = false, start = 0) "Uptake of monosaccharides rate [kgCOD/m3/s]";
      Types.MassConcRate r6_test(fixed = false, start = 0) "Uptake of amino acids rate [kgCOD/m3/s]";
      Types.MassConcRate r7_test(fixed = false, start = 0) "Uptake of long chain fatty acids rate [kgCOD/m3/s]";
      Types.MassConcRate r8_test(fixed = false, start = 0) "Uptake of valerate rate [kgCOD/m3/s]";
      Types.MassConcRate r9_test(fixed = false, start = 0) "Uptake of butyrate rate [kgCOD/m3/s]";
      Types.MassConcRate r10_test(fixed = false, start = 0) "Uptake of propionate rate [kgCOD/m3/s]";
      Types.MassConcRate r11_test(fixed = false, start = 0) "Uptake of acetate rate [kgCOD/m3/s]";
      Types.MassConcRate r12_test(fixed = false, start = 0) "Uptake of hydrogen rate [kgCOD/m3/s]";
      Types.MassConcRate r13_test(fixed = false, start = 0) "Decay of X_su rate [kgCOD/m3/s]";
      Types.MassConcRate r14_test(fixed = false, start = 0) "Decay of X_aa rate [kgCOD/m3/s]";
      Types.MassConcRate r15_test(fixed = false, start = 0) "Decay of X_fa rate [kgCOD/m3/s]";
      Types.MassConcRate r16_test(fixed = false, start = 0) "Decay of X_c4 rate [kgCOD/m3/s]";
      Types.MassConcRate r17_test(fixed = false, start = 0) "Decay of X_pro rate [kgCOD/m3/s]";
      Types.MassConcRate r18_test(fixed = false, start = 0) "Decay of X_ac rate [kgCOD/m3/s]";
      Types.MassConcRate r19_test(fixed = false, start = 0) "Decay of X_h2 rate [kgCOD/m3/s]";
      Types.MassConcRate ra4_test(fixed = false, start = 0) "Acid-base rate for valerate [kgCOD/m3/s]";
      Types.MassConcRate ra5_test(fixed = false, start = 0) "Acid-base rate for butyrate [kgCOD/m3/s]";
      Types.MassConcRate ra6_test(fixed = false, start = 0) "Acid-base rate for propionate [kgCOD/m3/s]";
      Types.MassConcRate ra7_test(fixed = false, start = 0) "Acid-base rate for acetate [kgCOD/m3/s]";
      Types.MolConcRate ra10_test(fixed = false, start = 0) "Acid-base rate for inorganic carbon [mol/m3/s]";
      Types.MolConcRate ra11_test(fixed = false, start = 0) "Acid-base rate for inorganic nitrogen [mol/m3/s]";
      Types.MassConcRate rt8_test(fixed = false, start = 0) "Gas transfer rate for hydrogen gas [kgCOD/m3/s]";
      Types.MassConcRate rt9_test(fixed = false, start = 0) "Gas transfer rate for methane [kgCOD/m3/s]";
      Types.MolConcRate rt10_test(fixed = false, start = 0) "Gas transfer rate for carbon dioxide [mol/m3/s]";
      Types.MolConcRate rt11_test(fixed = false, start = 0) "Gas transfer rate for nitrogen gas [mol/m3/s]";
      Types.MolConcRate rt12_test(fixed = false, start = 0) "Gas transfer rate for ammonia [mol/m3/s]";
      //
      /*Process inhibition */
      Types.Inhibition I_5_test(fixed = false, start = 1) "Inhibition function on process 5 (uptake of monosaccharides) [-]";
      Types.Inhibition I_6_test(fixed = false, start = 1) "Inhibition function on process 6 (uptake of amino acids) [-]";
      Types.Inhibition I_7_test(fixed = false, start = 1) "Inhibition function on process 7 (uptake of long chain fatty acids) [-]";
      Types.Inhibition I_8_test(fixed = false, start = 1) "Inhibition function on process 8 (uptake of valerate) [-]";
      Types.Inhibition I_9_test(fixed = false, start = 1) "Inhibition function on process 9 (uptake of butyrate) [-]";
      Types.Inhibition I_10_test(fixed = false, start = 1) "Inhibition function on process 10 (uptake of propionate) [-]";
      Types.Inhibition I_11_test(fixed = false, start = 1) "Inhibition function on process 11 (uptake of acetate) [-]";
      Types.Inhibition I_12_test(fixed = false, start = 1) "Inhibition function on process 12 (uptake of hydrogen) [-]";
      Types.Inhibition I_pH_aa_test(fixed = false, start = 1) "pH inhibition (processes from 5 to 10) [-]";
      Types.Inhibition I_pH_ac_test(fixed = false, start = 1) "pH inhibition (process 11) [-]";
      Types.Inhibition I_pH_h2_test(fixed = false, start = 1) "pH inhibition (process 12) [-]";
      Types.Inhibition I_in_lim_test(fixed = false, start = 1) "Inorganic nitrogen limitation (all processes, from 5 to 12) [-]";
      Types.Inhibition I_h2_fa_test(fixed = false, start = 1) "Hydrogen gas inhibition (process 7) [-]";
      Types.Inhibition I_h2_c4_test(fixed = false, start = 1) "Hydrogen gas inhibition (processes 8 and 9) [-]";
      Types.Inhibition I_h2_pro_test(fixed = false, start = 1) "Hydrogen gas inhibition (process 10) [-]";
      Types.Inhibition I_nh3_test(fixed = false, start = 1) "Free ammonia inhibition (process 11) [-]";
      //
      /* Other variables */
      Types.Kinetic_s kla_s_ch4_test(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for methane [1/s]";
      Types.Kinetic_s kla_s_h2_test(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for hydrogen [1/s]";
      Types.Kinetic_s kla_s_co2_test(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for carbon dioxide [1/s]";
      Types.Kinetic_s kla_s_nh3_test(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for ammonia [1/s]";
      Types.Kinetic_s kla_s_n2_test(fixed = false, start = 1) "Volume-specific liquid-gas transfer coefficient for nitrogen gas [1/s]";
      //  SI.Pressure P_gas(fixed = false, start = 101325) "Pressure in digester [Pa]";
      SI.VolumeFlowRate Q_gas_test(fixed = true, start = 0) "Biogas rate at operative temperature and pressure [m3/s]";
      Types.FlowRate_d Q_gas_N_test(fixed = false, start = 0) "Biogas rate at normal temperature and pressure [Nm3/d]";
      Types.FlowRate_d Q_ch4_N_test(fixed = false, start = 0) "Methane flowrate at normal conditions [m3/d]";
      Types.FlowRate_d Q_co2_N_test(fixed = false, start = 0) "Carbon dioxide flowrate at normal conditions [m3/d]";
      Types.FlowRate_d Q_h2_N_test(fixed = false, start = 0) "Hydrogen gas flowrate at normal conditions [m3/d]";
      Types.FlowRate_d Q_nh3_N_test(fixed = false, start = 0) "Ammonia flowrate at normal conditions [m3/d]";
      Types.FlowRate_d Q_n2_N_test(fixed = false, start = 0) "Nitrogen gas flowrate at normal conditions [m3/d]";
      SI.Volume V_working_test(fixed = false, start = 0) "Working volume of batch test";
      SI.PerUnit x_ch4_test(fixed = false, start = 0) "Methane fraction in dry biogas [mol/mol]";
      SI.PerUnit x_co2_test(fixed = false, start = 0) "Carbon dioxide fraction in dry biogas [mol/mol]";
      SI.PerUnit x_h2_test(fixed = false, start = 0) "Hydrogen gas fraction in dry biogas [mol/mol]";
      SI.PerUnit x_nh3_test(fixed = false, start = 0) "Ammonia fraction in dry biogas [mol/mol]";
      SI.PerUnit x_n2_test(fixed = false, start = 0) "Nitrogen gas fraction in dry biogas [mol/mol]";
      //  SI.Volume V_liq_test(fixed = true, start = V_liq_0) "Batch reactor liquid volume [m3]";
      //SI.Volume V_gas(fixed = true, start = 0) "Batch reactor  headspace [m3]";
      SI.Volume V_CH4_H2_N2_NH3_cum_test(fixed = true, start = 0) "Cumulated methane volume [m3]";
      SI.Volume V_CH4_H2_cum_test(fixed = true, start = 0) "Cumulated methane volume [m3]";
      //
      /* Stoichiometric parameters */
      SI.MassFraction f_si_xc_test(fixed = false, start = 1) "COD fraction of soluble inerts from complex particulate degradation [kgCOD/kgCOD]";
      SI.MassFraction f_xi_xc_test(fixed = false, start = 1) "COD fraction of particulate inerts from complex particulate degradation [kgCOD/kgCOD]";
      SI.MassFraction f_xch_xc_test(fixed = false, start = 1) "COD fraction of particulate carbohydrates from complex particulate degradation [kgCOD/kgCOD]";
      SI.MassFraction f_xpr_xc_test(fixed = false, start = 1) "COD fraction of particulate proteins from complex particulate degradation [kgCOD/kgCOD]";
      SI.MassFraction f_xli_xc_test(fixed = false, start = 1) "COD fraction of particulate lipids from complex particulate degradation [kgCOD/kgCOD]";
      SI.MassFraction f_h2_su_test(fixed = false, start = 1) "COD fraction of hydrogen from monosaccharide degradation; set using expression in Appendix D, ADM1 [kgCOD/kgCOD]";
      SI.MassFraction f_bu_su_test(fixed = false, start = 1) "COD fraction of butyrate from monosaccharide degradation; set using expression in Appendix D, ADM1 [kgCOD/kgCOD]";
      SI.MassFraction f_pro_su_test(fixed = false, start = 1) "COD fraction of propionate from monosaccharide degradation; set using expression in Appendix D, ADM1 [kgCOD/kgCOD]";
      SI.MassFraction f_ac_su_test(fixed = false, start = 1) "COD fraction of actetate from monosaccharide degradation; set using expression in Appendix D, ADM1 [kgCOD/kgCOD]";
      //
      /* VFA acid-base constants at standart T and P */
      SI.MolarDensity Ka_va_test(fixed = false, start = 0) "Acid-base constant for valerate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_bu_test(fixed = false, start = 0) "Acid-base constant for butyrate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_pro_test(fixed = false, start = 0) "Acid-base constant for propionate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_ac_test(fixed = false, start = 0) "Acid-base constant for acetate at standard T and P [mol/m3]";
      //
      /*Temperature dependant parameters */
      Types.Kinetic_s k_dis_T_test(fixed = false, start = 0) "Disintegration first order constant, corrected for time [1/s]";
      Types.Kinetic_s k_hyd_ch_T_test(fixed = false, start = 0) "Carbohydrate hydrolysis first order constant, corrected for T and time [1/s]";
      Types.Kinetic_s k_hyd_pr_T_test(fixed = false, start = 0) "Protein hydrolysis first order constant, corrected for T and time [1/s]]";
      Types.Kinetic_s k_hyd_li_T_test(fixed = false, start = 0) "Lipid hydrolysis first order constant, corrected for T and time [1/s]";
      Types.Kinetic_s k_m_su_T_test(fixed = false, start = 0) "Maximum uptake rate for monosaccharide degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_aa_T_test(fixed = false, start = 0) "Maximum uptake rate amino acid degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_fa_T_test(fixed = false, start = 0) "Maximum uptake rate for long chain fatty acid degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_c4_T_test(fixed = false, start = 0) "Maximum uptake rate for c4 degrading organisms, corrected for time, correction for T not found [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_pro_T_test(fixed = false, start = 0) "Maximum uptake rate for propionate degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_ac_T_test(fixed = false, start = 0) "Maximum uptake rate for acetate degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      Types.Kinetic_s k_m_h2_T_test(fixed = false, start = 0) "Maximum uptake rate for hydrogen degrading organisms, corrected for T and time [kgCODs/kgCODx/s]";
      SI.MassConcentration Ks_su_T_test(fixed = false, start = 0) "Half saturation constant for monosaccharide degrading organisms, corrected for T [kgCOD/m3]";
      SI.MassConcentration Ks_aa_T_test(fixed = false, start = 0) "Half saturation constant for amino acid degrading organisms, corrected for T [kgCOD/m3]";
      SI.MassConcentration Ks_fa_T_test(fixed = false, start = 0) "Half saturation constant for long chain fatty acid degrading organisms [kgCOD/m3]";
      SI.MassConcentration Ks_c4_T_test(fixed = false, start = 0) "Half saturation constant for c4 degrading organisms, correction for T not found [kgCOD/m3]";
      SI.MassConcentration Ks_pro_T_test(fixed = false, start = 0) "Half saturation constant for propionate degrading organisms, corrected for T [kgCOD/m3]";
      SI.MassConcentration Ks_ac_T_test(fixed = false, start = 0) "Half saturation constant for acetate degrading organisms, corrected for T  [kgCOD/m3]";
      SI.MassConcentration Ks_h2_T_test(fixed = false, start = 0) "Half saturation constant for hydrogen degrading organisms, corrected for T [kgCOD/m3]";
      Types.Kinetic_s k_dec_su_T_test(fixed = false, start = 0) "Decay rate for monosaccharide degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_aa_T_test(fixed = false, start = 0) "Decay rate for amino acid degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_fa_T_test(fixed = false, start = 0) "Decay rate for long chain fatty acid degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_c4_T_test(fixed = false, start = 0) "Decay rate for c4 degrading organisms, corrected for time, correction for T not found [1/s]";
      Types.Kinetic_s k_dec_pro_T_test(fixed = false, start = 0) "Decay rate for propionate degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_ac_T_test(fixed = false, start = 0) "Decay rate for acetate degrading organisms, corrected for T and time [1/s]";
      Types.Kinetic_s k_dec_h2_T_test(fixed = false, start = 0) "Decay rate for hydrogen degrading organisms, corrected for T and time [1/s]";
      SI.MolarDensity Ka_co2_test(fixed = false, start = 4.94e-7/1000) "Acid-base constant for carbonic acid at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_nh3_test(fixed = false, start = 1.11e-9/1000) "Acid-base constant for free ammonia at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h2o_test(fixed = false, start = 2.08e-14/1000) "Acid-base constant for water at operative temperature and standard pressure [mol/m3]";
      Types.Henry KH_ch4_test(fixed = false, start = 0.00116/100) "Henry constant for methane at operative temperature and standard pressure [mol/m3/Pa]";
      Types.Henry KH_co2_test(fixed = false, start = 0.0271/100) "Henry constant for carbon dioxide at operative temperature and standard pressure [mol/m3/Pa]";
      Types.Henry KH_h2_test(fixed = false, start = 7.38e-4/100) "Henry constant for hydrogen gas at operative temperature and standard pressure [mol/m3/Pa]";
      Types.Henry KH_nh3_test(fixed = false, start = 61/100) "Henry constant for ammonia at operative temperature and standard pressure [mol/m3/Pa]";
      Types.Henry KH_n2_test(fixed = false, start = 61/100) "Henry constant for nitrogen gas at operative temperature and standard pressure [mol/m3/Pa]";
      //
      /* Biomasses */
      SI.MassConcentration X_su_test(fixed = true) "Monosaccharide degrading organisms concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_aa_test(fixed = true) "Amino Acid degrading organisms concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_fa_test(fixed = true) "Long chain fatty acid degrading organisms concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_c4_test(fixed = true) "C4 degrading organisms concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_pro_test(fixed = true) "Propionate degrading organisms concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_ac_test(fixed = true) "Acetate degrading organisms concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_h2_test(fixed = true) "Hydrogen degrading organisms concentration in batch mixture [kgCOD/m3]";
      //
      /* Organic particulate components */
      SI.MassConcentration X_c_test(fixed = true) "Complex particulate concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_i_test(fixed = true) "Particulate inerts concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_ch_test(fixed = true) "Particulate carbohydrates concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_pr_test(fixed = true) "Particulate proteins concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration X_li_test(fixed = true) "Particulate lipids concentration in batch mixture [kgCOD/m3]";
      //
      /* Organic soluble components */
      SI.MassConcentration S_i_test(fixed = true) "Soluble inerts concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_su_test(fixed = true) "Soluble monosaccharides concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_aa_test(fixed = true) "Soluble amino acids concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_fa_test(fixed = true) "Soluble long chain fatty acids concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_va_test(fixed = true) "Valeric acid concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_bu_test(fixed = true) "Butyric concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_pro_test(fixed = true) "Propionic acid concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_ac_test(fixed = true) "Acetic acid concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_vam_test(fixed = true) "Valerate ion concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_bum_test(fixed = true) "Butyrate ion concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_prom_test(fixed = true) "Propionate ion concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_acm_test(fixed = true) "Acetate ion inerts concentration in batch mixture [kgCOD/m3]";
      //
      /* Inorganic soluble components */
      SI.MassConcentration S_h2_test(fixed = true) "Soluble hydrogen concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_ch4_test(fixed = true) "Soluble methane concentration in batch mixture [kgCOD/m3]";
      SI.MolarDensity S_ic_test(fixed = true) "Soluble inorganic carbon concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_in_test(fixed = true) "Soluble inorganic nitrogen concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_cat_test(fixed = true) "Soluble cationic ion concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_an_test(fixed = true) "Soluble anionic ions concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_hco3_test(fixed = true) "Soluble bicarbonate ion concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_nh3_test(fixed = true) "Soluble free ammonia concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_nh4_test(fixed = false) "Soluble ammonium ion concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_co2_test(fixed = false) "Soluble carbon dioxide concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_n2_test(fixed = true, start = 0.0137994215648506) "Soluble nitrogen gas concentration in batch mixture [mol/m3]";
      SI.PerUnit pH_test(fixed = false, start = 7.11) "Digestate pH [-]";
      SI.MolarDensity S_h_test(fixed = true) "Hydrogen ion concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_oh_test(fixed = false) "Hydroxide ion concentration in batch mixture [mol/m3]";
      //
      /* Gas components */
      SI.MassConcentration S_gas_h2_test(fixed = false, start = 0.0000409814975443494*1000) "Soluble gaseous hydrogen concentration in batch mixture [kgCOD/m3]";
      SI.MassConcentration S_gas_ch4_test(fixed = false, start = 1.06438615874316*1000) "Soluble gaseous methane concentration in batch mixture [kgCOD/m3]";
      SI.MolarDensity S_gas_co2_test(fixed = false, start = 0.0211180300722813*1000) "Soluble gaseous carbon dioxide concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_gas_nh3_test(fixed = false, start = 0.0211180300722813*1000) "Soluble gaseous ammonia concentration in batch mixture [mol/m3]";
      SI.MolarDensity S_gas_n2_test(fixed = false, start = 0.0211180300722813*1000) "Soluble gaseous nitrogen gas concentration in batch mixture [mol/m3]";
      SI.Pressure p_gas_h2_test(fixed = false, start = 1.2245) "Hydrogen gas partial pressure [Pa]";
      SI.Pressure p_gas_ch4_test(fixed = true, start = 10) "Methane partial pressure [Pa]";
      SI.Pressure p_gas_co2_test(fixed = true, start = 70) "Carbon dioxide partial pressure [Pa]";
      SI.Pressure p_gas_nh3_test(fixed = true, start = 1e-5) "Ammonia partial pressure [Pa]";
      SI.Pressure p_gas_n2_test(fixed = true, start = 95000) "Nitrogen gas partial pressure [Pa]";
      SI.Pressure p_gas_h2o_test(fixed = true, start = 5570) "Vapour partial pressure [Pa]";
      SI.Pressure P_gas_test(fixed = true, start = 101325) "Total pressure [Pa]";
    end StateVariables_BatchTest;

    record OtherVariables_Feed1
      Types.FlowRate_d Q_in1_d(fixed = false, start = 0) "Influent flow rate of substrate #1 [m3/d]";
      Types.MassContent TS_in1(fixed = false, start = 0) "Total solid content in substrate #1 [gTS/kg]";
      Types.MassContent VS_in1(fixed = false, start = 0) "Volatile solid content in substrate #1 [gVS/kg]";
      Types.MassContent pVS_in1(fixed = false, start = 0) "Particulate volatile solid content in substrate #1 [gVSp/kgp]";
      Types.MassContent sVS_in1(fixed = false, start = 0) "Soluble volatile solid content in substrate #1 [gVSs/kgs]";
      Types.MassConcentration_g tCH_in1(fixed = false, start = 0) "Total carbohydrates concentration in substrate #1 [gGlu/m3]";
      Types.MassContent tPR_in1(fixed = false, start = 0) "TKN concentration in substrate #1 to compute total proteins concentration [gN/kg]";
      Types.MassContent pLI_pVS_in1(fixed = false, start = 0) "Particulate lipids content in substrate #1 per unit mass of particulate VS [gLI/kgVSp]";
      Types.MassConcentration_g ac_in1(fixed = false, start = 0) "Acetic acid concentration in substrate #1 [g/m3]";
      Types.MassConcentration_g pro_in1(fixed = false, start = 0) "Propionic acid concentration in substrate #1 [g/m3]";
      //Types.VSConcentration Sludge_concentrations.y[9](fixed = false, start = 0);
      Types.MassConcentration_g isobu_in1(fixed = false, start = 0) "Iso-butyric acid concentration in substrate #1 [g/m3]";
      Types.MassConcentration_g bu_in1(fixed = false, start = 0) "Butyric acid concentration in substrate #1 [g/m3]";
      Types.MassConcentration_g isova_in1(fixed = false, start = 0) "Iso-valeric acid concentration in substrate #1 [g/m3]";
      Types.MassConcentration_g va_in1(fixed = false, start = 0) "Valeric acid concentration in substrate #1 [g/m3]";
      SI.PerUnit pH_in1(fixed = false, start = 0) "pH of substrate #1 [-]";
      Types.MassConcentration_g TAN_in1(fixed = false, start = 0) "Total Ammoniacal Nitrogen concentration in substrate #1 [gN/m3]";
      Types.MassConcentration_g TP_in1(fixed = false, start = 0) "Total Phosporous concentration in substrate #1 [gP/m3]";
      Types.MassConcentration_g Alk_in1(fixed = false, start = 0) "Alkalinity concentration in substrate #1 [gCaCO3/m3]";
      Types.BMP tBMP_VS_in1(fixed = false, start = 0) "BMP of substrate #1 on VS basis [LCH4/kgVS]";
      Types.MassContent pLI_VS_in1(fixed = false, start = 0) "Particulate lipids content in substrate #1 per unit mass of VS [gLI/kgVS]";
      Types.MassConcentration_g tLI_in1(fixed = false, start = 0) "Total lipids concentration in substrate #1 [g/m3]";
      SI.MassFraction alpha_in1(fixed = false, start = 0) "Centrifuge efficiency for substrate #2 [kgFMs/kgFM]";
      SI.MassConcentration COD_VFA_in1(fixed = false, start = 0) "Total VFA concentration in substrate #1 as COD [kgCOD/m3]";
      SI.MassFraction u_in1(fixed = false, start = 0) "Moisture content in substrate #1 [kgH20/kg]";
      SI.MassFraction v_in1(fixed = false, start = 0) "Volatile fraction of total solids in substrate #1 [kgVS/kgTS]";
      SI.Density d_in1(fixed = false, start = 0) "Density of substrate #1 [kg/m3]";
      SI.MassConcentration tCOD_in1(fixed = false, start = 0) "Total COD concentration in substrate #1 (as sum of total CH, PR, LI and VFA) [kgCOD/m3]";
      SI.MassConcentration pCOD_in1(fixed = false, start = 0) "Particulate COD concentration in substrate #1 (as difference between total and VFA)[kgCOD/m3]";
      Types.BMP tBMP_COD_in1(fixed = false, start = 0) "BMP of substrate #1 on COD basis [LCH4/kgCOD]";
      SI.MassFraction fd_tCOD_in1(fixed = false, start = 0) "Degradable fraction of total COD for substrate #1 [kgCOD/kgCOD]";
      SI.MassFraction fd_pCOD_in1(fixed = false, start = 0) "Degradable fraction of particulate COD for substrate #1 [kgCOD/kgCOD]";
      SI.MassFraction f_xi_xc_in1(fixed = false, start = 0) "COD fraction of particulate inerts from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      SI.MassFraction f_xi_li_xc_in1(fixed = false, start = 0) "COD fraction of lipidic particulate inerts from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      SI.MassFraction f_xli_xi_in1(fixed = false, start = 0) "COD fraction of lipids from particulate inerts Xi, in substrate #1 [kgCOD/kgCOD]";
      SI.MolarDensity S_h_in1(fixed = false, start = 0) "Hydrogen ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_oh_in1(fixed = false, start = 0) "Hydroxide ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_ac_mol_in1(fixed = false, start = 0) "Acetic acid molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_pro_mol_in1(fixed = false, start = 0) "Propionic acid molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_bu_mol_in1(fixed = false, start = 0) "Butyric acid molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_va_mol_in1(fixed = false, start = 0) "Valeric acid molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_ac_ion_in1(fixed = false, start = 0) "Acetate ion molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_pro_ion_in1(fixed = false, start = 0) "Propionate ion molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_bu_ion_in1(fixed = false, start = 0) "Butyric ion molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_va_ion_in1(fixed = false, start = 0) "Valerate ion molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity Alk_mol_in1(fixed = false, start = 0) "Alkalinity molar concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_hco3_in1(fixed = false, start = 0) "Soluble bicarbonate ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_co3_in1(fixed = false, start = 0) "Soluble carbonate ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_co2_in1(fixed = false, start = 0) "Soluble dissolved carbon dioxide ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_po4_in1(fixed = false, start = 0) "Soluble orto phosphate ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_hpo4_in1(fixed = false, start = 0) "Soluble hydrogen phosphate ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_h2po4_in1(fixed = false, start = 0) "Soluble dihydrogen phosphate ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_h3po4_in1(fixed = false, start = 0) "Soluble phosphoric acid concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_nh4_in1(fixed = false, start = 0) "Soluble ammonium ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_nh3_in1(fixed = false, start = 0) "Soluble free ammonia concentration in substrate #1 [mol/m3]";
      //  SI.MassConcentration S_su_in1(fixed = false, start = 0) "Soluble monosaccharides concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration S_aa_in1(fixed = false, start = 0) "Soluble amino acids concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration S_fa_in1(fixed = false, start = 0) "Soluble long chain fatty acids concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration S_va_in1(fixed = false, start = 0) "Valeric acid concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration S_bu_in1(fixed = false, start = 0) "Butyric concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration S_pro_in1(fixed = false, start = 0) "Propionic acid concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration S_ac_in1(fixed = false, start = 0) "Acetic acid concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration S_h2_in1(fixed = false, start = 0) "Soluble hydrogen gas concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration S_ch4_in1(fixed = false, start = 0) "Soluble methane concentration in substrate #1 [kgCOD/m3]";
      //  SI.MolarDensity S_ic_in1(fixed = false, start = 0) "Soluble inorganic carbon concentration in substrate #1 [mol/m3]";
      //  SI.MolarDensity S_in_in1(fixed = false, start = 0) "Soluble inorganic nitrogen concentration in substrate #1 [mol/m3]";
      //  SI.MassConcentration S_i_in1(fixed = false, start = 0) "Soluble inerts concentration in substrate #1 [kgCOD/m3]";
      //  SI.MolarDensity S_cat_in1(fixed = false, start = 0) "Soluble cationic ion concentration in substrate #1 [mol/m3]";
      //  SI.MolarDensity S_an_in1(fixed = false, start = 0) "Soluble anionic ions concentration in substrate #1 [mol/m3]";
      //  SI.MassConcentration X_c_in1(fixed = false, start = 0) "Complex particulate concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_ch_in1(fixed = false, start = 0) "Particulate carbohydrates concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_pr_in1(fixed = false, start = 0) "Particulate proteins concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_li_in1(fixed = false, start = 0) "Particulate lipids concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_su_in1(fixed = false, start = 0) "Monosaccharide degrading organisms concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_aa_in1(fixed = false, start = 0) "Amino Acid degrading organisms concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_fa_in1(fixed = false, start = 0) "Long chain fatty acid degrading organisms concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_c4_in1(fixed = false, start = 0) "C4 degrading organisms concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_pro_in1(fixed = false, start = 0) "Propionate degrading organisms concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_ac_in1(fixed = false, start = 0) "Acetate degrading organisms concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_h2_in1(fixed = false, start = 0) "Hydrogen degrading organisms concentration in substrate #1 [kgCOD/m3]";
      //  SI.MassConcentration X_i_in1(fixed = false, start = 0) "Particulate inerts concentration in substrate #1 [kgCOD/m3]";
      /* Temperature dependent parameters */
      SI.MolarDensity Ka_co2_in1(fixed = false, start = 0) "Acid-base constant for carbonic acid at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_hco3_in1(fixed = false, start = 0) "Acid-base constant for bicarbonate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h3po4_in1(fixed = false, start = 0) "Acid-base constant for phosphoric acid at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h2po4_in1(fixed = false, start = 0) "Acid-base constant for dihydrogen phospate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_hpo4_in1(fixed = false, start = 0) "Acid-base constant for hydrogen phospate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_nh3_in1(fixed = false, start = 0) "Acid-base constant for free ammonia at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h2o_in1(fixed = false, start = 0) "Acid-base constant for water at operative temperature and standard pressure [mol/m3]";
      //
      /* VFA acid-base constants at standart T and P */
      SI.MolarDensity Ka_va_in1(fixed = false, start = 0) "Acid-base constant for valerate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_bu_in1(fixed = false, start = 0) "Acid-base constant for butyrate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_pro_in1(fixed = false, start = 0) "Acid-base constant for propionate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_ac_in1(fixed = false, start = 0) "Acid-base constant for acetate at standard T and P [mol/m3]";
    end OtherVariables_Feed1;

    record OtherVariables_Feed2
      Types.FlowRate_d Q_in2_d(fixed = false, start = 0) "Influent flow rate of substrate #2 [m3/d]";
      Types.MassContent TS_in2(fixed = false, start = 0) "Total solid content in substrate #2 [gTS/kg]";
      Types.MassContent VS_in2(fixed = false, start = 0) "Volatile solid content in substrate #2 [gVS/kg]";
      Types.MassContent pVS_in2(fixed = false, start = 0) "Particulate volatile solid content in substrate #2 [gVSp/kgp]";
      Types.MassContent sVS_in2(fixed = false, start = 0) "Soluble volatile solid content in substrate #2 [gVSs/kgs]";
      SI.MassConcentration sCOD_in2(fixed = false, start = 0) "Soluble COD concentration in substrate #2 [kgCOD/m3]";
      Types.MassConcentration_g tCH_in2(fixed = false, start = 0) "Total carbohydrates concentration in substrate #2 [gGlu/m3]";
      Types.MassConcentration_g sCH_in2(fixed = false, start = 0) "Soluble carbohydrates concentration in substrate #2 [gGlu/m3]";
      Types.MassConcentration_g tPR_in2(fixed = false, start = 0) "Total proteins concentration in substrate, BCA method #2 [gBSA/m3]";
      Types.MassConcentration_g sPR_in2(fixed = false, start = 0) "Total proteins concentration in substrate, BCA method #2 [gBSA/m3]";
      Types.MassContent pLI_pVS_in2(fixed = false, start = 0) "Particulate lipids content in substrate #2 per unit mass of particulate VS [gLI/kgVSp]";
      Types.MassConcentration_g ac_in2(fixed = false, start = 0) "Acetic acid concentration in substrate #2 [g/m3]";
      Types.MassConcentration_g pro_in2(fixed = false, start = 0) "Propionic acid concentration in substrate #2 [g/m3]";
      Types.MassConcentration_g isobu_in2(fixed = false, start = 0) "Iso-butyric acid concentration in substrate #2 [g/m3]";
      Types.MassConcentration_g bu_in2(fixed = false, start = 0) "Butyric acid concentration in substrate #2 [g/m3]";
      Types.MassConcentration_g isova_in2(fixed = false, start = 0) "Iso-valeric acid concentration in substrate #2 [g/m3]";
      Types.MassConcentration_g va_in2(fixed = false, start = 0) "Valeric acid concentration in substrate #2 [g/m3]";
      SI.PerUnit pH_in2(fixed = false, start = 0) "pH of substrate #2 [-]";
      Types.MassConcentration_g TAN_in2(fixed = false, start = 0) "Total Ammoniacal nitrogen concentration in substrate #2 [gN/m3]";
      Types.MassConcentration_g TP_in2(fixed = false, start = 0) "Total Phosporous concentration in substrate #2 [gP/m3]";
      Types.MassConcentration_g Alk_in2(fixed = false, start = 0) "Alkalinity concentration in substrate #2 [gCaCO3/m3]";
      SI.MassFraction alpha_in2(fixed = false, start = 0) "Centrifuge efficiency for substrate #2 [kgFMs/kgFM]";
      SI.MassConcentration COD_VFA_in2(fixed = false, start = 0) "Total VFA concentration in substrate #2 as COD [kgCOD/m3]";
      SI.MassFraction u_in2(fixed = false, start = 0) "Moisture content in substrate #2 [kgH20/kg]";
      SI.MassFraction v_in2(fixed = false, start = 0) "Volatile fraction of total solids in substrate #2 [kgVS/kgTS]";
      SI.Density d_in2(fixed = false, start = 0) "Density of substrate #2 [kg/m3]";
      Types.MassContent pLI_VS_in2(fixed = false, start = 0) "Particulate lipids content in substrate #2 per unit mass of VS [gLI/kgVS]";
      Types.MassConcentration_g tLI_in2(fixed = false, start = 0) "Total lipids concentration in substrate #2 [g/m3]";
      SI.MassConcentration tCOD_in2(fixed = false, start = 0) "Total COD concentration in substrate #2 (as sum of total CH, PR, LI and VFA) [kgCOD/m3]";
      SI.MassConcentration pCOD_in2(fixed = false, start = 0) "Particulate COD concentration in substrate #2 (as difference between total and VFA)[kgCOD/m3]";
      SI.MolarDensity S_h_in2(fixed = false, start = 0) "Hydrogen ion concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_oh_in2(fixed = false, start = 0) "Hydroxide ion concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_ac_mol_in2(fixed = false, start = 0) "Acetic acid molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_pro_mol_in2(fixed = false, start = 0) "Propionic acid molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_bu_mol_in2(fixed = false, start = 0) "Butyric acid molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_va_mol_in2(fixed = false, start = 0) "Valeric acid molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_ac_ion_in2(fixed = false, start = 0) "Acetate ion molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_pro_ion_in2(fixed = false, start = 0) "Propionate ion molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_bu_ion_in2(fixed = false, start = 0) "Butyric ion molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_va_ion_in2(fixed = false, start = 0) "Valerate ion molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity Alk_mol_in2(fixed = false, start = 0) "Alkalinity molar concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_hco3_in2(fixed = false, start = 0) "Soluble bicarbonate ion concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_co3_in2(fixed = false, start = 0) "Soluble carbonate ion concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_co2_in2(fixed = false, start = 0) "Soluble dissolved carbon dioxide ion concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_po4_in2(fixed = false, start = 0) "Soluble orto phosphate ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_hpo4_in2(fixed = false, start = 0) "Soluble hydrogen phosphate ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_h2po4_in2(fixed = false, start = 0) "Soluble dihydrogen phosphate ion concentration in substrate #1 [mol/m3]";
      SI.MolarDensity S_h3po4_in2(fixed = false, start = 0) "Soluble phosphoric acid concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_nh4_in2(fixed = false, start = 0) "Soluble ammonium ion concentration in substrate #2 [mol/m3]";
      SI.MolarDensity S_nh3_in2(fixed = false, start = 0) "Soluble free ammonia concentration in substrate #2 [mol/m3]";
      //  SI.MassConcentration S_su_in2(fixed = false, start = 0) "Soluble monosaccharides concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration S_aa_in2(fixed = false, start = 0) "Soluble amino acids concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration S_fa_in2(fixed = false, start = 0) "Soluble long chain fatty acids concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration S_va_in2(fixed = false, start = 0) "Valeric acid concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration S_bu_in2(fixed = false, start = 0) "Butyric concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration S_pro_in2(fixed = false, start = 0) "Propionic acid concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration S_ac_in2(fixed = false, start = 0) "Acetic acid concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration S_h2_in2(fixed = false, start = 0) "Soluble hydrogen gas concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration S_ch4_in2(fixed = false, start = 0) "Soluble methane concentration in substrate #2 [kgCOD/m3]";
      //  SI.MolarDensity S_ic_in2(fixed = false, start = 0) "Soluble inorganic carbon concentration in substrate #2 [mol/m3]";
      //  SI.MolarDensity S_in_in2(fixed = false, start = 0) "Soluble inorganic nitrogen concentration in substrate #2 [mol/m3]";
      //  SI.MassConcentration S_i_in2(fixed = false, start = 0) "Soluble inerts concentration in substrate #2 [kgCOD/m3]";
      //  SI.MolarDensity S_cat_in2(fixed = false, start = 0) "Soluble cationic ion concentration in substrate #2 [mol/m3]";
      //  SI.MolarDensity S_an_in2(fixed = false, start = 0) "Soluble anionic ions concentration in substrate #2 [mol/m3]";
      //  SI.MassConcentration X_c_in2(fixed = false, start = 0) "Complex particulate concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_ch_in2(fixed = false, start = 0) "Particulate carbohydrates concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_pr_in2(fixed = false, start = 0) "Particulate proteins concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_li_in2(fixed = false, start = 0) "Particulate lipids concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_su_in2(fixed = false, start = 0) "Monosaccharide degrading organisms concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_aa_in2(fixed = false, start = 0) "Amino Acid degrading organisms concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_fa_in2(fixed = false, start = 0) "Long chain fatty acid degrading organisms concentration in substrate #21 [kgCOD/m3]";
      //  SI.MassConcentration X_c4_in2(fixed = false, start = 0) "C4 degrading organisms concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_pro_in2(fixed = false, start = 0) "Propionate degrading organisms concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_ac_in2(fixed = false, start = 0) "Acetate degrading organisms concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_h2_in2(fixed = false, start = 0) "Hydrogen degrading organisms concentration in substrate #2 [kgCOD/m3]";
      //  SI.MassConcentration X_i_in2(fixed = false, start = 0) "Particulate inerts concentration in substrate #2 [kgCOD/m3]";
      //
      /* Temperature dependent parameters */
      SI.MolarDensity Ka_co2_in2(fixed = false, start = 0) "Acid-base constant for carbonic acid at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_hco3_in2(fixed = false, start = 0) "Acid-base constant for bicarbonate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h3po4_in2(fixed = false, start = 0) "Acid-base constant for phosphoric acid at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h2po4_in2(fixed = false, start = 0) "Acid-base constant for dihydrogen phospate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_hpo4_in2(fixed = false, start = 0) "Acid-base constant for hydrogen phospate at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_nh3_in2(fixed = false, start = 0) "Acid-base constant for free ammonia at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h2o_in2(fixed = false, start = 0) "Acid-base constant for water at operative temperature and standard pressure [mol/m3]";
      //
      /* VFA acid-base constants at standart T and P */
      SI.MolarDensity Ka_va_in2(fixed = false, start = 0) "Acid-base constant for valerate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_bu_in2(fixed = false, start = 0) "Acid-base constant for butyrate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_pro_in2(fixed = false, start = 0) "Acid-base constant for propionate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_ac_in2(fixed = false, start = 0) "Acid-base constant for acetate at standard T and P [mol/m3]";
    end OtherVariables_Feed2;

    record OtherVariables_MassBalance
      //  Real HRT(fixed = false, start = 0)"Hyraulic Retention Time [d], qui servirebbe aggiungere una Q cumulata al giorno";
      //Real OLR(fixed = false, start = 0) "Organic Loading Rate [kgCOD/m3/d], qui servirebbe aggiungere una Q cumulata al giorno";
      SI.MassConcentration COD_S(fixed = false, start = 0) "Soluble COD concentration in digestate [kgCOD/m3]";
      SI.MassConcentration COD_X(fixed = false, start = 0) "Particulate COD concentration in digestate [kgCOD/m3]";
      SI.MassFlowRate COD_balance_in(fixed = false, start = 0) "Mass of COD inflow the digester";
      SI.Mass COD_balance_in_cum(fixed = true, start = 0) "Cumulated mass of COD inflow the digester";
      SI.MassFlowRate COD_balance_out(fixed = false, start = 0) "Mass of COD in digestate outflow the digester";
      SI.Mass COD_balance_out_cum(fixed = true, start = 0) "Cumulated mass of COD in digestate outflow the digester";
      SI.MassFlowRate COD_balance_gas(fixed = false, start = 0) "Mass of COD in biogas outflow the digester";
      SI.Mass COD_balance_gas_cum(fixed = true, start = 0) "Cumulated mass of COD in biogas outflow the digester";
      SI.MolarFlowRate IC_balance_in(fixed = false, start = 0) "Mass of inorganic carbon inflow the digester";
      Types.Mole IC_balance_in_cum(fixed = true, start = 0) "Cumulated mass of inorganic carbon inflow the digester";
      SI.MolarFlowRate IC_balance_out(fixed = false, start = 0) "Mass of inorganic carbon in digestate outflow the digester";
      Types.Mole IC_balance_out_cum(fixed = true, start = 0) "Cumulated mass of inorganic carbon in digestate outflow the digester";
      SI.MolarFlowRate IC_balance_gas(fixed = false, start = 0) "Mass of inorganic carbon in biogas outflow the digester";
      Types.Mole IC_balance_gas_cum(fixed = true, start = 0) "Cumulated mass of inorganic carbon in biogas outflow the digester";
      SI.MolarFlowRate IN_balance_in(fixed = false, start = 0) "Mass of inorganic nitrogen inflow the digester";
      Types.Mole IN_balance_in_cum(fixed = true, start = 0) "Cumulated mass of inorganic nitrogen inflow the digester";
      SI.MolarFlowRate IN_balance_out(fixed = false, start = 0) "Mass of inorganic nitrogen in digestate outflow the digester";
      Types.Mole IN_balance_out_cum(fixed = true, start = 0) "Cumulated mass of inorganic nitrogen in digestate outflow the digester";
      SI.MolarFlowRate IN_balance_gas(fixed = false, start = 0) "Mass of inorganic nitrogen in biogas outflow the digester";
      Types.Mole IN_balance_gas_cum(fixed = true, start = 0) "Cumulated mass of inorganic nitrogen in biogas outflow the digester";
      annotation(
        Documentation(info = "<html><p> This record contains other variables used for calculating mass balances. </p>
    <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
    <p> Last review: <em> January 22, 2021 </em></p></html>"));
    end OtherVariables_MassBalance;

    record OtherVariables_Discharge
      SI.MassFraction f_xli_xc_out(fixed = false, start = 0) "COD fraction of lipids from complex particulate Xc, in digestate [kgCOD/kgCOD]";
      SI.MassFraction f_xli_xi_out(fixed = false, start = 0) "COD fraction of lipids from particulate inerts Xi, in digestate [kgCOD/kgCOD]";
      SI.MassFraction f_si_li_out(fixed = false, start = 0) "COD fraction of lipids from soluble inerts Si, in digestate [kgCOD/kgCOD]";
      SI.MassFraction f_xbac_li_out(fixed = false, start = 0) "COD fraction of lipids in biomass [kgCOD/kgCOD]";
      Types.MassConversion COD_VS_Xi_out(fixed = false, start = 0) "COD conversion factor for effluent particulate inerts, Xi [kgCOD/kgVS]";
      Types.MassConversion COD_VS_Si_out(fixed = false, start = 0) "COD conversion factor for effluent soluble inerts, Si [kgCOD/kgVS]";
      Types.MassConcentration_g Alk_out(fixed = false, start = 0) "Alkalinity concentration in digestate [gCaCO3/m3]";
      Types.MassConcentration_g VFA_out(fixed = false, start = 0) "Total Volatile fatty acid concentration in digestate [g/m3]";
      Types.MassContent VS_out(fixed = false, start = 0) "Volatile solid content in digestate [gVS/kg]";
      Types.MassConcentration_g TAN_out(fixed = false, start = 0) "Total Ammoniacal Nitrogen concentration in digestate [gN/m3]";
      SI.MassConcentration COD_tot_out(fixed = false, start = 0) "Total COD in digestate [kgCOD/m3]";
      Types.MassConcentration_g CH_tot_out(fixed = false, start = 0) "Total carbohydrates concentration in digestate [gGlu/m3]";
      Types.MassConcentration_g PR_BCA_tot_out(fixed = false, start = 0) "Total proteins concentration in digestate, BCA method [gBSA/m3]";
      Types.MassConcentration_g PR_TKN_tot_out(fixed = false, start = 0) "Total proteins concentration in digestate, TKN method [gN/m3]";
      Types.MassConcentration_g LI_tot_out(fixed = false, start = 0) "Total lipids concentration in digestate [g/m3]";
      Types.MassConcentration_g CH_sol_out(fixed = false, start = 0) "Soluble carbohydrates concentration in digestate [gGlu/m3]";
      Types.MassConcentration_g PR_BCA_sol_out(fixed = false, start = 0) "Soluble proteins concentration in digestate, BCA method [gBSA/m3]";
      Types.MassConcentration_g PR_TKN_sol_out(fixed = false, start = 0) "Soluble proteins concentration in digestate, TKN method [gN/m3]";
      Types.MassConcentration_g LI_sol_out(fixed = false, start = 0) "Soluble lipids concentration in digestate [g/m3]";
      annotation(
        Documentation(info = "<html><p> This record contains other variables used for calculating output aggregated variables. </p>
    <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
    <p> Last review: <em> January 22, 2021 </em></p></html>"));
    end OtherVariables_Discharge;

    record OtherVariables_GasMeter
      SI.PerUnit x_ch4(fixed = false, start = 0) "Methane fraction in dry biogas [mol/mol]";
      SI.PerUnit x_co2(fixed = false, start = 0) "Carbon dioxide fraction in dry biogas [mol/mol]";
      SI.PerUnit x_h2(fixed = false, start = 0) "Hydrogen fraction in dry biogas [mol/mol]";
      SI.PerUnit x_nh3(fixed = false, start = 0) "Ammonia fraction in dry biogas [mol/mol]";
      Types.FlowRate_d Q_ch4_N(fixed = false, start = 0) "Methane flowrate at normal conditions [m3/d]";
      Types.FlowRate_d Q_co2_N(fixed = false, start = 0) "Carbon dioxide flowrate at normal conditions [m3/d]";
      Types.FlowRate_d Q_h2_N(fixed = false, start = 0) "Hydrogen flowrate at normal conditions [m3/d]";
      Types.FlowRate_d Q_nh3_N(fixed = false, start = 0) "Ammonia flowrate at normal conditions [m3/d]";
    end OtherVariables_GasMeter;

    record OtherVariables_BatchTestPreparation
      SI.Volume V_working_test(fixed = false, start = 0) "Batch reactor working volume [m3]";
      //
      /*  Speciation of ionic components in substrate solution */
      SI.MolarDensity S_h_substrate_test(fixed = false, start = 0) "Hydrogen ion concentration in substrate [mol/m3]";
      SI.MolarDensity S_oh_substrate_test(fixed = false, start = 0) "Hydroxide ion concentration in substrate [mol/m3]";
      SI.MolarDensity S_ac_mol_substrate_test(fixed = false, start = 0) "Acetic acid molar concentration in substrate [mol/m3]";
      SI.MolarDensity S_acm_mol_substrate_test(fixed = false, start = 0) "Acetate ion molar concentration in substrate [mol/m3]";
      SI.MassConcentration S_ac_substrate_test(fixed = false, start = 0) "Acetic acid concentration in substrate [kgCOD/m3]";
      SI.MassConcentration S_acm_substrate_test(fixed = false, start = 0) "Acetate ion concentration in substrate [kgCOD/m3]";
      SI.MolarDensity S_pro_mol_substrate_test(fixed = false, start = 0) "Propionic acid molar concentration in substrate [mol/m3]";
      SI.MolarDensity S_prom_mol_substrate_test(fixed = false, start = 0) "Propionic ion molar concentration in substrate [mol/m3]";
      SI.MassConcentration S_pro_substrate_test(fixed = false, start = 0) "Propionic acid concentration in substrate [kgCOD/m3]";
      SI.MassConcentration S_prom_substrate_test(fixed = false, start = 0) "Propionic ion concentration in substrate [kgCOD/m3]";
      SI.MolarDensity S_bu_mol_substrate_test(fixed = false, start = 0) "Butyric acid molar concentration in substrate [mol/m3]";
      SI.MolarDensity S_bum_mol_substrate_test(fixed = false, start = 0) "Butyric ion molar concentration in substrate [mol/m3]";
      SI.MassConcentration S_bu_substrate_test(fixed = false, start = 0) "Butyric acid concentration in substrate [kgCOD/m3]";
      SI.MassConcentration S_bum_substrate_test(fixed = false, start = 0) "Butyric ion concentration in substrate [kgCOD/m3]";
      SI.MolarDensity S_va_mol_substrate_test(fixed = false, start = 0) "Valeric acid molar concentration in substrate [mol/m3]";
      SI.MolarDensity S_vam_mol_substrate_test(fixed = false, start = 0) "Valeric ion molar concentration in substrate [mol/m3]";
      SI.MassConcentration S_va_substrate_test(fixed = false, start = 0) "Valeric acid concentration in inoculum [kgCOD/m3]";
      SI.MassConcentration S_vam_substrate_test(fixed = false, start = 0) "Valeric ion concentration in inoculum [kgCOD/m3]";
      SI.MolarDensity S_cat_substrate_test(fixed = false, start = 0) "Soluble cationic ion concentration in inoculum [mol/m3]";
      SI.MolarDensity S_nh4_substrate_test(fixed = false, start = 0) "Soluble ammonium ion concentration in substrate [mol/m3]";
      SI.MolarDensity S_nh3_substrate_test(fixed = false, start = 0) "Soluble free ammonia concentration in substrate [mol/m3]";
      SI.MolarDensity S_in_substrate_test(fixed = false, start = 0) "Soluble inorganic nitrogen concentration in substrate [mol/m3]";
      //
      /*  Speciation of ionic components in water */
      SI.MolarDensity S_h_water_test(fixed = false, start = 0) "Hydrogen ion concentration in dilution water [mol/m3]";
      SI.MolarDensity S_oh_water_test(fixed = false, start = 0) "Hydroxide ion concentration in dilution water [mol/m3]";
      SI.MolarDensity Alk_mol_water_test(fixed = false, start = 0) "Alkalinity molar concentration in dilution water [mol/m3]";
      SI.MolarDensity S_hco3_water_test(fixed = false, start = 0) "Soluble bicarbonate ion concentration in dilution water [mol/m3]";
      SI.MolarDensity S_ic_water_test(fixed = false, start = 0) "Soluble inorganic carbon concentration in dilution water [mol/m3]";
      SI.MolarDensity S_cat_water_test(fixed = false, start = 0) "Soluble cationic ion concentration in dilution water [mol/m3]";
      //
      /* Speciation of ionic components in inoculum */
      SI.MolarDensity S_h_inoculum_test(fixed = false, start = 0) "Hydrogen ion concentration in inoculum [mol/m3]";
      SI.MolarDensity S_oh_inoculum_test(fixed = false, start = 0) "Hydroxide ion concentration in inoculum [mol/m3]";
      SI.MolarDensity S_in_inoculum_test(fixed = false, start = 0) "Soluble inorganic nitrogen concentration in inoculum [mol/m3]";
      SI.MolarDensity S_nh4_inoculum_test(fixed = false, start = 0) "Soluble ammonium ion concentration in inoculum [mol/m3]";
      SI.MolarDensity S_nh3_inoculum_test(fixed = false, start = 0) "Soluble free ammonia concentration in inoculum [mol/m3]";
      SI.MolarDensity S_ac_mol_inoculum_test(fixed = false, start = 0) "Acetic acid molar concentration in inoculum [mol/m3]";
      SI.MolarDensity S_pro_mol_inoculum_test(fixed = false, start = 0) "Propionic acid molar concentration in inoculum [mol/m3]";
      SI.MolarDensity S_bu_mol_inoculum_test(fixed = false, start = 0) "Butyric acid molar concentration in inoculum [mol/m3]";
      SI.MolarDensity S_va_mol_inoculum_test(fixed = false, start = 0) "Valeric acid molar concentration in inoculum [mol/m3]";
      SI.MolarDensity S_acm_mol_inoculum_test(fixed = false, start = 0) "Acetate ion molar concentration in inoculum [mol/m3]";
      SI.MolarDensity S_prom_mol_inoculum_test(fixed = false, start = 0) "Propionate ion molar concentration in inoculum [mol/m3]";
      SI.MolarDensity S_bum_mol_inoculum_test(fixed = false, start = 0) "Butyric ion molar concentration in inoculum [mol/m3]";
      SI.MolarDensity S_vam_mol_inoculum_test(fixed = false, start = 0) "Valerate ion molar concentration in inoculum [mol/m3]";
      SI.MolarDensity Alk_mol_inoculum_test(fixed = false, start = 0) "Alkalinity molar concentration in inoculum [mol/m3]";
      SI.MolarDensity S_hco3_inoculum_test(fixed = false, start = 0) "Soluble bicarbonate ion concentration in inoculum [mol/m3]";
      SI.MolarDensity S_ic_inoculum_test(fixed = false, start = 0) "Soluble inorganic carbon concentration in inoculum [mol/m3]";
      SI.MolarDensity S_cat_inoculum_test(fixed = false, start = 0) "Soluble cationic ion concentration in inoculum [mol/m3]";
      SI.MassConcentration S_va_inoculum_test(fixed = false, start = 0) "Valeric acid concentration in inoculum [kgCOD/m3]";
      SI.MassConcentration S_bu_inoculum_test(fixed = false, start = 0) "Butyric concentration in inoculum [kgCOD/m3]";
      SI.MassConcentration S_pro_inoculum_test(fixed = false, start = 0) "Propionic acid concentration in inoculum [kgCOD/m3]";
      SI.MassConcentration S_ac_inoculum_test(fixed = false, start = 0) "Acetic acid concentration in inoculum [kgCOD/m3]";
      SI.MassConcentration S_acm_inoculum_test(fixed = false, start = 0) "Acetate ion concentration in inoculum [kgCOD/m3]";
      SI.MassConcentration S_prom_inoculum_test(fixed = false, start = 0) "Propionate ion concentration in inoculum [kgCOD/m3]";
      SI.MassConcentration S_bum_inoculum_test(fixed = false, start = 0) "Butyric ion concentration in inoculum [kgCOD/m3]";
      SI.MassConcentration S_vam_inoculum_test(fixed = false, start = 0) "Valerate ion concentration in inoculum [kgCOD/m3]";
      //
      SI.MolarDensity Ka_va_test(fixed = false, start = 0) "Acid-base constant for valerate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_bu_test(fixed = false, start = 0) "Acid-base constant for butyrate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_pro_test(fixed = false, start = 0) "Acid-base constant for propionate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_ac_test(fixed = false, start = 0) "Acid-base constant for acetate at standard T and P [mol/m3]";
      SI.MolarDensity Ka_co2_test(fixed = false, start = 4.94e-7/1000) "Acid-base constant for carbonic acid at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_nh3_test(fixed = false, start = 1.11e-9/1000) "Acid-base constant for free ammonia at operative temperature and standard pressure [mol/m3]";
      SI.MolarDensity Ka_h2o_test(fixed = false, start = 2.08e-14/1000) "Acid-base constant for water at operative temperature and standard pressure [mol/m3]";
    end OtherVariables_BatchTestPreparation;
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(origin = {-3, 18}, textColor = {126, 126, 126}, extent = {{-77, 62}, {83, -98}}, textString = "v")}),
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      uses(Modelica(version = "4.0.0")));
  end Variables;

  package Icons
    extends Modelica.Icons.IconsPackage;

    partial block Feed1
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "Feed 1 = Sludge"), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {191, 95, 0}, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, extent = {{-54, 54}, {56, -54}}), Rectangle(origin = {-2, 0}, lineColor = {191, 95, 0}, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-2.24365, -0.168094}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Polygon(origin = {0, 2}, lineColor = {191, 95, 0}, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end Feed1;

    partial block Feed2
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "Feed 2 = Yogurth"), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, extent = {{-54, 54}, {56, -54}}), Line(origin = {-1.66045, 0.41511}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {255, 247, 157}, fillColor = {255, 247, 157}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Rectangle(origin = {-2, 0}, lineColor = {255, 247, 157}, fillColor = {255, 247, 157}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Polygon(origin = {0, 4}, lineColor = {255, 247, 157}, fillColor = {255, 247, 157}, fillPattern = FillPattern.Solid, points = {{0, -56}, {-14, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {0, -54}, {0, -56}})}));
    end Feed2;

    partial block FeedingTank
      annotation(
        Icon(graphics = {Rectangle(lineColor = {98, 106, 124}, fillColor = {186, 204, 220}, fillPattern = FillPattern.Solid, extent = {{-60, 80}, {60, -80}}), Rectangle(origin = {0, -90}, lineColor = {145, 145, 145}, fillColor = {222, 222, 222}, fillPattern = FillPattern.Solid, borderPattern = BorderPattern.Engraved, extent = {{-80, 10}, {80, -10}}, radius = 3), Ellipse(origin = {-2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}}), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Ellipse(origin = {2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}), Line(origin = {0.326594, -0.653188}, points = {{0, -34}, {0, 40}, {0, 98}}, thickness = 1), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, thickness = 0.5), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}), Ellipse(origin = {0.25, -87.49}, lineColor = {88, 88, 88}, fillColor = {159, 159, 159}, fillPattern = FillPattern.Solid, extent = {{-18.25, 11.49}, {18.25, -11.49}}), Line(origin = {-2, -89.55}, points = {{2, -9}, {8, 11}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Line(origin = {-11.1441, -80.7082}, points = {{-1, 1}, {3, -3}}), Line(origin = {3.2058, -79.2899}, points = {{-3, 3}, {-3, -3}}), Line(origin = {-12.61, -85.62}, points = {{-5, -3}, {3, -3}}), Line(origin = {11.7335, -74.6764}, points = {{-3, -9}, {1, -5}}), Line(origin = {15.39, -85.62}, points = {{-5, -3}, {3, -3}})}));
    end FeedingTank;

    partial block Digester
      annotation(
        Icon(graphics = {Ellipse(origin = {0, 52}, lineColor = {154, 149, 124}, fillColor = {229, 220, 200}, fillPattern = FillPattern.Solid, extent = {{-64, 36}, {64, -36}}), Polygon(origin = {-1, -24}, lineColor = {131, 65, 0}, fillColor = {214, 142, 106}, fillPattern = FillPattern.Solid, points = {{-63, 78}, {-63, -52}, {1, -70}, {65, -52}, {65, 64}, {65, 78}, {-63, 78}}), Ellipse(lineColor = {85, 0, 0}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}), Line(points = {{10, -36}, {2, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(origin = {0.33, -0.65}, points = {{0, -34}, {0, 40}, {0, 54}}, color = {85, 0, 0}, thickness = 1), Ellipse(origin = {2.69, 0}, lineColor = {85, 0, 0}, fillColor = {189, 107, 79}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}), Ellipse(origin = {-2.69, 0}, lineColor = {85, 0, 0}, fillColor = {189, 107, 79}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}})}));
    end Digester;

    partial block SludgeDischarge
      annotation(
        Icon(graphics = {Rectangle(origin = {2, 34}, lineColor = {127, 61, 0}, fillColor = {163, 118, 80}, fillPattern = FillPattern.Solid, extent = {{-36, -43}, {97.5, -80}}), Polygon(origin = {6, 24}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-62, 18}, {-50, 26}, {-50, 10}, {-62, 18}}), Rectangle(origin = {-3.33, 24.67}, lineColor = {122, 122, 122}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-76.67, 1.33}, {-30.67, -6.67}}), Line(origin = {3.27, 33.8}, points = {{-34, -14}, {-30, -14}, {-24, -16}, {-20, -20}, {-16, -26}, {-12, -34}, {-12, -42}}, color = {163, 118, 80}, thickness = 1.75), Polygon(origin = {4, 24}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-72, 26}, {-72, 10}, {-60, 18}, {-72, 26}}), Line(origin = {3.97819, 21.734}, points = {{-60, 20}, {-60, 4}}, thickness = 1), Line(origin = {2.06, 33.93}, points = {{-36, -16}, {-36, -80}, {98, -80}, {98, -8}})}));
    end SludgeDischarge;

    partial block GasMeter
      annotation(
        Icon(graphics = {Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Ellipse(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, extent = {{-12, -12}, {12, 12}}, endAngle = 360), Ellipse(fillColor = {252, 255, 184}, fillPattern = FillPattern.Solid, extent = {{-70, -70}, {70, 70}}, endAngle = 360), Line(points = {{-22.9, 32.8}, {-40.2, 57.3}}), Ellipse(fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-7, -7}, {7, 7}}, endAngle = 360), Line(points = {{-37.6, 13.7}, {-65.8, 23.9}}), Line(visible = false, points = {{55, -85}, {-60, -85}}, color = {0, 128, 255}), Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Line(points = {{22.9, 32.8}, {40.2, 57.3}}), Line(points = {{37.6, 13.7}, {65.8, 23.9}}), Line(points = {{0, 70}, {0, 40}})}));
    end GasMeter;

    partial block BatchTestPreparation
      annotation(
        Diagram,
        Icon(graphics = {Polygon(lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, points = {{0, 60}, {18, 60}, {60, -60}, {-60, -60}, {-20, 60}, {0, 60}}), Line(origin = {-26.0362, 20.0139}, points = {{-7, 0}, {7, 0}, {7, 0}}), Line(origin = {-19.4512, 40.0139}, points = {{-7, 0}, {7, 0}, {7, 0}}), Line(origin = {-46.1225, -39.7075}, points = {{-7, 0}, {7, 0}, {7, 0}}), Line(origin = {-39.1978, -19.7632}, points = {{-7, 0}, {7, 0}, {7, 0}}), Line(origin = {-33.0557, -0.176773}, points = {{-7, 0}, {7, 0}, {7, 0}}), Rectangle(origin = {-19, 70}, lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-1, 10}, {1, -10}}), Rectangle(origin = {17, 70}, lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-1, 10}, {1, -10}})}));
    end BatchTestPreparation;

    partial block BatchTest
      annotation(
        Diagram,
        Icon(graphics = {Polygon(lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, points = {{0, 60}, {18, 60}, {40, 0}, {-40, 0}, {-20, 60}, {0, 60}}), Line(origin = {-26.0362, 20.0139}, points = {{-7, 0}, {7, 0}, {7, 0}}), Rectangle(origin = {-1, 67}, lineColor = {255, 0, 127}, fillColor = {255, 85, 127}, fillPattern = FillPattern.Backward, borderPattern = BorderPattern.Raised, extent = {{-17, 7}, {17, -7}}, radius = 2), Line(origin = {-19.4512, 40.0139}, points = {{-7, 0}, {7, 0}, {7, 0}}), Polygon(lineColor = {170, 85, 0}, fillColor = {223, 148, 111}, fillPattern = FillPattern.Solid, points = {{-40, 0}, {40, 0}, {60, -60}, {-60, -60}, {-40, 0}, {-40, 0}}), Line(origin = {-46.1225, -39.7075}, points = {{-7, 0}, {7, 0}, {7, 0}}), Line(origin = {-39.1978, -19.7632}, points = {{-7, 0}, {7, 0}, {7, 0}}), Line(origin = {-33.0557, 0.125385}, points = {{-7, 0}, {7, 0}, {7, 0}}), Rectangle(origin = {-19, 70}, lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-1, 10}, {1, -10}}), Rectangle(origin = {17, 70}, lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-1, 10}, {1, -10}})}));
    end BatchTest;

    partial block ProbeInputData
      annotation(
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {74, 237, 255}, fillPattern = FillPattern.Solid, extent = {{-50, 50}, {50, -50}}), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Line(origin = {0.2, 0}, points = {{50, 0}, {88, 0}}), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "Input"), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5)}));
    end ProbeInputData;

    partial block ProbeFittingData
      annotation(
        Diagram,
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {146, 255, 153}, fillPattern = FillPattern.Solid, extent = {{-50, 50}, {50, -50}}), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, -50}, {0, -90}}), Text(extent = {{-36, -10}, {36, -32}}, textString = "Measured"), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5)}));
    end ProbeFittingData;
  end Icons;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    connector Feed
      flow SI.VolumeFlowRate Q "Feed flow rate [m3/s]";
      SI.MassConcentration S_su;
      SI.MassConcentration S_aa;
      SI.MassConcentration S_fa;
      SI.MassConcentration S_va;
      SI.MassConcentration S_bu;
      SI.MassConcentration S_pro;
      SI.MassConcentration S_ac;
      SI.MassConcentration S_h2;
      SI.MassConcentration S_ch4;
      SI.MolarDensity S_ic;
      SI.MolarDensity S_in;
      SI.MolarDensity S_ip;
      SI.MassConcentration S_i;
      SI.MolarDensity S_cat;
      SI.MolarDensity S_an;
      SI.MassConcentration X_c;
      SI.MassConcentration X_ch;
      SI.MassConcentration X_pr;
      SI.MassConcentration X_li;
      SI.MassConcentration X_su;
      SI.MassConcentration X_aa;
      SI.MassConcentration X_fa;
      SI.MassConcentration X_c4;
      SI.MassConcentration X_pro;
      SI.MassConcentration X_ac;
      SI.MassConcentration X_h2;
      SI.MassConcentration X_i;
      SI.MassFraction f_si_xc "COD fraction of soluble interts from complex particulate disintegration [kgCOD/kgCOD]";
      SI.MassFraction f_xi_xc "COD fraction of particulate interts from complex particulate disintegration [kgCOD/kgCOD]";
      SI.MassFraction f_xch_xc "COD fraction of particulate carbohydrates from complex particulate disintegration [kgCOD/s]";
      SI.MassFraction f_xpr_xc "COD fraction of particulate proteins from complex particulate disintegration [kgCOD/kgCOD]";
      SI.MassFraction f_xli_xc "COD fraction of particulate lipids from complex particulate disintegration [kgCOD/kgCOD]";
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end Feed;

    connector Digestate
      flow SI.VolumeFlowRate Q "Digestate flow rate [m3/s]";
      SI.MassConcentration S_su;
      SI.MassConcentration S_aa;
      SI.MassConcentration S_fa;
      SI.MassConcentration S_va;
      SI.MassConcentration S_bu;
      SI.MassConcentration S_pro;
      SI.MassConcentration S_ac;
      SI.MassConcentration S_h2;
      SI.MassConcentration S_ch4;
      SI.MolarDensity S_ic;
      SI.MolarDensity S_in;
      SI.MolarDensity S_ip;
      SI.MassConcentration S_i;
      SI.MolarDensity S_cat;
      SI.MolarDensity S_an;
      SI.MassConcentration X_c;
      SI.MassConcentration X_ch;
      SI.MassConcentration X_pr;
      SI.MassConcentration X_li;
      SI.MassConcentration X_su;
      SI.MassConcentration X_aa;
      SI.MassConcentration X_fa;
      SI.MassConcentration X_c4;
      SI.MassConcentration X_pro;
      SI.MassConcentration X_ac;
      SI.MassConcentration X_h2;
      SI.MassConcentration X_i;
      SI.MolarDensity S_co3;
      SI.MolarDensity S_hco3;
      SI.MolarDensity S_co2;
      SI.MolarDensity S_po4;
      SI.MolarDensity S_hpo4;
      SI.MolarDensity S_h2po4;
      SI.MolarDensity S_h3po4;
      SI.MolarDensity S_h;
      SI.MolarDensity S_oh;
      SI.MolarDensity S_nh3;
      SI.MolarDensity S_nh4;
      SI.MassConcentration S_acm;
      SI.MassConcentration S_prom;
      SI.MassConcentration S_bum;
      SI.MassConcentration S_vam;
      SI.MassConcentration S_gas_h2;
      SI.MassConcentration S_gas_ch4;
      SI.MolarDensity S_gas_co2;
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {255, 172, 108}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {255, 172, 108}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end Digestate;

    connector MixBatchTest
      flow SI.VolumeFlowRate Q_test "Digestate flow rate [m3/s]";
      SI.MassConcentration S_su_test_0;
      SI.MassConcentration S_aa_test_0;
      SI.MassConcentration S_fa_test_0;
      SI.MassConcentration S_va_test_0;
      SI.MassConcentration S_bu_test_0;
      SI.MassConcentration S_pro_test_0;
      SI.MassConcentration S_ac_test_0;
      SI.MassConcentration S_h2_test_0;
      SI.MassConcentration S_ch4_test_0;
      SI.MolarDensity S_ic_test_0;
      SI.MolarDensity S_in_test_0;
      SI.MassConcentration S_i_test_0;
      SI.MolarDensity S_cat_test_0;
      SI.MolarDensity S_an_test_0;
      SI.MassConcentration X_c_test_0;
      SI.MassConcentration X_ch_test_0;
      SI.MassConcentration X_pr_test_0;
      SI.MassConcentration X_li_test_0;
      SI.MassConcentration X_su_test_0;
      SI.MassConcentration X_aa_test_0;
      SI.MassConcentration X_fa_test_0;
      SI.MassConcentration X_c4_test_0;
      SI.MassConcentration X_pro_test_0;
      SI.MassConcentration X_ac_test_0;
      SI.MassConcentration X_h2_test_0;
      SI.MassConcentration X_i_test_0;
      SI.MolarDensity S_hco3_test_0;
      SI.MolarDensity S_co2_test_0;
      SI.MolarDensity S_h_test_0;
      SI.MolarDensity S_oh_test_0;
      SI.MolarDensity S_nh3_test_0;
      SI.MolarDensity S_nh4_test_0;
      SI.MassConcentration S_acm_test_0;
      SI.MassConcentration S_prom_test_0;
      SI.MassConcentration S_bum_test_0;
      SI.MassConcentration S_vam_test_0;
      //  SI.MassConcentration S_gas_h2;
      //  SI.MassConcentration S_gas_ch4;
      //  SI.MolarDensity S_gas_co2;
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {255, 85, 127}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {255, 85, 127}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end MixBatchTest;

    connector Gas
      flow Types.FlowRate_d Q_gas_N "Biogas daily wet flow rate [m3/d]";
      SI.Pressure p_gas_h2o;
      SI.Pressure p_gas_h2;
      SI.Pressure p_gas_ch4;
      SI.Pressure p_gas_co2;
      SI.Pressure p_gas_nh3;
      SI.Pressure P_gas;
      annotation(
        Diagram(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}),
        Icon(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}));
    end Gas;
  end Interfaces;

  package BlockLibrary
    model Feed_1_sink
      extends Icons.Feed1;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Physiochemical;
      extends Variables.OtherVariables_Feed1;
      SI.VolumeFlowRate Q(fixed = false, start = 0.171844477851955) "Feed 1 flow rate [m3/s]";
      SI.MassConcentration X_su(fixed = false, start = 0.171844477851955) "Monosaccharide degrading organisms concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_aa(fixed = false, start = 0.61923061050481) "Amino Acid degrading organisms concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_fa(fixed = false, start = 0.176756083950276) "Long chain fatty acid degrading organisms concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_c4(fixed = false, start = 0.236115793848027) "C4 degrading organisms concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_pro(fixed = false, start = 0.0707860907968375) "Propionate degrading organisms concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_ac(fixed = false, start = 0.44625608307655) "Acetate degrading organisms concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_h2(fixed = false, start = 0.21027420887601) "Hydrogen degrading organisms concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_c(fixed = false, start = 0.188523943307974) "Complex particulate concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_i(fixed = false, start = 8.82083748012884) "Particulate inerts concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_ch(fixed = false, start = 0.493907425992654) "Particulate carbohydrates concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_pr(fixed = false, start = 1.12771809418909) "Particulate proteins concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration X_li(fixed = false, start = 0.965732116587352) "Particulate lipids concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_i(fixed = false, start = 8.95946506102146e-07) "Soluble inerts concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_su(fixed = false, start = 0.0430230761137466) "Soluble monosaccharides concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_aa(fixed = false, start = 0.046267901457183) "Soluble amino acids concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_fa(fixed = false, start = 0.078270201571595) "Soluble long chain fatty acids  concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_va(fixed = false, start = 0) "Valeric acid concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_bu(fixed = false, start = 0.0223872727272727) "Butyric concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_pro(fixed = false, start = 0.0672) "Propionic acid concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_ac(fixed = false, start = 0.0674112) "Acetic acid concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_h2(fixed = false, start = 9.71595541886631e-07) "Soluble hydrogen concentration in feed 1 [kgCOD/m3]";
      SI.MassConcentration S_ch4(fixed = false, start = 0.035718304294732) "Soluble methane concentration in feed 1 [kgCOD/m3]";
      SI.MolarDensity S_ic(fixed = false, start = 0.103271599042417*1000) "Soluble inorganic carbon concentration in feed 1 [mol/m3]";
      SI.MolarDensity S_in(fixed = false, start = 0.0404285714285714*1000) "Soluble inorganic nitrogen concentration in feed 1 [mol/m3]";
      SI.MolarDensity S_ip(fixed = false, start = 0.0404285714285714*1000) "Soluble inorganic phosphorous concentration in feed 1 [mol/m3]";
      SI.MolarDensity S_cat(fixed = false, start = 0.0708801468406167*1000) "Soluble cationic ion concentration in feed 1 [mol/m3]";
      SI.MolarDensity S_an(fixed = false, start = 0.020*1000) "Soluble anionic ions concentration in feed 1 [mol/m3]";
      SI.MassFraction f_xch_xc(fixed = false, start = 0.020*1000) "COD fraction of carbohydrates from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      SI.MassFraction f_xpr_xc(fixed = false, start = 0.020*1000) "COD fraction of proteins from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      SI.MassFraction f_xli_xc(fixed = false, start = 0.020*1000) "COD fraction of lipids from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      SI.MassFraction f_si_xc(fixed = false, start = 0.020*1000) "COD fraction of soluble interts from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      SI.MassFraction f_xi_xc(fixed = false, start = 0.020*1000) "COD fraction of soluble interts from complex particulate Xc, in substrate #1 [kgCOD/kgCOD]";
      Modelica.Blocks.Interfaces.RealInput FlowRate_1[1] annotation(
        Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, 51}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Concentrations_1[17] annotation(
        Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput BMP_1[1] annotation(
        Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, 21}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
    equation
/* Input data from CombiTimeTables */
      Q_in1_d = -FlowRate_1[1];
      TS_in1 = Concentrations_1[1];
      VS_in1 = Concentrations_1[2];
      pVS_in1 = Concentrations_1[3];
      sVS_in1 = Concentrations_1[4];
      tCH_in1 = Concentrations_1[5];
      tPR_in1 = Concentrations_1[6];
      pLI_pVS_in1 = Concentrations_1[7];
      ac_in1 = Concentrations_1[8];
      pro_in1 = Concentrations_1[9];
      isobu_in1 = Concentrations_1[10];
      bu_in1 = Concentrations_1[11];
      isova_in1 = Concentrations_1[12];
      va_in1 = Concentrations_1[13];
      pH_in1 = Concentrations_1[14];
      Alk_in1 = Concentrations_1[15];
      TAN_in1 = Concentrations_1[16];
      TP_in1 = Concentrations_1[17];
      tBMP_VS_in1 = BMP_1[1];
//
/* Flow rate */
      Q = Q_in1_d/86400;
//
/* Physical properties of substrate #1 */
      u_in1 = 1 - TS_in1/1000;
      v_in1 = VS_in1/TS_in1;
      d_in1 = 1/(u_in1/d_h2o + (1 - u_in1)*(v_in1/d_vs + (1 - v_in1)/d_nvs));
      alpha_in1 = (pVS_in1 - VS_in1)/(pVS_in1 - sVS_in1);
//
/* Constant input variables of substrate #1 (soluble gases, biomasses, soluble COD excluding VFA) */
      S_h2 = S_h2_input1;
      S_ch4 = S_ch4_input1;
      X_su = X_su_input1;
      X_aa = X_aa_input1;
      X_fa = X_fa_input1;
      X_c4 = X_c4_input1;
      X_pro = X_pro_input1;
      X_ac = X_ac_input1;
      X_h2 = X_h2_input1;
      S_su = S_su_input1;
      S_aa = S_aa_input1;
      S_fa = S_fa_input1;
      S_i = S_i_input1;
//
/* Computation of variables S_ac, S_pro, S_bu, S_va */
      S_ac = ac_in1*COD_Ac/MWHAc/1000;
      S_pro = pro_in1*COD_Pro/MWHBu/1000;
      S_bu = (bu_in1 + isobu_in1)*COD_Bu/MWHPro/1000;
      S_va = (va_in1 + isova_in1)*COD_Va/MWHVa/1000;
//
/* Computation of COD components */
      pLI_VS_in1 = pLI_pVS_in1*(1 - alpha_in1)*pVS_in1/VS_in1;
      tLI_in1 = pLI_VS_in1*VS_in1*d_in1/1000;
      COD_VFA_in1 = S_ac + S_pro + S_bu + S_va;
      tCOD_in1 = COD_VFA_in1 + tCH_in1*COD_CH_in/1000 + (tPR_in1*d_in1/1000 - TAN_in1)*COD_PR_in*PR_N_in/1000 + tLI_in1*COD_LI_in/1000;
      pCOD_in1 = tCOD_in1 - COD_VFA_in1;
      tBMP_COD_in1 = tBMP_VS_in1/tCOD_in1*VS_in1*d_in1/1000;
      fd_tCOD_in1 = tBMP_COD_in1/(R*T_ref/P_atm_Pa/2/MWO2*1000*(1 - f_newbio_BMP));
      tCOD_in1*fd_tCOD_in1 = COD_VFA_in1 + pCOD_in1*fd_pCOD_in1;
//
/* Computation of variables X_c, X_i, X_ch, X_pr, X_li */
      X_c = pCOD_in1*f_Xc_in1;
      pCOD_in1*(1 - fd_pCOD_in1) = X_i + X_c*f_xi_xc_in1;
      tCH_in1*COD_CH_in/1000 = X_ch + X_i*f_xch_xi_in1 + X_c*f_xch_xc_in1 + X_c*f_xi_xc_in1*f_xi_ch_xc_in1;
      (tPR_in1*d_in1/1000 - TAN_in1)*COD_PR_in*PR_N_in/1000 = X_pr + X_i*f_xpr_xi_in1 + X_c*f_xpr_xc_in1 + X_c*f_xi_xc_in1*f_xi_pr_xc_in1;
      tLI_in1*COD_LI_in/1000 = X_li + X_i*f_xli_xi_in1 + X_c*f_xli_xc_in1 + X_c*f_xi_xc_in1*f_xi_li_xc_in1;
      f_xch_xi_in1 + f_xpr_xi_in1 + f_xli_xi_in1 = 1;
      f_xch_xc_in1 + f_xpr_xc_in1 + f_xli_xc_in1 + f_xi_xc_in1 = 1;
      f_xi_ch_xc_in1 + f_xi_pr_xc_in1 + f_xi_li_xc_in1 = 1;
//
/* Computation of VFA acid-base constants at standart T and P */
      Ka_va_in1 = convKa*10^(-pKa_va)*1000;
      Ka_bu_in1 = convKa*10^(-pKa_bu)*1000;
      Ka_pro_in1 = convKa*10^(-pKa_pro)*1000;
      Ka_ac_in1 = convKa*10^(-pKa_ac)*1000;
//
/* Computation of temperature dependant parameters for charge balance */
      Ka_co2_in1 = 10^(-pKa_co2)*1000*exp(deltaH0_Ka_co2/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hco3_in1 = 10^(-pKa_hco3)*1000*exp(deltaH0_Ka_hco3/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h3po4_in1 = 10^(-pKa_h3po4)*1000*exp(deltaH0_Ka_h3po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2po4_in1 = 10^(-pKa_h2po4)*1000*exp(deltaH0_Ka_h2po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hpo4_in1 = 10^(-pKa_hpo4)*1000*exp(deltaH0_Ka_hpo4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_nh3_in1 = 10^(-pKa_nh3)*1000*exp(deltaH0_Ka_nh3/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2o_in1 = 10^(-pKa_h2o)*1000*exp(deltaH0_Ka_h2o/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
//
/* Computation of ionic components */
      S_ac_mol_in1 = ac_in1/MWHAc/1000;
      S_pro_mol_in1 = pro_in1/MWHPro/1000;
      S_bu_mol_in1 = (bu_in1 + isobu_in1)/MWHBu/1000;
      S_va_mol_in1 = (va_in1 + isova_in1)/MWHVa/1000;
      S_ac_ion_in1 = Ka_ac_in1*S_ac_mol_in1/(S_h_in1 + Ka_ac_in1);
      S_pro_ion_in1 = Ka_pro_in1*S_pro_mol_in1/(S_h_in1 + Ka_pro_in1);
      S_bu_ion_in1 = Ka_bu_in1*S_bu_mol_in1/(S_h_in1 + Ka_bu_in1);
      S_va_ion_in1 = Ka_va_in1*S_va_mol_in1/(S_h_in1 + Ka_va_in1);
      S_h_in1 = 10^(-pH_in1)*1000*convKa;
      S_oh_in1 = Ka_h2o_in1/S_h_in1*convKa;
      Alk_mol_in1 = Alk_in1/MWCaCO3*2/1000;
      S_hco3_in1 + 2*S_co3_in1 = Alk_mol_in1 - (S_ac_ion_in1 + S_pro_ion_in1 + S_bu_ion_in1 + S_va_ion_in1) - S_oh_in1 - S_nh3_in1 + S_h_in1 - S_h2po4_in1 - 2*S_po4_in1 + S_h3po4_in1 "TO BE VERIFIED";
      S_co3_in1 = Ka_hco3_in1*S_ic/(S_h_in1^2/Ka_co2_in1 + S_h_in1 + Ka_hco3_in1);
      S_hco3_in1 = Ka_co2_in1*S_ic*S_h_in1/(S_h_in1^2 + Ka_co2_in1*S_h_in1 + Ka_co2_in1*Ka_hco3_in1);
//  S_ic = S_hco3_in1*(S_h_in1 + Ka_co2_in1)/Ka_co2_in1;
      S_ic = S_co3_in1 + S_hco3_in1 + S_co2_in1;
      S_in = TAN_in1/MWN/1000;
      S_nh4_in1 = S_in*S_h_in1/(Ka_nh3_in1 + S_h_in1);
      S_nh3_in1 = S_in - S_nh4_in1;
      S_ip = if noEvent(TS_in1 > 0) then TP_in1/MWP/1000 else 0;
      S_po4_in1 = Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1*S_ip/(S_h_in1^3 + Ka_h3po4_in1*S_h_in1^2 + Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1 + Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1);
      S_hpo4_in1 = Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1*S_ip/(S_h_in1^3 + Ka_h3po4_in1*S_h_in1^2 + Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1 + Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1);
      S_h2po4_in1 = Ka_h3po4_in1*S_h_in1^2*S_ip/(S_h_in1^3 + Ka_h3po4_in1*S_h_in1^2 + Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1 + Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1);
//  S_h3po4_in1 + S_h2po4_in1 + S_hpo4_in1 + S_po4_in1 = S_ip;
      S_h3po4_in1 = S_h_in1^3*S_ip/(S_h_in1^3 + Ka_h3po4_in1*S_h_in1^2 + Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1 + Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1);
      S_an = S_an_input1;
      S_cat = (-S_nh4_in1) - S_h_in1 + S_an + S_hco3_in1 + 2*S_co3_in1 + 3*S_po4_in1 + 2*S_hpo4_in1 + S_h2po4_in1 + S_oh_in1 + S_ac_ion_in1 + S_pro_ion_in1 + S_bu_ion_in1 + S_va_ion_in1;
//
/* Computation of masses */
//  Sludge_Out.M_S_su = S_su_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_aa = S_aa_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_fa = S_fa_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_va = S_va_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_bu = S_bu_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_pro = S_pro_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_ac = S_ac_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_h2 = S_h2_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_ch4 = S_ch4_in1 * Sludge_Out.Q;
//  Sludge_Out.Mol_S_ic = S_ic_in1 * Sludge_Out.Q;
//  Sludge_Out.Mol_S_in = S_in_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_i = S_i_in1 * Sludge_Out.Q;
//  Sludge_Out.Mol_S_cat = S_cat_in1 * Sludge_Out.Q;
//  Sludge_Out.Mol_S_an = S_an_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_c = X_c_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_ch = X_ch_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_pr = X_pr_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_li = X_li_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_su = X_su_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_aa = X_aa_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_fa = X_fa_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_c4 = X_c4_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_pro = X_pro_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_ac = X_ac_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_h2 = X_h2_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_i = X_i_in1 * Sludge_Out.Q;
//
/* Stoichiometric coffiecients of disintegration process for interface Feed */
      f_si_xc = f_si_xc_in1;
      f_xi_xc = f_xi_xc_in1;
      f_xch_xc = f_xch_xc_in1;
      f_xpr_xc = f_xpr_xc_in1;
      f_xli_xc = f_xli_xc_in1;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        Diagram(graphics = {Rectangle(extent = {{-66, 2}, {-66, 2}})}));
    end Feed_1_sink;

    model Feed_2_sink
      extends Icons.Feed2;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Physiochemical;
      extends Variables.OtherVariables_Feed2;
      SI.VolumeFlowRate Q(fixed = false, start = 0.171844477851955) "Feed 2 flow rate [m3/s]";
      SI.MassConcentration X_su(fixed = false, start = 0.171844477851955) "Monosaccharide degrading organisms concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_aa(fixed = false, start = 0.61923061050481) "Amino Acid degrading organisms concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_fa(fixed = false, start = 0.176756083950276) "Long chain fatty acid degrading organisms concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_c4(fixed = false, start = 0.236115793848027) "C4 degrading organisms concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_pro(fixed = false, start = 0.0707860907968375) "Propionate degrading organisms concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_ac(fixed = false, start = 0.44625608307655) "Acetate degrading organisms concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_h2(fixed = false, start = 0.21027420887601) "Hydrogen degrading organisms concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_c(fixed = false, start = 0.188523943307974) "Complex particulate concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_i(fixed = false, start = 8.82083748012884) "Particulate inerts concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_ch(fixed = false, start = 0.493907425992654) "Particulate carbohydrates concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_pr(fixed = false, start = 1.12771809418909) "Particulate proteins concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration X_li(fixed = false, start = 0.965732116587352) "Particulate lipids concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_i(fixed = false, start = 8.95946506102146e-07) "Soluble inerts concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_su(fixed = false, start = 0.0430230761137466) "Soluble monosaccharides concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_aa(fixed = false, start = 0.046267901457183) "Soluble amino acids concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_fa(fixed = false, start = 0.078270201571595) "Soluble long chain fatty acids  concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_va(fixed = false, start = 0) "Valeric acid concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_bu(fixed = false, start = 0.0223872727272727) "Butyric concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_pro(fixed = false, start = 0.0672) "Propionic acid concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_ac(fixed = false, start = 0.0674112) "Acetic acid concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_h2(fixed = false, start = 9.71595541886631e-07) "Soluble hydrogen concentration in Feed 2 [kgCOD/m3]";
      SI.MassConcentration S_ch4(fixed = false, start = 0.035718304294732) "Soluble methane concentration in Feed 2 [kgCOD/m3]";
      SI.MolarDensity S_ic(fixed = false, start = 0.103271599042417*1000) "Soluble inorganic carbon concentration in Feed 2 [mol/m3]";
      SI.MolarDensity S_in(fixed = false, start = 0.0404285714285714*1000) "Soluble inorganic nitrogen concentration in Feed 2 [mol/m3]";
      SI.MolarDensity S_ip(fixed = false, start = 0.0404285714285714*1000) "Soluble inorganic phosphorous concentration in feed 2 [mol/m3]";
      SI.MolarDensity S_cat(fixed = false, start = 0.0708801468406167*1000) "Soluble cationic ion concentration in Feed 2 [mol/m3]";
      SI.MolarDensity S_an(fixed = false, start = 0.020*1000) "Soluble anionic ions concentration in Feed 2 [mol/m3]";
      SI.MassFraction f_xch_xc(fixed = false, start = 0.020*1000) "COD fraction of carbohydrates from complex particulate Xc, in Feed 2 [kgCOD/kgCOD]";
      SI.MassFraction f_xpr_xc(fixed = false, start = 0.020*1000) "COD fraction of proteins from complex particulate Xc, in substrate Feed 2 [kgCOD/kgCOD]";
      SI.MassFraction f_xli_xc(fixed = false, start = 0.020*1000) "COD fraction of lipids from complex particulate Xc, in substrate Feed 2 [kgCOD/kgCOD]";
      SI.MassFraction f_si_xc(fixed = false, start = 0.020*1000) "COD fraction of soluble interts from complex particulate Xc, in substrate Feed 2 [kgCOD/kgCOD]";
      SI.MassFraction f_xi_xc(fixed = false, start = 0.020*1000) "COD fraction of soluble interts from complex particulate Xc, in substrate Feed 2 [kgCOD/kgCOD]";
      Modelica.Blocks.Interfaces.RealInput FlowRate_2[1] annotation(
        Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, 51}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Concentrations_2[20] annotation(
        Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
    equation
/* Input data from CombiTimeTables */
      Q_in2_d = -FlowRate_2[1] "m3/d";
      TS_in2 = Concentrations_2[1] "gVS/kg";
      VS_in2 = Concentrations_2[2] "gVS/kg";
      pVS_in2 = Concentrations_2[3] "gVSp/kgp";
      sVS_in2 = Concentrations_2[4] "gVSs/kgs";
      sCOD_in2 = Concentrations_2[5] "gCOD/m3";
      tCH_in2 = Concentrations_2[6] "gGlu/m3";
      sCH_in2 = Concentrations_2[7] "gGlu/m3";
      tPR_in2 = Concentrations_2[8] "gBSA/m3";
      sPR_in2 = Concentrations_2[9] "gBSA/m3";
      pLI_pVS_in2 = Concentrations_2[10] "gLI/kgpVS";
      ac_in2 = Concentrations_2[11] "gHAc/m3";
      pro_in2 = Concentrations_2[12] "gHPro/m3";
      isobu_in2 = Concentrations_2[13] "gHBu/m3";
      bu_in2 = Concentrations_2[14] "gHBu/m3";
      isova_in2 = Concentrations_2[15] "gHVa/m3";
      va_in2 = Concentrations_2[16] "gHVa/m3";
      pH_in2 = Concentrations_2[17] "-";
      Alk_in2 = Concentrations_2[18] "gCaCO3/m3";
      TAN_in2 = Concentrations_2[19] "gN/m3";
      TP_in2 = Concentrations_2[20] "gP/m3";
//
/* Flow rate of substrate #2 */
      Q = Q_in2_d/86400;
//
/* Physical properties of substrate #2 */
      u_in2 = if noEvent(TS_in2 > 0) then 1 - TS_in2/1000 else 0;
      v_in2 = if noEvent(TS_in2 > 0) then VS_in2/TS_in2 else 0;
      d_in2 = if noEvent(TS_in2 > 0) then 1/(u_in2/d_h2o + (1 - u_in2)*(v_in2/d_vs + (1 - v_in2)/d_nvs)) else 0;
      alpha_in2 = if noEvent(TS_in2 > 0) then (pVS_in2 - VS_in2)/(pVS_in2 - sVS_in2) else 0;
//
/* Constant input variables of substrate #2 (soluble gases and biomasses; all COD is degradable and alreadey disintegrated) */
      S_h2 = S_h2_input2;
      S_ch4 = S_ch4_input2;
      X_su = X_su_input2;
      X_aa = X_aa_input2;
      X_fa = X_fa_input2;
      X_c4 = X_c4_input2;
      X_pro = X_pro_input2;
      X_ac = X_ac_input2;
      X_h2 = X_h2_input2;
      S_i = S_i_input2;
      X_i = X_i_input2 "All COD is degradable";
      X_c = X_c_input2 "All COD enters the digester as already disintegrated organic matter";
//
/* Computation of variables S_ac, S_pro, S_bu, S_va */
      S_ac = if noEvent(TS_in2 > 0) then ac_in2*COD_Ac/MWHAc/1000 else 0;
      S_pro = if noEvent(TS_in2 > 0) then pro_in2*COD_Pro/MWHBu/1000 else 0;
      S_bu = if noEvent(TS_in2 > 0) then (bu_in2 + isobu_in2)*COD_Bu/MWHPro/1000 else 0;
      S_va = if noEvent(TS_in2 > 0) then (va_in2 + isova_in2)*COD_Va/MWHVa/1000 else 0;
//
/* Computation of soluble COD components */
      S_su = if noEvent(TS_in2 > 0) then sCH_in2/1000*COD_CH_in else 0;
      S_aa = if noEvent(TS_in2 > 0) then sPR_in2/1000*COD_PR_BSA_in else 0;
      S_fa = if noEvent(sCOD_in2/1000 - COD_VFA_in2 - S_su - S_aa > 0) then sCOD_in2/1000 - COD_VFA_in2 - S_su - S_aa else 0;
//
/* Computation of COD components */
      pLI_VS_in2 = if noEvent(TS_in2 > 0) then pLI_pVS_in2*(1 - alpha_in2)*pVS_in2/VS_in2 else 0;
      tLI_in2 = if noEvent(TS_in2 > 0) then pLI_VS_in2*VS_in2*d_in2/1000 + S_fa*1000/COD_LI_in else 0;
      COD_VFA_in2 = if noEvent(TS_in2 > 0) then S_ac + S_pro + S_bu + S_va else 0;
      tCOD_in2 = if noEvent(TS_in2 > 0) then COD_VFA_in2 + tCH_in2*COD_CH_in/1000 + tPR_in2*COD_PR_BSA_in/1000 + tLI_in2*COD_LI_in/1000 else 0;
      pCOD_in2 = if noEvent(TS_in2 > 0) then tCOD_in2 - S_su - S_aa - S_fa - COD_VFA_in2 else 0;
//
/* Computation of variables X_ch, X_pr, X_li */
      X_ch = if noEvent(TS_in2 > 0) then (tCH_in2 - sCH_in2)/1000*COD_CH_in else 0;
      X_pr = if noEvent(TS_in2 > 0) then (tPR_in2 - sPR_in2)/1000*COD_PR_BSA_in else 0;
      X_li = if noEvent(TS_in2 > 0) then pLI_VS_in2*VS_in2*d_in2/1000/1000*COD_LI_in else 0;
//
/* Computation of VFA acid-base constants at standart T and P */
      Ka_va_in2 = convKa*10^(-pKa_va)*1000;
      Ka_bu_in2 = convKa*10^(-pKa_bu)*1000;
      Ka_pro_in2 = convKa*10^(-pKa_pro)*1000;
      Ka_ac_in2 = convKa*10^(-pKa_ac)*1000;
//
/* Computation of temperature dependant parameters for charge balance */
      Ka_co2_in2 = 10^(-pKa_co2)*1000*exp(deltaH0_Ka_co2/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hco3_in2 = 10^(-pKa_hco3)*1000*exp(deltaH0_Ka_hco3/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h3po4_in2 = 10^(-pKa_h3po4)*1000*exp(deltaH0_Ka_h3po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2po4_in2 = 10^(-pKa_h2po4)*1000*exp(deltaH0_Ka_h2po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hpo4_in2 = 10^(-pKa_hpo4)*1000*exp(deltaH0_Ka_hpo4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_nh3_in2 = 10^(-pKa_nh3)*1000*exp(deltaH0_Ka_nh3/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2o_in2 = 10^(-pKa_h2o)*1000*exp(deltaH0_Ka_h2o/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
//
/* Computation of ionic components */
      S_ac_mol_in2 = if noEvent(TS_in2 > 0) then ac_in2/MWHAc/1000 else 0;
      S_pro_mol_in2 = if noEvent(TS_in2 > 0) then pro_in2/MWHPro/1000 else 0;
      S_bu_mol_in2 = if noEvent(TS_in2 > 0) then (bu_in2 + isobu_in2)/MWHBu/1000 else 0;
      S_va_mol_in2 = if noEvent(TS_in2 > 0) then (va_in2 + isova_in2)/MWHVa/1000 else 0;
      S_ac_ion_in2 = if noEvent(TS_in2 > 0) then Ka_ac_in2*S_ac_mol_in2/(S_h_in2 + Ka_ac_in2) else 0;
      S_pro_ion_in2 = if noEvent(TS_in2 > 0) then Ka_pro_in2*S_pro_mol_in2/(S_h_in2 + Ka_pro_in2) else 0;
      S_bu_ion_in2 = if noEvent(TS_in2 > 0) then Ka_bu_in2*S_bu_mol_in2/(S_h_in2 + Ka_bu_in2) else 0;
      S_va_ion_in2 = if noEvent(TS_in2 > 0) then Ka_va_in2*S_va_mol_in2/(S_h_in2 + Ka_va_in2) else 0;
      S_h_in2 = if noEvent(TS_in2 > 0) then 10^(-pH_in2)*1000*convKa else 0;
      S_oh_in2 = if noEvent(TS_in2 > 0) then Ka_h2o_in2/S_h_in2*convKa else 0;
      Alk_mol_in2 = if noEvent(TS_in2 > 0) then Alk_in2/MWCaCO3*2/1000 else 0;
      S_ic = 0;
      S_hco3_in2 = 0;
      S_co3_in2 = 0;
      S_co2_in2 = 0;
      S_in = if noEvent(TS_in2 > 0) then TAN_in2/MWN/1000 else 0;
      S_nh4_in2 = if noEvent(TS_in2 > 0) then S_in*S_h_in2/(Ka_nh3_in2 + S_h_in2) else 0;
      S_nh3_in2 = S_in - S_nh4_in2;
      S_ip = if noEvent(TS_in2 > 0) then TP_in2/MWP/1000 else 0;
      S_po4_in2 = Ka_h3po4_in2*Ka_h2po4_in2*Ka_hpo4_in2*S_ip/(S_h_in2^3 + Ka_h3po4_in2*S_h_in2^2 + Ka_h3po4_in2*Ka_h2po4_in2*S_h_in2 + Ka_h3po4_in2*Ka_h2po4_in2*Ka_hpo4_in2);
      S_hpo4_in2 = Ka_h3po4_in2*Ka_h2po4_in2*S_h_in2*S_ip/(S_h_in2^3 + Ka_h3po4_in2*S_h_in2^2 + Ka_h3po4_in2*Ka_h2po4_in2*S_h_in2 + Ka_h3po4_in2*Ka_h2po4_in2*Ka_hpo4_in2);
      S_h2po4_in2 = Ka_h3po4_in2*S_h_in2^2*S_ip/(S_h_in2^3 + Ka_h3po4_in2*S_h_in2^2 + Ka_h3po4_in2*Ka_h2po4_in2*S_h_in2 + Ka_h3po4_in2*Ka_h2po4_in2*Ka_hpo4_in2);
      S_h3po4_in2 + S_h2po4_in2 + S_hpo4_in2 + S_po4_in2 = S_ip;
      S_an = if noEvent(TS_in2 > 0) then S_an_input2 else 0;
      S_cat = if noEvent(TS_in2 > 0) then -S_nh4_in2 - S_h_in2 + S_an + S_hco3_in2 + 2*S_co3_in2 + 3*S_po4_in2 + 2*S_hpo4_in2 + S_h2po4_in2 + S_oh_in2 + S_ac_ion_in2 + S_pro_ion_in2 + S_bu_ion_in2 + S_va_ion_in2 else 0;
//
///* Computation of masses */
//  M_S_su = S_su_in2*Q;
//  Yogurth_Out.M_S_aa = S_aa_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_fa = S_fa_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_va = S_va_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_bu = S_bu_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_pro = S_pro_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_ac = S_ac_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_h2 = S_h2_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_ch4 = S_ch4_in2*Yogurth_Out.Q;
//  Yogurth_Out.Mol_S_ic = S_ic_in2*Yogurth_Out.Q;
//  Yogurth_Out.Mol_S_in = S_in_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_i = S_i_in2*Yogurth_Out.Q;
//  Yogurth_Out.Mol_S_cat = S_cat_in2*Yogurth_Out.Q;
//  Yogurth_Out.Mol_S_an = S_an_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_c = X_c_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_ch = X_ch_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_pr = X_pr_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_li = X_li_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_su = X_su_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_aa = X_aa_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_fa = X_fa_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_c4 = X_c4_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_pro = X_pro_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_ac = X_ac_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_h2 = X_h2_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_i = X_i_in2*Yogurth_Out.Q;
//
/* Stoichiometric coffiecients of disintegration process for interface Feed */
      f_si_xc = f_si_xc_in2;
      f_xi_xc = f_xi_xc_in2;
      f_xch_xc = f_xch_xc_in2;
      f_xpr_xc = f_xpr_xc_in2;
      f_xli_xc = f_xli_xc_in2;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Feed_2_sink;

    model Feed_1
      extends Icons.Feed1;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Physiochemical;
      extends Variables.OtherVariables_Feed1;
      Interfaces.Feed Sludge_Out annotation(
        Placement(visible = true, transformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput FlowRate_1[1] annotation(
        Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, 51}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Concentrations_1[17] annotation(
        Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput BMP_1[1] annotation(
        Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, 21}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
    equation
/* Input data from CombiTimeTables */
      Q_in1_d = -FlowRate_1[1];
      TS_in1 = Concentrations_1[1];
      VS_in1 = Concentrations_1[2];
      pVS_in1 = Concentrations_1[3];
      sVS_in1 = Concentrations_1[4];
      tCH_in1 = Concentrations_1[5];
      tPR_in1 = Concentrations_1[6];
      pLI_pVS_in1 = Concentrations_1[7];
      ac_in1 = Concentrations_1[8];
      pro_in1 = Concentrations_1[9];
      isobu_in1 = Concentrations_1[10];
      bu_in1 = Concentrations_1[11];
      isova_in1 = Concentrations_1[12];
      va_in1 = Concentrations_1[13];
      pH_in1 = Concentrations_1[14];
      Alk_in1 = Concentrations_1[15];
      TAN_in1 = Concentrations_1[16];
      TP_in1 = Concentrations_1[17];
      tBMP_VS_in1 = BMP_1[1];
//
/* Flow rate */
      Sludge_Out.Q = Q_in1_d/86400;
//
/* Physical properties of substrate #1 */
      u_in1 = 1 - TS_in1/1000;
      v_in1 = VS_in1/TS_in1;
      d_in1 = 1/(u_in1/d_h2o + (1 - u_in1)*(v_in1/d_vs + (1 - v_in1)/d_nvs));
      alpha_in1 = (pVS_in1 - VS_in1)/(pVS_in1 - sVS_in1);
//
/* Constant input variables of substrate #1 (soluble gases, biomasses, soluble COD excluding VFA) */
      Sludge_Out.S_h2 = S_h2_input1;
      Sludge_Out.S_ch4 = S_ch4_input1;
      Sludge_Out.X_su = X_su_input1;
      Sludge_Out.X_aa = X_aa_input1;
      Sludge_Out.X_fa = X_fa_input1;
      Sludge_Out.X_c4 = X_c4_input1;
      Sludge_Out.X_pro = X_pro_input1;
      Sludge_Out.X_ac = X_ac_input1;
      Sludge_Out.X_h2 = X_h2_input1;
      Sludge_Out.S_su = S_su_input1;
      Sludge_Out.S_aa = S_aa_input1;
      Sludge_Out.S_fa = S_fa_input1;
      Sludge_Out.S_i = S_i_input1;
//
/* Computation of variables S_ac, S_pro, S_bu, S_va */
      Sludge_Out.S_ac = ac_in1*COD_Ac/MWHAc/1000;
      Sludge_Out.S_pro = pro_in1*COD_Pro/MWHPro/1000;
      Sludge_Out.S_bu = (bu_in1 + isobu_in1)*COD_Bu/MWHBu/1000;
      Sludge_Out.S_va = (va_in1 + isova_in1)*COD_Va/MWHVa/1000;
//
/* Computation of COD components */
      pLI_VS_in1 = pLI_pVS_in1*(1 - alpha_in1)*pVS_in1/VS_in1;
      tLI_in1 = pLI_VS_in1*VS_in1*d_in1/1000;
      COD_VFA_in1 = Sludge_Out.S_ac + Sludge_Out.S_pro + Sludge_Out.S_bu + Sludge_Out.S_va;
      tCOD_in1 = COD_VFA_in1 + tCH_in1*COD_CH_in/1000 + (tPR_in1*d_in1/1000 - TAN_in1)*COD_PR_in*PR_N_in/1000 + tLI_in1*COD_LI_in/1000;
      pCOD_in1 = tCOD_in1 - COD_VFA_in1;
      tBMP_COD_in1 = tBMP_VS_in1/tCOD_in1*VS_in1*d_in1/1000;
      fd_tCOD_in1 = tBMP_COD_in1/(R*T_ref/P_atm_Pa/MWO2/2*1000*(1 - f_newbio_BMP));
      tCOD_in1*fd_tCOD_in1 = COD_VFA_in1 + pCOD_in1*fd_pCOD_in1;
//
/* Computation of variables X_c, X_i, X_ch, X_pr, X_li */
      Sludge_Out.X_c = pCOD_in1*f_Xc_in1;
      pCOD_in1*(1 - fd_pCOD_in1) = Sludge_Out.X_i + Sludge_Out.X_c*f_xi_xc_in1;
      tCH_in1*COD_CH_in/1000 = Sludge_Out.X_ch + Sludge_Out.X_i*f_xch_xi_in1 + Sludge_Out.X_c*f_xch_xc_in1 + Sludge_Out.X_c*f_xi_xc_in1*f_xi_ch_xc_in1;
      (tPR_in1*d_in1/1000 - TAN_in1)*COD_PR_in*PR_N_in/1000 = Sludge_Out.X_pr + Sludge_Out.X_i*f_xpr_xi_in1 + Sludge_Out.X_c*f_xpr_xc_in1 + Sludge_Out.X_c*f_xi_xc_in1*f_xi_pr_xc_in1;
      tLI_in1*COD_LI_in/1000 = Sludge_Out.X_li + Sludge_Out.X_i*f_xli_xi_in1 + Sludge_Out.X_c*f_xli_xc_in1 + Sludge_Out.X_c*f_xi_xc_in1*f_xi_li_xc_in1;
      f_xch_xi_in1 + f_xpr_xi_in1 + f_xli_xi_in1 = 1;
      f_xch_xc_in1 + f_xpr_xc_in1 + f_xli_xc_in1 + f_xi_xc_in1 = 1;
      f_xi_ch_xc_in1 + f_xi_pr_xc_in1 + f_xi_li_xc_in1 = 1;
//
/* Computation of VFA acid-base constants at standart T and P */
      Ka_va_in1 = convKa*10^(-pKa_va)*1000;
      Ka_bu_in1 = convKa*10^(-pKa_bu)*1000;
      Ka_pro_in1 = convKa*10^(-pKa_pro)*1000;
      Ka_ac_in1 = convKa*10^(-pKa_ac)*1000;
//
/* Computation of temperature dependant parameters for charge balance */
      Ka_co2_in1 = 10^(-pKa_co2)*1000*exp(deltaH0_Ka_co2/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hco3_in1 = 10^(-pKa_hco3)*1000*exp(deltaH0_Ka_hco3/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h3po4_in1 = 10^(-pKa_h3po4)*1000*exp(deltaH0_Ka_h3po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2po4_in1 = 10^(-pKa_h2po4)*1000*exp(deltaH0_Ka_h2po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hpo4_in1 = 10^(-pKa_hpo4)*1000*exp(deltaH0_Ka_hpo4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_nh3_in1 = 10^(-pKa_nh3)*1000*exp(deltaH0_Ka_nh3/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2o_in1 = 10^(-pKa_h2o)*1000*exp(deltaH0_Ka_h2o/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
//
/* Computation of ionic components */
      S_ac_mol_in1 = ac_in1/MWHAc/1000;
      S_pro_mol_in1 = pro_in1/MWHPro/1000;
      S_bu_mol_in1 = (bu_in1 + isobu_in1)/MWHBu/1000;
      S_va_mol_in1 = (va_in1 + isova_in1)/MWHVa/1000;
      S_ac_ion_in1 = Ka_ac_in1*S_ac_mol_in1/(S_h_in1 + Ka_ac_in1);
      S_pro_ion_in1 = Ka_pro_in1*S_pro_mol_in1/(S_h_in1 + Ka_pro_in1);
      S_bu_ion_in1 = Ka_bu_in1*S_bu_mol_in1/(S_h_in1 + Ka_bu_in1);
      S_va_ion_in1 = Ka_va_in1*S_va_mol_in1/(S_h_in1 + Ka_va_in1);
      S_h_in1 = 10^(-pH_in1)*1000*convKa;
      S_oh_in1 = Ka_h2o_in1/S_h_in1*convKa;
      Alk_mol_in1 = Alk_in1/MWCaCO3*2/1000;
      S_hco3_in1 + 2*S_co3_in1 = Alk_mol_in1 - (S_ac_ion_in1 + S_pro_ion_in1 + S_bu_ion_in1 + S_va_ion_in1) - S_oh_in1 - S_nh3_in1 + S_h_in1 - S_h2po4_in1 - 2*S_po4_in1 + S_h3po4_in1 "TO BE VERIFIED";
      S_co3_in1 = Ka_hco3_in1*Sludge_Out.S_ic/(S_h_in1^2/Ka_co2_in1 + S_h_in1 + Ka_hco3_in1);
      S_hco3_in1 = Ka_co2_in1*Sludge_Out.S_ic*S_h_in1/(S_h_in1^2 + Ka_co2_in1*S_h_in1 + Ka_co2_in1*Ka_hco3_in1);
//  S_hco3_in1 = Alk_mol_in1 - (S_ac_ion_in1 + S_pro_ion_in1 + S_bu_ion_in1 + S_va_ion_in1) - S_oh_in1 - S_nh3_in1 + S_h_in1; //ATTENZIONE!!
//  Sludge_Out.S_ic = S_hco3_in1*(S_h_in1 + Ka_co2_in1)/Ka_co2_in1;
      Sludge_Out.S_ic = S_co3_in1 + S_hco3_in1 + S_co2_in1;
      Sludge_Out.S_in = TAN_in1/MWN/1000;
      S_nh4_in1 = Sludge_Out.S_in*S_h_in1/(Ka_nh3_in1 + S_h_in1);
      S_nh3_in1 = Sludge_Out.S_in - S_nh4_in1;
      Sludge_Out.S_ip = if noEvent(TS_in1 > 0) then TP_in1/MWP/1000 else 0;
      S_po4_in1 = Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1*Sludge_Out.S_ip/(S_h_in1^3 + Ka_h3po4_in1*S_h_in1^2 + Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1 + Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1);
      S_hpo4_in1 = Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1*Sludge_Out.S_ip/(S_h_in1^3 + Ka_h3po4_in1*S_h_in1^2 + Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1 + Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1);
      S_h2po4_in1 = Ka_h3po4_in1*S_h_in1^2*Sludge_Out.S_ip/(S_h_in1^3 + Ka_h3po4_in1*S_h_in1^2 + Ka_h3po4_in1*Ka_h2po4_in1*S_h_in1 + Ka_h3po4_in1*Ka_h2po4_in1*Ka_hpo4_in1);
      S_h3po4_in1 + S_h2po4_in1 + S_hpo4_in1 + S_po4_in1 = Sludge_Out.S_ip;
      Sludge_Out.S_an = S_an_input1;
      Sludge_Out.S_cat = (-S_nh4_in1) - S_h_in1 + Sludge_Out.S_an + S_hco3_in1 + 2*S_co3_in1 + 3*S_po4_in1 + 2*S_hpo4_in1 + S_h2po4_in1 + S_oh_in1 + S_ac_ion_in1 + S_pro_ion_in1 + S_bu_ion_in1 + S_va_ion_in1;
//
/* Computation of masses */
//  Sludge_Out.M_S_su = S_su_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_aa = S_aa_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_fa = S_fa_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_va = S_va_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_bu = S_bu_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_pro = S_pro_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_ac = S_ac_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_h2 = S_h2_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_ch4 = S_ch4_in1 * Sludge_Out.Q;
//  Sludge_Out.Mol_S_ic = S_ic_in1 * Sludge_Out.Q;
//  Sludge_Out.Mol_S_in = S_in_in1 * Sludge_Out.Q;
//  Sludge_Out.M_S_i = S_i_in1 * Sludge_Out.Q;
//  Sludge_Out.Mol_S_cat = S_cat_in1 * Sludge_Out.Q;
//  Sludge_Out.Mol_S_an = S_an_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_c = X_c_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_ch = X_ch_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_pr = X_pr_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_li = X_li_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_su = X_su_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_aa = X_aa_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_fa = X_fa_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_c4 = X_c4_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_pro = X_pro_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_ac = X_ac_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_h2 = X_h2_in1 * Sludge_Out.Q;
//  Sludge_Out.M_X_i = X_i_in1 * Sludge_Out.Q;
//
/* Stoichiometric coffiecients of disintegration process for interface Feed */
      Sludge_Out.f_si_xc = f_si_xc_in1;
      Sludge_Out.f_xi_xc = f_xi_xc_in1;
      Sludge_Out.f_xch_xc = f_xch_xc_in1;
      Sludge_Out.f_xpr_xc = f_xpr_xc_in1;
      Sludge_Out.f_xli_xc = f_xli_xc_in1;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        Diagram(graphics = {Rectangle(extent = {{-66, 2}, {-66, 2}})}));
    end Feed_1;

    model Feed_2
      extends Icons.Feed2;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Physiochemical;
      extends Variables.OtherVariables_Feed2;
      Interfaces.Feed Yogurth_Out annotation(
        Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput FlowRate_2[1] annotation(
        Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, 51}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Concentrations_2[20] annotation(
        Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-69, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
    equation
/* Input data from CombiTimeTables */
      Q_in2_d = -FlowRate_2[1] "m3/d";
      TS_in2 = Concentrations_2[1] "gVS/kg";
      VS_in2 = Concentrations_2[2] "gVS/kg";
      pVS_in2 = Concentrations_2[3] "gVSp/kgp";
      sVS_in2 = Concentrations_2[4] "gVSs/kgs";
      sCOD_in2 = Concentrations_2[5] "gCOD/m3";
      tCH_in2 = Concentrations_2[6] "gGlu/m3";
      sCH_in2 = Concentrations_2[7] "gGlu/m3";
      tPR_in2 = Concentrations_2[8] "gBSA/m3";
      sPR_in2 = Concentrations_2[9] "gBSA/m3";
      pLI_pVS_in2 = Concentrations_2[10] "gLI/kgpVS";
      ac_in2 = Concentrations_2[11] "gHAc/m3";
      pro_in2 = Concentrations_2[12] "gHPro/m3";
      isobu_in2 = Concentrations_2[13] "gHBu/m3";
      bu_in2 = Concentrations_2[14] "gHBu/m3";
      isova_in2 = Concentrations_2[15] "gHVa/m3";
      va_in2 = Concentrations_2[16] "gHVa/m3";
      pH_in2 = Concentrations_2[17] "-";
      Alk_in2 = Concentrations_2[18] "gCaCO3/m3";
      TAN_in2 = Concentrations_2[19] "gN/m3";
      TP_in2 = Concentrations_2[20] "gP/m3";
//
/* Flow rate of substrate #2 */
      Yogurth_Out.Q = Q_in2_d/86400;
//
/* Physical properties of substrate #2 */
      u_in2 = if noEvent(TS_in2 > 0) then 1 - TS_in2/1000 else 0;
      v_in2 = if noEvent(TS_in2 > 0) then VS_in2/TS_in2 else 0;
      d_in2 = if noEvent(TS_in2 > 0) then 1/(u_in2/d_h2o + (1 - u_in2)*(v_in2/d_vs + (1 - v_in2)/d_nvs)) else 0;
      alpha_in2 = if noEvent(TS_in2 > 0) then (pVS_in2 - VS_in2)/(pVS_in2 - sVS_in2) else 0;
//
/* Constant input variables of substrate #2 (soluble gases and biomasses; all COD is degradable and alreadey disintegrated) */
      Yogurth_Out.S_h2 = S_h2_input2;
      Yogurth_Out.S_ch4 = S_ch4_input2;
      Yogurth_Out.X_su = X_su_input2;
      Yogurth_Out.X_aa = X_aa_input2;
      Yogurth_Out.X_fa = X_fa_input2;
      Yogurth_Out.X_c4 = X_c4_input2;
      Yogurth_Out.X_pro = X_pro_input2;
      Yogurth_Out.X_ac = X_ac_input2;
      Yogurth_Out.X_h2 = X_h2_input2;
      Yogurth_Out.S_i = S_i_input2;
      Yogurth_Out.X_i = X_i_input2 "All COD is degradable";
      Yogurth_Out.X_c = X_c_input2 "All COD enters the digester as already disintegrated organic matter";
//
/* Computation of variables S_ac, S_pro, S_bu, S_va */
      Yogurth_Out.S_ac = if noEvent(TS_in2 > 0) then ac_in2*COD_Ac/MWHAc/1000 else 0;
      Yogurth_Out.S_pro = if noEvent(TS_in2 > 0) then pro_in2*COD_Pro/MWHBu/1000 else 0;
      Yogurth_Out.S_bu = if noEvent(TS_in2 > 0) then (bu_in2 + isobu_in2)*COD_Bu/MWHPro/1000 else 0;
      Yogurth_Out.S_va = if noEvent(TS_in2 > 0) then (va_in2 + isova_in2)*COD_Va/MWHVa/1000 else 0;
//
/* Computation of soluble COD components */
      Yogurth_Out.S_su = if noEvent(TS_in2 > 0) then sCH_in2/1000*COD_CH_in else 0;
      Yogurth_Out.S_aa = if noEvent(TS_in2 > 0) then sPR_in2/1000*COD_PR_BSA_in else 0;
      Yogurth_Out.S_fa = if noEvent(sCOD_in2/1000 - COD_VFA_in2 - Yogurth_Out.S_su - Yogurth_Out.S_aa > 0) then sCOD_in2/1000 - COD_VFA_in2 - Yogurth_Out.S_su - Yogurth_Out.S_aa else 0;
//
/* Computation of COD components */
      pLI_VS_in2 = if noEvent(TS_in2 > 0) then pLI_pVS_in2*(1 - alpha_in2)*pVS_in2/VS_in2 else 0;
      tLI_in2 = if noEvent(TS_in2 > 0) then pLI_VS_in2*VS_in2*d_in2/1000 + Yogurth_Out.S_fa*1000/COD_LI_in else 0;
      COD_VFA_in2 = if noEvent(TS_in2 > 0) then Yogurth_Out.S_ac + Yogurth_Out.S_pro + Yogurth_Out.S_bu + Yogurth_Out.S_va else 0;
      tCOD_in2 = if noEvent(TS_in2 > 0) then COD_VFA_in2 + tCH_in2*COD_CH_in/1000 + tPR_in2*COD_PR_BSA_in/1000 + tLI_in2*COD_LI_in/1000 else 0;
      pCOD_in2 = if noEvent(TS_in2 > 0) then tCOD_in2 - Yogurth_Out.S_su - Yogurth_Out.S_aa - Yogurth_Out.S_fa - COD_VFA_in2 else 0;
//
/* Computation of variables X_ch, X_pr, X_li */
      Yogurth_Out.X_ch = if noEvent(TS_in2 > 0) then (tCH_in2 - sCH_in2)/1000*COD_CH_in else 0;
      Yogurth_Out.X_pr = if noEvent(TS_in2 > 0) then (tPR_in2 - sPR_in2)/1000*COD_PR_BSA_in else 0;
      Yogurth_Out.X_li = if noEvent(TS_in2 > 0) then pLI_VS_in2*VS_in2*d_in2/1000/1000*COD_LI_in else 0;
//
/* Computation of VFA acid-base constants at standart T and P */
      Ka_va_in2 = convKa*10^(-pKa_va)*1000;
      Ka_bu_in2 = convKa*10^(-pKa_bu)*1000;
      Ka_pro_in2 = convKa*10^(-pKa_pro)*1000;
      Ka_ac_in2 = convKa*10^(-pKa_ac)*1000;
//
/* Computation of temperature dependant parameters for charge balance */
      Ka_co2_in2 = 10^(-pKa_co2)*1000*exp(deltaH0_Ka_co2/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hco3_in2 = 10^(-pKa_hco3)*1000*exp(deltaH0_Ka_hco3/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h3po4_in2 = 10^(-pKa_h3po4)*1000*exp(deltaH0_Ka_h3po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2po4_in2 = 10^(-pKa_h2po4)*1000*exp(deltaH0_Ka_h2po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hpo4_in2 = 10^(-pKa_hpo4)*1000*exp(deltaH0_Ka_hpo4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_nh3_in2 = 10^(-pKa_nh3)*1000*exp(deltaH0_Ka_nh3/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2o_in2 = 10^(-pKa_h2o)*1000*exp(deltaH0_Ka_h2o/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
//
/* Computation of ionic components */
      S_ac_mol_in2 = if noEvent(TS_in2 > 0) then ac_in2/MWHAc/1000 else 0;
      S_pro_mol_in2 = if noEvent(TS_in2 > 0) then pro_in2/MWHPro/1000 else 0;
      S_bu_mol_in2 = if noEvent(TS_in2 > 0) then (bu_in2 + isobu_in2)/MWHBu/1000 else 0;
      S_va_mol_in2 = if noEvent(TS_in2 > 0) then (va_in2 + isova_in2)/MWHVa/1000 else 0;
      S_ac_ion_in2 = if noEvent(TS_in2 > 0) then Ka_ac_in2*S_ac_mol_in2/(S_h_in2 + Ka_ac_in2) else 0;
      S_pro_ion_in2 = if noEvent(TS_in2 > 0) then Ka_pro_in2*S_pro_mol_in2/(S_h_in2 + Ka_pro_in2) else 0;
      S_bu_ion_in2 = if noEvent(TS_in2 > 0) then Ka_bu_in2*S_bu_mol_in2/(S_h_in2 + Ka_bu_in2) else 0;
      S_va_ion_in2 = if noEvent(TS_in2 > 0) then Ka_va_in2*S_va_mol_in2/(S_h_in2 + Ka_va_in2) else 0;
      S_h_in2 = if noEvent(TS_in2 > 0) then 10^(-pH_in2)*1000*convKa else 0;
      S_oh_in2 = if noEvent(TS_in2 > 0) then Ka_h2o_in2/S_h_in2*convKa else 0;
      Alk_mol_in2 = if noEvent(TS_in2 > 0) then Alk_in2/MWCaCO3*2/1000 else 0;
      Yogurth_Out.S_ic = 0;
      S_hco3_in2 = 0;
      S_co3_in2 = 0;
      S_co2_in2 = 0;
      Yogurth_Out.S_in = if noEvent(TS_in2 > 0) then TAN_in2/MWN/1000 else 0;
      S_nh4_in2 = if noEvent(TS_in2 > 0) then Yogurth_Out.S_in*S_h_in2/(Ka_nh3_in2 + S_h_in2) else 0;
      S_nh3_in2 = Yogurth_Out.S_in - S_nh4_in2;
      Yogurth_Out.S_ip = if noEvent(TS_in2 > 0) then TP_in2/MWP/1000 else 0;
      S_po4_in2 = Ka_h3po4_in2*Ka_h2po4_in2*Ka_hpo4_in2*Yogurth_Out.S_ip/(S_h_in2^3 + Ka_h3po4_in2*S_h_in2^2 + Ka_h3po4_in2*Ka_h2po4_in2*S_h_in2 + Ka_h3po4_in2*Ka_h2po4_in2*Ka_hpo4_in2);
      S_hpo4_in2 = Ka_h3po4_in2*Ka_h2po4_in2*S_h_in2*Yogurth_Out.S_ip/(S_h_in2^3 + Ka_h3po4_in2*S_h_in2^2 + Ka_h3po4_in2*Ka_h2po4_in2*S_h_in2 + Ka_h3po4_in2*Ka_h2po4_in2*Ka_hpo4_in2);
      S_h2po4_in2 = Ka_h3po4_in2*S_h_in2^2*Yogurth_Out.S_ip/(S_h_in2^3 + Ka_h3po4_in2*S_h_in2^2 + Ka_h3po4_in2*Ka_h2po4_in2*S_h_in2 + Ka_h3po4_in2*Ka_h2po4_in2*Ka_hpo4_in2);
      S_h3po4_in2 + S_h2po4_in2 + S_hpo4_in2 + S_po4_in2 = Yogurth_Out.S_ip;
      Yogurth_Out.S_an = if noEvent(TS_in2 > 0) then S_an_input2 else 0;
      Yogurth_Out.S_cat = if noEvent(TS_in2 > 0) then (-S_nh4_in2) - S_h_in2 + Yogurth_Out.S_an + S_hco3_in2 + 2*S_co3_in2 + 3*S_po4_in2 + 2*S_hpo4_in2 + S_h2po4_in2 + S_oh_in2 + S_ac_ion_in2 + S_pro_ion_in2 + S_bu_ion_in2 + S_va_ion_in2 else 0;
//
///* Computation of masses */
//  Yogurth_Out.M_S_su = S_su_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_aa = S_aa_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_fa = S_fa_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_va = S_va_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_bu = S_bu_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_pro = S_pro_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_ac = S_ac_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_h2 = S_h2_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_ch4 = S_ch4_in2*Yogurth_Out.Q;
//  Yogurth_Out.Mol_S_ic = S_ic_in2*Yogurth_Out.Q;
//  Yogurth_Out.Mol_S_in = S_in_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_S_i = S_i_in2*Yogurth_Out.Q;
//  Yogurth_Out.Mol_S_cat = S_cat_in2*Yogurth_Out.Q;
//  Yogurth_Out.Mol_S_an = S_an_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_c = X_c_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_ch = X_ch_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_pr = X_pr_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_li = X_li_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_su = X_su_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_aa = X_aa_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_fa = X_fa_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_c4 = X_c4_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_pro = X_pro_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_ac = X_ac_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_h2 = X_h2_in2*Yogurth_Out.Q;
//  Yogurth_Out.M_X_i = X_i_in2*Yogurth_Out.Q;
//
/* Stoichiometric coffiecients of disintegration process for interface Feed */
      Yogurth_Out.f_si_xc = f_si_xc_in2;
      Yogurth_Out.f_xi_xc = f_xi_xc_in2;
      Yogurth_Out.f_xch_xc = f_xch_xc_in2;
      Yogurth_Out.f_xpr_xc = f_xpr_xc_in2;
      Yogurth_Out.f_xli_xc = f_xli_xc_in2;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Feed_2;

    model Feeding_Tank
      extends Icons.FeedingTank;
      Interfaces.Feed Sludge_In annotation(
        Placement(visible = true, transformation(origin = {-80, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-72, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1.Interfaces.Feed Yogurth_In annotation(
        Placement(visible = true, transformation(origin = {-80, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-72, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.Feed FeedMix_Out annotation(
        Placement(visible = true, transformation(origin = {80, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      Sludge_In.Q + Yogurth_In.Q + FeedMix_Out.Q = 0;
      FeedMix_Out.Q*FeedMix_Out.S_su + Sludge_In.Q*Sludge_In.S_su + Yogurth_In.Q*Yogurth_In.S_su = 0;
      FeedMix_Out.Q*FeedMix_Out.S_aa + Sludge_In.Q*Sludge_In.S_aa + Yogurth_In.Q*Yogurth_In.S_aa = 0;
      FeedMix_Out.Q*FeedMix_Out.S_fa + Sludge_In.Q*Sludge_In.S_fa + Yogurth_In.Q*Yogurth_In.S_fa = 0;
      FeedMix_Out.Q*FeedMix_Out.S_va + Sludge_In.Q*Sludge_In.S_va + Yogurth_In.Q*Yogurth_In.S_va = 0;
      FeedMix_Out.Q*FeedMix_Out.S_bu + Sludge_In.Q*Sludge_In.S_bu + Yogurth_In.Q*Yogurth_In.S_bu = 0;
      FeedMix_Out.Q*FeedMix_Out.S_pro + Sludge_In.Q*Sludge_In.S_pro + Yogurth_In.Q*Yogurth_In.S_pro = 0;
      FeedMix_Out.Q*FeedMix_Out.S_ac + Sludge_In.Q*Sludge_In.S_ac + Yogurth_In.Q*Yogurth_In.S_ac = 0;
      FeedMix_Out.Q*FeedMix_Out.S_h2 + Sludge_In.Q*Sludge_In.S_h2 + Yogurth_In.Q*Yogurth_In.S_h2 = 0;
      FeedMix_Out.Q*FeedMix_Out.S_ch4 + Sludge_In.Q*Sludge_In.S_ch4 + Yogurth_In.Q*Yogurth_In.S_ch4 = 0;
      FeedMix_Out.Q*FeedMix_Out.S_ic + Sludge_In.Q*Sludge_In.S_ic + Yogurth_In.Q*Yogurth_In.S_ic = 0;
      FeedMix_Out.Q*FeedMix_Out.S_in + Sludge_In.Q*Sludge_In.S_in + Yogurth_In.Q*Yogurth_In.S_in = 0;
      FeedMix_Out.Q*FeedMix_Out.S_ip + Sludge_In.Q*Sludge_In.S_ip + Yogurth_In.Q*Yogurth_In.S_ip = 0;
      FeedMix_Out.Q*FeedMix_Out.S_i + Sludge_In.Q*Sludge_In.S_i + Yogurth_In.Q*Yogurth_In.S_i = 0;
      FeedMix_Out.Q*FeedMix_Out.S_cat + Sludge_In.Q*Sludge_In.S_cat + Yogurth_In.Q*Yogurth_In.S_cat = 0;
      FeedMix_Out.Q*FeedMix_Out.S_an + Sludge_In.Q*Sludge_In.S_an + Yogurth_In.Q*Yogurth_In.S_an = 0;
      FeedMix_Out.Q*FeedMix_Out.X_c + Sludge_In.Q*Sludge_In.X_c + Yogurth_In.Q*Yogurth_In.X_c = 0;
      FeedMix_Out.Q*FeedMix_Out.X_ch + Sludge_In.Q*Sludge_In.X_ch + Yogurth_In.Q*Yogurth_In.X_ch = 0;
      FeedMix_Out.Q*FeedMix_Out.X_pr + Sludge_In.Q*Sludge_In.X_pr + Yogurth_In.Q*Yogurth_In.X_pr = 0;
      FeedMix_Out.Q*FeedMix_Out.X_li + Sludge_In.Q*Sludge_In.X_li + Yogurth_In.Q*Yogurth_In.X_li = 0;
      FeedMix_Out.Q*FeedMix_Out.X_su + Sludge_In.Q*Sludge_In.X_su + Yogurth_In.Q*Yogurth_In.X_su = 0;
      FeedMix_Out.Q*FeedMix_Out.X_aa + Sludge_In.Q*Sludge_In.X_aa + Yogurth_In.Q*Yogurth_In.X_aa = 0;
      FeedMix_Out.Q*FeedMix_Out.X_fa + Sludge_In.Q*Sludge_In.X_fa + Yogurth_In.Q*Yogurth_In.X_fa = 0;
      FeedMix_Out.Q*FeedMix_Out.X_c4 + Sludge_In.Q*Sludge_In.X_c4 + Yogurth_In.Q*Yogurth_In.X_c4 = 0;
      FeedMix_Out.Q*FeedMix_Out.X_pro + Sludge_In.Q*Sludge_In.X_pro + Yogurth_In.Q*Yogurth_In.X_pro = 0;
      FeedMix_Out.Q*FeedMix_Out.X_ac + Sludge_In.Q*Sludge_In.X_ac + Yogurth_In.Q*Yogurth_In.X_ac = 0;
      FeedMix_Out.Q*FeedMix_Out.X_h2 + Sludge_In.Q*Sludge_In.X_h2 + Yogurth_In.Q*Yogurth_In.X_h2 = 0;
      FeedMix_Out.Q*FeedMix_Out.X_i + Sludge_In.Q*Sludge_In.X_i + Yogurth_In.Q*Yogurth_In.X_i = 0;
      FeedMix_Out.Q*FeedMix_Out.X_c*FeedMix_Out.f_si_xc + Sludge_In.Q*Sludge_In.X_c*Sludge_In.f_si_xc + Yogurth_In.Q*Yogurth_In.X_c*Yogurth_In.f_si_xc = 0;
      FeedMix_Out.Q*FeedMix_Out.X_c*FeedMix_Out.f_xi_xc + Sludge_In.Q*Sludge_In.X_c*Sludge_In.f_xi_xc + Yogurth_In.Q*Yogurth_In.X_c*Yogurth_In.f_xi_xc = 0;
      FeedMix_Out.Q*FeedMix_Out.X_c*FeedMix_Out.f_xch_xc + Sludge_In.Q*Sludge_In.X_c*Sludge_In.f_xch_xc + Yogurth_In.Q*Yogurth_In.X_c*Yogurth_In.f_xch_xc = 0;
      FeedMix_Out.Q*FeedMix_Out.X_c*FeedMix_Out.f_xpr_xc + Sludge_In.Q*Sludge_In.X_c*Sludge_In.f_xpr_xc + Yogurth_In.Q*Yogurth_In.X_c*Yogurth_In.f_xpr_xc = 0;
      FeedMix_Out.Q*FeedMix_Out.X_c*FeedMix_Out.f_xli_xc + Sludge_In.Q*Sludge_In.X_c*Sludge_In.f_xli_xc + Yogurth_In.Q*Yogurth_In.X_c*Yogurth_In.f_xli_xc = 0;
    end Feeding_Tank;

    model Digester
      extends Icons.Digester;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Stoichiometric;
      extends Parameters.Parameters_Kinetic;
      extends Parameters.Parameters_Physiochemical;
      extends Variables.StateVariables_Digester;
      extends Variables.OtherVariables_MassBalance;
      Interfaces.Feed FeedMix_In annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.Digestate Digestate_Out annotation(
        Placement(visible = true, transformation(origin = {72, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.Gas Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-86, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
    equation
/* ADM1 State Variables of feeding mixture */
//  S_su_in = FeedMix_In.M_S_su/FeedMix_In.Q;
//  S_aa_in = FeedMix_In.M_S_aa/FeedMix_In.Q;
//  S_fa_in = FeedMix_In.M_S_fa/FeedMix_In.Q;
//  S_va_in = FeedMix_In.M_S_va/FeedMix_In.Q;
//  S_bu_in = FeedMix_In.M_S_bu/FeedMix_In.Q;
//  S_pro_in = FeedMix_In.M_S_pro/FeedMix_In.Q;
//  S_ac_in = FeedMix_In.M_S_ac/FeedMix_In.Q;
//  S_h2_in = FeedMix_In.M_S_h2/FeedMix_In.Q;
//  S_ch4_in = FeedMix_In.M_S_ch4/FeedMix_In.Q;
//  S_ic_in = FeedMix_In.Mol_S_ic/FeedMix_In.Q;
//  S_in_in = FeedMix_In.Mol_S_in/FeedMix_In.Q;
//  S_i_in = FeedMix_In.M_S_i/FeedMix_In.Q;
//  S_cat_in = FeedMix_In.Mol_S_cat/FeedMix_In.Q;
//  S_an_in = FeedMix_In.Mol_S_an/FeedMix_In.Q;
//  X_c_in = FeedMix_In.M_X_c/FeedMix_In.Q;
//  X_ch_in = FeedMix_In.M_X_ch/FeedMix_In.Q;
//  X_pr_in = FeedMix_In.M_X_pr/FeedMix_In.Q;
//  X_li_in = FeedMix_In.M_X_li/FeedMix_In.Q;
//  X_su_in = FeedMix_In.M_X_su/FeedMix_In.Q;
//  X_aa_in = FeedMix_In.M_X_aa/FeedMix_In.Q;
//  X_fa_in = FeedMix_In.M_X_fa/FeedMix_In.Q;
//  X_c4_in = FeedMix_In.M_X_c4/FeedMix_In.Q;
//  X_pro_in = FeedMix_In.M_X_pro/FeedMix_In.Q;
//  X_ac_in = FeedMix_In.M_X_ac/FeedMix_In.Q;
//  X_h2_in = FeedMix_In.M_X_h2/FeedMix_In.Q;
//  X_i_in = FeedMix_In.M_X_i/FeedMix_In.Q;
//  FeedMix_In.M_X_c*f_si_xc = FeedMix_In.M_si_xc;
//  FeedMix_In.M_X_c*f_xi_xc = FeedMix_In.M_xi_xc;
//  FeedMix_In.M_X_c*f_xch_xc = FeedMix_In.M_xch_xc;
//  FeedMix_In.M_X_c*f_xpr_xc = FeedMix_In.M_xpr_xc;
//  FeedMix_In.M_X_c*f_xli_xc = FeedMix_In.M_xli_xc;
//
/* Stoichiometric parameters */
      f_h2_su = 0.33*nu_1_su + 0.17*(1 - nu_1_su - nu_2_su);
      f_bu_su = 0.83*(1 - nu_1_su - nu_2_su);
      f_pro_su = 0.78*nu_2_su;
      f_ac_su = 0.67*nu_1_su + 0.22*nu_2_su;
//
/* VFA acid-base constants at standart T and P */
      Ka_va = convKa*10^(-pKa_va)*1000;
      Ka_bu = convKa*10^(-pKa_bu)*1000;
      Ka_pro = convKa*10^(-pKa_pro)*1000;
      Ka_ac = convKa*10^(-pKa_ac)*1000;
//
/* Temperature dependent parameters */
      Ka_co2 = convKa*10^(-pKa_co2)*1000*exp(deltaH0_Ka_co2/R*(1/T_ref_phychem - 1/T_op));
      Ka_hco3 = convKa*10^(-pKa_hco3)*1000*exp(deltaH0_Ka_hco3/R*(1/T_ref_phychem - 1/T_op));
      Ka_h3po4 = 10^(-pKa_h3po4)*1000*exp(deltaH0_Ka_h3po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_h2po4 = 10^(-pKa_h2po4)*1000*exp(deltaH0_Ka_h2po4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_hpo4 = 10^(-pKa_hpo4)*1000*exp(deltaH0_Ka_hpo4/R*(1/T_ref_phychem - 1/T_op_mean))*convKa;
      Ka_nh3 = convKa*10^(-pKa_nh3)*1000*exp(deltaH0_Ka_nh3/R*(1/T_ref_phychem - 1/T_op));
      Ka_h2o = convKa*10^(-pKa_h2o)*1000*exp(deltaH0_Ka_h2o/R*(1/T_ref_phychem - 1/T_op));
      KH_ch4 = KH_ch4_Tref*exp(deltaH0_KH_ch4/R*(1/T_ref_phychem - 1/T_op));
      KH_co2 = KH_co2_Tref*exp(deltaH0_KH_co2/R*(1/T_ref_phychem - 1/T_op));
      KH_h2 = KH_h2_Tref*exp(deltaH0_KH_h2/R*(1/T_ref_phychem - 1/T_op));
      KH_nh3 = KH_nh3_Tref;
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref_phychem - 1/T_op));
      k_dis_T = k_dis/86400;
      k_hyd_ch_T = k_hyd_ch/86400*exp(expth_k_hyd*(T_op - T_ref_bio));
      k_hyd_pr_T = k_hyd_pr/86400*exp(expth_k_hyd*(T_op - T_ref_bio));
      k_hyd_li_T = k_hyd_li/86400*exp(expth_k_hyd*(T_op - T_ref_bio));
      k_m_su_T = k_m_su/86400*exp(expth_k_m_su*(T_op - T_ref_bio));
      k_m_aa_T = k_m_aa/86400*exp(expth_k_m_aa*(T_op - T_ref_bio));
      k_m_fa_T = k_m_fa/86400*exp(expth_k_m_fa*(T_op - T_ref_bio));
      k_m_pro_T = k_m_pro/86400*exp(expth_k_m_pro*(T_op - T_ref_bio));
      k_m_c4_T = k_m_c4/86400 "not found expth_k_m_c4";
      k_m_ac_T = k_m_ac/86400*exp(expth_k_m_ac*(T_op - T_ref_bio));
      k_m_h2_T = k_m_h2/86400*exp(expth_k_m_h2*(T_op - T_ref_bio));
      Ks_su_T = Ks_su*exp(expth_Ks_su*(T_op - T_ref_bio));
      Ks_aa_T = Ks_aa*exp(expth_Ks_aa*(T_op - T_ref_bio));
      Ks_fa_T = Ks_fa*exp(expth_Ks_fa*(T_op - T_ref_bio));
      Ks_pro_T = Ks_pro*exp(expth_Ks_pro*(T_op - T_ref_bio));
      Ks_c4_T = Ks_c4 "not found expth_Ks_c4";
      Ks_ac_T = Ks_ac*exp(expth_Ks_ac*(T_op - T_ref_bio));
      Ks_h2_T = Ks_h2*exp(expth_Ks_h2*(T_op - T_ref_bio));
      k_dec_su_T = k_dec_su/86400*exp(expth_k_dec_su*(T_op - T_ref_bio));
      k_dec_aa_T = k_dec_aa/86400*exp(expth_k_dec_aa*(T_op - T_ref_bio));
      k_dec_fa_T = k_dec_fa/86400*exp(expth_k_dec_fa*(T_op - T_ref_bio));
      k_dec_pro_T = k_dec_pro/86400*exp(expth_k_dec_pro*(T_op - T_ref_bio));
      k_dec_c4_T = k_dec_c4/86400 "not found expth_k_dec_c4";
      k_dec_ac_T = k_dec_ac/86400*exp(expth_k_dec_ac*(T_op - T_ref_bio));
      k_dec_h2_T = k_dec_h2/86400*exp(expth_k_dec_h2*(T_op - T_ref_bio));
//
/* Inhibition functions */
      pH = -log10(S_h/1000/convKa);
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0;
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0;
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0;
      I_in_lim = 1/(1 + Ks_IN/S_in);
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa);
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4);
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro);
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac);
      I_5 = I_pH_aa*I_in_lim;
      I_6 = I_pH_aa*I_in_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro;
      I_11 = I_pH_ac*I_in_lim*I_nh3;
      I_12 = I_pH_h2*I_in_lim;
//
/* Inorganic carbon coefficients of processes */
      v1 = (-C_xc) + FeedMix_In.f_si_xc*C_si + FeedMix_In.f_xch_xc*C_ch + FeedMix_In.f_xpr_xc*C_pr + FeedMix_In.f_xli_xc*C_li + FeedMix_In.f_xi_xc*C_xi;
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
      v13 = (-C_bac) + C_xc;
//
/* Volume-specific liquid-gas transfer coefficients */
      kla_s_ch4 = kla_d_o2/86400*(D_ch4/D_o2)^(1/2);
      kla_s_h2 = kla_d_o2/86400*(D_h2/D_o2)^(1/2);
      kla_s_co2 = kla_d_o2/86400*(D_co2/D_o2)^(1/2);
      kla_s_nh3 = kla_d_o2/86400*(D_nh3/D_o2)^(1/2);
//
/* Process rates */
      r1 = k_dis_T*X_c;
      r2 = k_hyd_ch_T*X_ch;
      r3 = k_hyd_pr_T*X_pr;
      r4 = k_hyd_li_T*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4_T*S_va/(S_va + Ks_c4_T)*X_c4*S_va/(S_bu + S_va + epsilon)*I_8;
      r9 = k_m_c4_T*S_bu/(S_bu + Ks_c4_T)*X_c4*S_bu/(S_bu + S_va + epsilon)*I_9;
//r10 = k_m_pro_T * S_pro / (S_pro + Ks_pro_T) * X_pro * I_10;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T + S_pro^2/K_HPro_haldane)*X_pro*I_10;
//r11 = k_m_ac_T * S_ac / (S_ac + Ks_ac_T) * X_ac * I_11;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T + S_ac^2/K_HAc_haldane)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4_T*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
      ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
      ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
      ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
      ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
//  ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h) - Ka_co2*S_ic);
      ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h + Ka_hco3*Ka_co2/S_h) - Ka_co2*S_ic);
      ra11 = k_AB_in*(S_nh3*(Ka_nh3 + S_h) - Ka_nh3*S_in);
      ra12 = k_AB_hpo4*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h + (S_h)^2/Ka_h3po4) - Ka_h2po4*S_ip);
      ra13 = k_AB_po4*(S_po4*(Ka_hpo4 + S_h + (S_h)^2/Ka_h2po4 + (S_h)^3/(Ka_h3po4*Ka_h2po4)) - Ka_hpo4*S_ip);
      ra14 = k_AB_h2po4*(S_h2po4*(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2)) - Ka_h3po4*S_ip);
      ra15 = k_AB_co2*(S_co3*((S_h^2)/Ka_co2 + S_h + Ka_hco3) - Ka_hco3*S_ic);
      rt8 = kla_s_h2*(S_h2 - COD_h2*KH_h2*p_gas_h2);
      rt9 = kla_s_ch4*(S_ch4 - COD_ch4*KH_ch4*p_gas_ch4);
      rt10 = kla_s_co2*(S_co2 - KH_co2*p_gas_co2);
      rt12 = kla_s_nh3*(S_nh3 - KH_nh3*p_gas_nh3);
//
/* Liquid-phase equations */
      Q_wv = p_gas_h2o/P_gas*Q_gas;
//  der(V_liq) = FeedMix_In.Q + Digestate_Out.Q - Q_wv;
//  Digestate_Out.Q = if noEvent(-FeedMix_In.Q + Q_wv < 0) then (-FeedMix_In.Q + Q_wv) else (-FeedMix_In.Q);
//  Digestate_Out.Q = if noEvent(FeedMix_In.Q <= 2e-16/86400) then (-2e-16/86400+ Q_wv) else (-FeedMix_In.Q + Q_wv);
//  FeedMix_In.Q + Digestate_Out.Q - Q_wv= 0;
      FeedMix_In.Q + Digestate_Out.Q = 0;
      der(V_liq) = FeedMix_In.Q + Digestate_Out.Q;
      der(X_c)*V_liq + der(V_liq)*X_c = FeedMix_In.Q*FeedMix_In.X_c - (-Digestate_Out.Q*X_c) + V_liq*(-r1 + r13 + r14 + r15 + r16 + r17 + r18 + r19);
      der(X_ch)*V_liq + der(V_liq)*X_ch = FeedMix_In.Q*FeedMix_In.X_ch - (-Digestate_Out.Q*X_ch) + V_liq*(FeedMix_In.f_xch_xc*r1 - r2);
      der(X_pr)*V_liq + der(V_liq)*X_pr = FeedMix_In.Q*FeedMix_In.X_pr - (-Digestate_Out.Q*X_pr) + V_liq*(FeedMix_In.f_xpr_xc*r1 - r3);
      der(X_li)*V_liq + der(V_liq)*X_li = FeedMix_In.Q*FeedMix_In.X_li - (-Digestate_Out.Q*X_li) + V_liq*(FeedMix_In.f_xli_xc*r1 - r4);
      der(X_i)*V_liq + der(V_liq)*X_i = FeedMix_In.Q*FeedMix_In.X_i - (-Digestate_Out.Q*X_i) + V_liq*(FeedMix_In.f_xi_xc*r1);
      der(S_i)*V_liq + der(V_liq)*S_i = FeedMix_In.Q*FeedMix_In.S_i - (-Digestate_Out.Q*S_i) + V_liq*(FeedMix_In.f_si_xc*r1);
      der(S_su)*V_liq + der(V_liq)*S_su = FeedMix_In.Q*FeedMix_In.S_su - (-Digestate_Out.Q*S_su) + V_liq*(r2 + (1 - f_fa_li)*r4 - r5);
      der(S_aa)*V_liq + der(V_liq)*S_aa = FeedMix_In.Q*FeedMix_In.S_aa - (-Digestate_Out.Q*S_aa) + V_liq*(r3 - r6);
      der(S_fa)*V_liq + der(V_liq)*S_fa = FeedMix_In.Q*FeedMix_In.S_fa - (-Digestate_Out.Q*S_fa) + V_liq*(f_fa_li*r4 - r7);
      der(S_va)*V_liq + der(V_liq)*S_va = FeedMix_In.Q*FeedMix_In.S_va - (-Digestate_Out.Q*S_va) + V_liq*((1 - Y_aa)*f_va_aa*r6 - r8);
      der(S_bu)*V_liq + der(V_liq)*S_bu = FeedMix_In.Q*FeedMix_In.S_bu - (-Digestate_Out.Q*S_bu) + V_liq*((1 - Y_su)*f_bu_su*r5 + (1 - Y_aa)*f_bu_aa*r6 - r9);
      der(S_pro)*V_liq + der(V_liq)*S_pro = FeedMix_In.Q*FeedMix_In.S_pro - (-Digestate_Out.Q*S_pro) + V_liq*((1 - Y_su)*f_pro_su*r5 + (1 - Y_aa)*f_pro_aa*r6 + (1 - Y_c4)*0.54*r8 - r10);
      der(S_ac)*V_liq + der(V_liq)*S_ac = FeedMix_In.Q*FeedMix_In.S_ac - (-Digestate_Out.Q*S_ac) + V_liq*((1 - Y_su)*f_ac_su*r5 + (1 - Y_aa)*f_ac_aa*r6 + (1 - Y_fa)*0.7*r7 + (1 - Y_c4)*0.31*r8 + (1 - Y_c4)*0.8*r9 + (1 - Y_pro)*0.57*r10 - r11);
      der(S_h2)*V_liq + der(V_liq)*S_h2 = FeedMix_In.Q*FeedMix_In.S_h2 - (-Digestate_Out.Q*S_h2) + V_liq*((1 - Y_su)*f_h2_su*r5 + (1 - Y_aa)*f_h2_aa*r6 + (1 - Y_fa)*0.3*r7 + (1 - Y_c4)*0.15*r8 + (1 - Y_c4)*0.2*r9 + (1 - Y_pro)*0.43*r10 - r12 - rt8);
      der(S_ch4)*V_liq + der(V_liq)*S_ch4 = FeedMix_In.Q*FeedMix_In.S_ch4 - (-Digestate_Out.Q*S_ch4) + V_liq*((1 - Y_ac)*r11 + (1 - Y_h2)*r12 - rt9);
      der(S_ic)*V_liq + der(V_liq)*S_ic = FeedMix_In.Q*FeedMix_In.S_ic - (-Digestate_Out.Q*S_ic) + V_liq*(-(v1*r1 + v2*r2 + v3*r3 + v4*r4 + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10);
      der(S_in)*V_liq + der(V_liq)*S_in = FeedMix_In.Q*FeedMix_In.S_in - (-Digestate_Out.Q*S_in) + V_liq*(-Y_su*N_bac*r5 + (N_aa - Y_aa*N_bac)*r6 - Y_fa*N_bac*r7 - Y_c4*N_bac*r8 - Y_c4*N_bac*r9 - Y_pro*N_bac*r10 - Y_ac*N_bac*r11 - Y_h2*N_bac*r12 + (N_bac - N_xc)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + (N_xc - FeedMix_In.f_xi_xc*N_i - FeedMix_In.f_si_xc*N_i - FeedMix_In.f_xpr_xc*N_aa)*r1 - rt12);
      der(S_ip)*V_liq + der(V_liq)*S_ip = FeedMix_In.Q*FeedMix_In.S_ip - (-Digestate_Out.Q*S_ip);
//  + P_li*r4 - Y_su*P_bac*r5 - Y_aa*P_bac*r6 - Y_fa*P_bac*r7 - Y_c4*P_bac*r8 - Y_c4*P_bac*r9 - Y_pro*P_bac*r10 - Y_ac*P_bac*r11 - Y_h2*P_bac*r12 + (P_bac - P_i*f_xi_xb - P_li*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) - 2*(rp1 - rd1)*24*60 - (rp2 - rd2)*24*60 else Q/V_liq*(S_ip_in - S_ip) + P_li*r4 - Y_su*P_bac*r5 - Y_aa*P_bac*r6 - Y_fa*P_bac*r7 - Y_c4*P_bac*r8 - Y_c4*P_bac*r9 - Y_pro*P_bac*r10 - Y_ac*P_bac*r11 - Y_h2*P_bac*r12 + (P_bac - P_xc)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + (P_xc - f_xc[4]*P_i - f_xc[5]*P_i - f_xc[3]*P_li)*r1 - 2*(rp1 - rd1)*24*60 - (rp2 - rd2)*24*60;
      der(X_su)*V_liq + der(V_liq)*X_su = FeedMix_In.Q*FeedMix_In.X_su - (-Digestate_Out.Q*X_su) + V_liq*(Y_su*r5 - r13);
      der(X_aa)*V_liq + der(V_liq)*X_aa = FeedMix_In.Q*FeedMix_In.X_aa - (-Digestate_Out.Q*X_aa) + V_liq*(Y_aa*r6 - r14);
      der(X_fa)*V_liq + der(V_liq)*X_fa = FeedMix_In.Q*FeedMix_In.X_fa - (-Digestate_Out.Q*X_fa) + V_liq*(Y_fa*r7 - r15);
      der(X_c4)*V_liq + der(V_liq)*X_c4 = FeedMix_In.Q*FeedMix_In.X_c4 - (-Digestate_Out.Q*X_c4) + V_liq*(Y_c4*r8 + Y_c4*r9 - r16);
      der(X_pro)*V_liq + der(V_liq)*X_pro = FeedMix_In.Q*FeedMix_In.X_pro - (-Digestate_Out.Q*X_pro) + V_liq*(Y_pro*r10 - r17);
      der(X_ac)*V_liq + der(V_liq)*X_ac = FeedMix_In.Q*FeedMix_In.X_ac - (-Digestate_Out.Q*X_ac) + V_liq*(Y_ac*r11 - r18);
      der(X_h2)*V_liq + der(V_liq)*X_h2 = FeedMix_In.Q*FeedMix_In.X_h2 - (-Digestate_Out.Q*X_h2) + V_liq*(Y_h2*r12 - r19);
      der(S_cat)*V_liq + der(V_liq)*S_cat = FeedMix_In.Q*FeedMix_In.S_cat - (-Digestate_Out.Q*S_cat);
      der(S_an)*V_liq + der(V_liq)*S_an = FeedMix_In.Q*FeedMix_In.S_an - (-Digestate_Out.Q*S_an);
      der(S_vam)*V_liq + der(V_liq)*S_vam = V_liq*(-ra4);
      der(S_bum)*V_liq + der(V_liq)*S_bum = V_liq*(-ra5);
      der(S_prom)*V_liq + der(V_liq)*S_prom = V_liq*(-ra6);
      der(S_acm)*V_liq + der(V_liq)*S_acm = V_liq*(-ra7);
      der(S_hco3)*V_liq + der(V_liq)*S_hco3 = V_liq*(-ra10);
      der(S_co3)*V_liq + der(V_liq)*S_co3 = V_liq*(-ra15);
      der(S_nh3)*V_liq + der(V_liq)*S_nh3 = V_liq*(-ra11);
      der(S_hpo4)*V_liq + der(V_liq)*S_hpo4 = V_liq*(-ra12);
      der(S_po4)*V_liq + der(V_liq)*S_po4 = V_liq*(-ra13);
      der(S_h2po4)*V_liq + der(V_liq)*S_h2po4 = V_liq*(-ra14);
      S_nh4 + S_nh3 = S_in;
      S_co2 + S_hco3 + S_co3 = S_ic;
      S_h3po4 + S_h2po4 + S_hpo4 + S_po4 = S_ip;
      S_h*S_oh = Ka_h2o*convKa;
//  S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o * convKa);
//  Theta = S_cat + S_nh4 - S_hco3 - S_acm / COD_Ac - S_prom / COD_Pro - S_bum / COD_Bu - S_vam / COD_Va - S_an;
//der(S_h) = (der(S_an) + Ka_nh3 / (Ka_nh3 + S_h) * der(S_in) + Ka_co2 / (Ka_co2 + S_h) * der(S_ic) + 1 / COD_Ac * Ka_ac / (Ka_ac + S_h) * der(S_ac) + 1 / COD_Pro * Ka_pro / (Ka_pro + S_h) * der(S_pro) + 1 / COD_Bu * Ka_bu / (Ka_bu + S_h) * der(S_bu) + 1 / COD_Va * Ka_va / (Ka_va + S_h) * der(S_va) - der(S_in) - der(S_cat)) / (1 + Ka_nh3 * S_in / (Ka_nh3 + S_h) ^ 2 + Ka_co2 * S_ic / (Ka_co2 + S_h) ^ 2 + 1 / COD_Ac * Ka_ac * S_ac / (Ka_ac + S_h) ^ 2 + 1 / COD_Pro * Ka_pro * S_pro / (Ka_pro + S_h) ^ 2 + 1 / COD_Bu * Ka_bu * S_bu / (Ka_bu + S_h) ^ 2 + 1 / COD_Va * Ka_va * S_va / (Ka_va + S_h) ^ 2 + Ka_h2o / S_h ^ 2);
//  der(S_h) = (der(S_an) + Ka_nh3/(Ka_nh3 + S_h)*der(S_in) + Ka_co2/(Ka_co2 + S_h)*der(S_ic) + 1/COD_Ac*Ka_ac/(Ka_ac + S_h)*der(S_ac) + 1/COD_Pro*Ka_pro/(Ka_pro + S_h)*der(S_pro) + 1/COD_Bu*Ka_bu/(Ka_bu + S_h)*der(S_bu) + 1/COD_Va*Ka_va/(Ka_va + S_h)*der(S_va) - der(S_in) - der(S_cat))/(1 + Ka_nh3*S_in/(Ka_nh3 + S_h)^2 + Ka_co2*S_ic/(Ka_co2 + S_h)^2 + S_ac/COD_Ac*Ka_ac/(Ka_ac + S_h)^2 + S_pro/COD_Pro*Ka_pro/(Ka_pro + S_h)^2 + S_bu/COD_Bu*Ka_bu/(Ka_bu + S_h)^2 + S_va/COD_Va*Ka_va/(Ka_va + S_h)^2 + Ka_h2o*convKa/S_h^2)"vecchia";
//der(S_h) + der(S_cat) + der(S_h)*S_in*Ka_nh3/(Ka_nh3+S_h)^2 + S_h/(Ka_nh3+S_h)*der(S_in) = (der(S_ac/COD_Ac)*Ka_ac/(S_h+Ka_ac)-der(S_h)*Ka_ac*S_ac/COD_Ac/(S_h+Ka_ac)^2) + (der(S_pro/COD_Pro)*Ka_pro/(S_h+Ka_pro)-der(S_h)*Ka_pro*S_pro/COD_Pro/(S_h+Ka_pro)^2) + (der(S_bu/COD_Bu)*Ka_bu/(S_h+Ka_bu)-der(S_h)*Ka_bu*S_bu/COD_Bu/(S_h+Ka_bu)^2) + (der(S_va/COD_Va)*Ka_va/(S_h+Ka_va)-der(S_h)*Ka_va*S_va/COD_Va/(S_h+Ka_va)^2) + der(S_an) + Ka_co2*S_h/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)*der(S_ic) + (Ka_co2*S_ic*S_h^2+Ka_co2^2*Ka_hco3*S_ic-2*Ka_co2*S_ic*S_h)/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*der(S_h) + 2*(Ka_co2*Ka_hco3/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)*der(S_ic)-Ka_co2*Ka_hco3*S_ic*(2+Ka_co2)/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*der(S_h)) - Ka_h2o*convKa/(S_h)^2*der(S_h) "funziona ma varia di poco il pH";
//der(S_h) + der(S_cat) + der(S_h)*S_in*Ka_nh3/(Ka_nh3+S_h)^2 + der(S_in)*S_h/(Ka_nh3+S_h) = - der(S_h)*Ka_h2o*convKa/S_h^2 + der(S_ac/COD_Ac)*Ka_ac/(Ka_ac+S_h) -der(S_h)*Ka_ac*S_ac/COD_Ac/(S_h+Ka_ac)^2 + der(S_pro/COD_Pro)*Ka_pro/(Ka_pro+S_h) - der(S_h)*Ka_pro*S_pro/COD_Pro/(S_h+Ka_pro)^2 + der(S_bu/COD_Bu)*Ka_bu/(Ka_bu+S_h) - der(S_h)*Ka_bu*S_bu/COD_Bu/(S_h+Ka_bu)^2 + der(S_va/COD_Va)*Ka_va/(Ka_va+S_h) - der(S_h)*Ka_va*S_va/COD_Va/(S_h+Ka_va)^2 + der(S_an) + der(S_ic)*S_h*Ka_co2/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3) + der(S_h)*(S_ic*Ka_co2*(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)-Ka_co2*S_ic*S_h*(Ka_co2+2*S_h))/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2 + 2*der(S_ic)*Ka_co2*Ka_hco3/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3) - 2*der(S_h)*Ka_co2*Ka_hco3*S_ic*(2*S_h+Ka_co2)/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2 + 3*der(S_ip)*Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4) - 3* der(S_h)*S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4*(3*S_h^2+2*Ka_h3po4*S_h+Ka_h3po4*Ka_h2po4)/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2 + 2*der(S_ip)*Ka_h3po4*Ka_h2po4*S_h/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4) - 2*der(S_h)*Ka_h3po4*Ka_h2po4*S_ip*(2*S_h^3+Ka_h3po4*S_h^2-Ka_h3po4*Ka_h2po4*Ka_hpo4)/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2 + der(S_ip)*S_h^2*Ka_h3po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4) - der(S_h)*S_h*S_ip*(S_h^3-Ka_h3po4*Ka_h2po4*S_h-2*Ka_h3po4*Ka_h2po4*Ka_hpo4)/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2 "intermeda nn funziona";
//der(S_h) + der(S_cat) + der(S_h)*S_in*Ka_nh3/(Ka_nh3+S_h)^2 + der(S_in)*S_h/(Ka_nh3+S_h) = - Ka_h2o*convKa/(S_h)^2*der(S_h)  + der(S_an) + der(S_ac/COD_Ac)*Ka_ac/(Ka_ac+S_h)-der(S_h)*Ka_ac*S_ac/COD_Ac/(S_h+Ka_ac)^2 + der(S_pro/COD_Pro)*Ka_pro/(Ka_pro+S_h) - der(S_h)*Ka_pro*S_pro/COD_Pro/(S_h+Ka_pro)^2 + der(S_bu/COD_Bu)*Ka_bu/(Ka_bu+S_h) - der(S_h)*Ka_bu*S_bu/COD_Bu/(S_h+Ka_bu)^2 + der(S_va/COD_Va)*Ka_va/(Ka_va+S_h) - der(S_h)*Ka_va*S_va/COD_Va/(S_h+Ka_va)^2 + der(S_ic)*S_h*Ka_co2/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3) + der(S_h)*(S_ic*Ka_co2*(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)-Ka_co2*S_ic*S_h*(Ka_co2+2*S_h))/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2 + 2*der(S_ic)*Ka_co2*Ka_hco3/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3) - 2*der(S_h)*Ka_co2*Ka_hco3*S_ic*(2*S_h+Ka_co2)/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2 + 3*der(S_ip)*Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4) - 3* der(S_h)*S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4*(3*S_h^2+2*Ka_h3po4*S_h+Ka_h3po4*Ka_h2po4)/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2 + 2*der(S_ip)*Ka_h3po4*Ka_h2po4*S_h/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4) - 2*der(S_h)*Ka_h3po4*Ka_h2po4*S_ip*(2*S_h^3+Ka_h3po4*S_h^2-Ka_h3po4*Ka_h2po4*Ka_hpo4)/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2 + der(S_ip)*S_h^2*Ka_h3po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4) - der(S_h)*S_h*S_ip*Ka_h3po4*(S_h^3-Ka_h3po4*Ka_h2po4*S_h-2*Ka_h3po4*Ka_h2po4*Ka_hpo4)/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2 "intermedia funziona";
      der(S_h) = (der(S_an) - der(S_cat) - der(S_in)*S_h/(Ka_nh3 + S_h) + der(S_ac/COD_Ac)*Ka_ac/(Ka_ac + S_h) + der(S_pro/COD_Pro)*Ka_pro/(Ka_pro + S_h) + der(S_bu/COD_Bu)*Ka_bu/(Ka_bu + S_h) + der(S_va/COD_Va)*Ka_va/(Ka_va + S_h) + der(S_ic)*S_h*Ka_co2/(S_h^2 + Ka_co2*S_h + Ka_co2*Ka_hco3) + 2*der(S_ic)*Ka_co2*Ka_hco3/(S_h^2 + Ka_co2*S_h + Ka_co2*Ka_hco3) + 3*der(S_ip)*Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3 + Ka_h3po4*S_h^2 + Ka_h3po4*Ka_h2po4*S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4) + 2*der(S_ip)*Ka_h3po4*Ka_h2po4*S_h/(S_h^3 + Ka_h3po4*S_h^2 + Ka_h3po4*Ka_h2po4*S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4) + der(S_ip)*S_h^2*Ka_h3po4/(S_h^3 + Ka_h3po4*S_h^2 + Ka_h3po4*Ka_h2po4*S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4))/(1 + S_in*Ka_nh3/(Ka_nh3 + S_h)^2 + Ka_h2o*convKa/(S_h)^2 + Ka_ac*S_ac/COD_Ac/(S_h + Ka_ac)^2 + Ka_pro*S_pro/COD_Pro/(S_h + Ka_pro)^2 + Ka_bu*S_bu/COD_Bu/(S_h + Ka_bu)^2 + Ka_va*S_va/COD_Va/(S_h + Ka_va)^2 - (S_ic*Ka_co2*(S_h^2 + Ka_co2*S_h + Ka_co2*Ka_hco3) - Ka_co2*S_ic*S_h*(Ka_co2 + 2*S_h))/(S_h^2 + Ka_co2*S_h + Ka_co2*Ka_hco3)^2 + 2*Ka_co2*Ka_hco3*S_ic*(2*S_h + Ka_co2)/(S_h^2 + Ka_co2*S_h + Ka_co2*Ka_hco3)^2 + 3*S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4*(3*S_h^2 + 2*Ka_h3po4*S_h + Ka_h3po4*Ka_h2po4)/(S_h^3 + Ka_h3po4*S_h^2 + Ka_h3po4*Ka_h2po4*S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4)^2 + 2*Ka_h3po4*Ka_h2po4*S_ip*(2*S_h^3 + Ka_h3po4*S_h^2 - Ka_h3po4*Ka_h2po4*Ka_hpo4)/(S_h^3 + Ka_h3po4*S_h^2 + Ka_h3po4*Ka_h2po4*S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4)^2 + S_h*S_ip*Ka_h3po4*(S_h^3 - Ka_h3po4*Ka_h2po4*S_h - 2*Ka_h3po4*Ka_h2po4*Ka_hpo4)/(S_h^3 + Ka_h3po4*S_h^2 + Ka_h3po4*Ka_h2po4*S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4)^2) "finale funziona";
//der(S_h) + der(S_cat) + der(S_h)*S_in*Ka_nh3/(Ka_nh3+S_h)^2 + S_h/(Ka_nh3+S_h)*der(S_in) = (der(S_ac/COD_Ac)*Ka_ac/(S_h+Ka_ac)-der(S_h)*Ka_ac*S_ac/COD_Ac/(S_h+Ka_ac)^2) + (der(S_pro/COD_Pro)*Ka_pro/(S_h+Ka_pro)-der(S_h)*Ka_pro*S_pro/COD_Pro/(S_h+Ka_pro)^2) + (der(S_bu/COD_Bu)*Ka_bu/(S_h+Ka_bu)-der(S_h)*Ka_bu*S_bu/COD_Bu/(S_h+Ka_bu)^2) + (der(S_va/COD_Va)*Ka_va/(S_h+Ka_va)-der(S_h)*Ka_va*S_va/COD_Va/(S_h+Ka_va)^2) + der(S_an) + Ka_co2/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*((S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)*(S_h*der(S_ic)+S_ic*der(S_h))-(S_ic*S_h*der(S_h)*(Ka_co2+2*S_h))) + 2*Ka_co2*Ka_hco3/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*(der(S_ic)*(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)-S_ic*der(S_h)*(2*S_h+Ka_co2))- Ka_h2o*convKa/(S_h)^2*der(S_h) + 3*(Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*(der(S_ip)*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + 2*(Ka_h3po4*Ka_h2po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((S_ip*der(S_h)+ S_h*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + (Ka_h3po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((2*S_ip*S_h*der(S_h)+ S_h^2*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h^2*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) "originale funziona";
//der(S_po4) = (Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*(der(S_ip)*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h))));
//der(S_hpo4) = (Ka_h3po4*Ka_h2po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((S_ip*der(S_h)+ S_h*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h))));
//der(S_h2po4) = (Ka_h3po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((2*S_ip*S_h*der(S_h)+ S_h^2*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h^2*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h))));
//der(S_h3po4) = 1/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((3*S_ip*S_h^2*der(S_h)+ S_h^3*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h^3*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)));
//  pos = S_cat + S_nh4 + S_h;
//  neg = S_hco3 + S_acm / COD_Ac + S_prom / COD_Pro + S_bum / COD_Bu + S_vam / COD_Va + S_an + S_oh;
//  charge = pos - neg;
//  charge + 100 * der(charge) = 0;
//charge = 0;
      der(V_feed_cum) = FeedMix_In.Q;
//
/* Gas-phase equations */
//V_gas = V_tot-V_liq;
      der(S_gas_h2)*(V_tot - V_liq) + der(V_tot - V_liq)*S_gas_h2 = (-S_gas_h2*Q_gas) + rt8*V_liq;
      der(S_gas_ch4)*(V_tot - V_liq) + der(V_tot - V_liq)*S_gas_ch4 = (-S_gas_ch4*Q_gas) + rt9*V_liq;
      der(S_gas_co2)*(V_tot - V_liq) + der(V_tot - V_liq)*S_gas_co2 = (-S_gas_co2*Q_gas) + rt10*V_liq;
      der(S_gas_nh3)*(V_tot - V_liq) + der(V_tot - V_liq)*S_gas_nh3 = (-S_gas_nh3*Q_gas) + rt12*V_liq;
      p_gas_h2 = S_gas_h2*R*T_op/COD_h2;
      p_gas_ch4 = S_gas_ch4*R*T_op/COD_ch4;
      p_gas_co2 = S_gas_co2*R*T_op;
      p_gas_nh3 = S_gas_nh3*R*T_op;
      P_gas = p_gas_h2 + p_gas_nh3 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
      Q_gas = u "Biogas rate [m3/s] P_atm o P_atm + P_guardia";
//  Q_gas = 50000 / 1e5 / 86400 * (P_gas - P_atm_Pa);
      Q_gas_N = Q_gas*T_ref/T_op/P_atm_Pa*P_gas*86400;
      der(V_ch4_cum) = rt9*V_liq/COD_ch4*R*T_ref/P_atm_Pa;
//
/* Assignments for interface "Digestate" */
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
      Digestate_Out.S_co3 = S_co3;
      Digestate_Out.S_hco3 = S_hco3;
      Digestate_Out.S_co2 = S_co2;
      Digestate_Out.S_h = S_h;
      Digestate_Out.S_oh = S_oh;
      Digestate_Out.S_nh3 = S_nh3;
      Digestate_Out.S_nh4 = S_nh4;
      Digestate_Out.S_po4 = S_po4;
      Digestate_Out.S_hpo4 = S_hpo4;
      Digestate_Out.S_h2po4 = S_h2po4;
      Digestate_Out.S_h3po4 = S_h3po4;
      Digestate_Out.S_acm = S_acm;
      Digestate_Out.S_prom = S_prom;
      Digestate_Out.S_bum = S_bum;
      Digestate_Out.S_vam = S_vam;
      Digestate_Out.S_gas_h2 = S_gas_h2;
      Digestate_Out.S_gas_ch4 = S_gas_ch4;
      Digestate_Out.S_gas_co2 = S_gas_co2;
//
/* Conversion for interface "Gas" */
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.p_gas_nh3 = p_gas_nh3;
      Biogas_Out.P_gas = P_gas;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
/* Operative parameters */
//HRT = V_liq / (-Digestate_Out.Q*86400);
//OLR = COD_balance_in / V_liq;
//
/* COD mass balance */
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
      COD_X = X_aa + X_ac + X_c + X_c4 + X_ch + X_fa + X_h2 + X_i + X_li + X_pr + X_pro + X_su;
      COD_balance_in = FeedMix_In.Q*(FeedMix_In.S_aa + FeedMix_In.S_ac + FeedMix_In.S_bu + FeedMix_In.S_ch4 + FeedMix_In.S_fa + FeedMix_In.S_h2 + FeedMix_In.S_i + FeedMix_In.S_pro + FeedMix_In.S_su + FeedMix_In.S_va + FeedMix_In.X_aa + FeedMix_In.X_ac + FeedMix_In.X_c4 + FeedMix_In.X_fa + FeedMix_In.X_h2 + FeedMix_In.X_pro + FeedMix_In.X_su + FeedMix_In.X_ch + FeedMix_In.X_c + FeedMix_In.X_i + FeedMix_In.X_li + FeedMix_In.X_pr);
      COD_balance_out = -Digestate_Out.Q*(COD_S + COD_X);
      COD_balance_gas = Q_gas*T_ref/T_op/P_atm_Pa*P_gas*(p_gas_ch4/(P_gas)/(R/COD_ch4*T_ref/P_atm_Pa) + p_gas_h2/(P_gas)/(R/COD_h2*T_ref/P_atm_Pa));
      der(COD_balance_in_cum) = COD_balance_in;
      der(COD_balance_out_cum) = COD_balance_out;
      der(COD_balance_gas_cum) = COD_balance_gas;
//
/* Inorganic carbon mass balance */
      IC_balance_in = FeedMix_In.Q*(FeedMix_In.S_ic + C_xc*FeedMix_In.X_c + C_si*FeedMix_In.S_i + C_xi*FeedMix_In.X_i + C_ch*FeedMix_In.X_ch + C_pr*FeedMix_In.X_pr + C_li*FeedMix_In.X_li + C_su*FeedMix_In.S_su + C_aa*FeedMix_In.S_aa + C_fa*FeedMix_In.S_fa + C_va*FeedMix_In.S_va + C_bu*FeedMix_In.S_bu + C_pro*FeedMix_In.S_pro + C_ac*FeedMix_In.S_ac + C_ch4*FeedMix_In.S_ch4 + C_bac*(FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IC_balance_out = -Digestate_Out.Q*(S_ic + C_xc*X_c + C_si*S_i + C_xi*X_i + C_ch*X_ch + C_pr*X_pr + C_li*X_li + C_su*S_su + C_aa*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + C_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2));
      IC_balance_gas = Q_gas*T_ref/T_op/P_atm_Pa*P_gas*(C_ch4*p_gas_ch4/(P_gas)/(R/COD_ch4*T_ref/P_atm_Pa) + p_gas_co2/(P_gas)/R/T_ref*P_atm_Pa);
      der(IC_balance_in_cum) = IC_balance_in;
      der(IC_balance_out_cum) = IC_balance_out;
      der(IC_balance_gas_cum) = IC_balance_gas;
//
/* Inorganic nitrogen mass balance */
      IN_balance_in = FeedMix_In.Q*(FeedMix_In.S_in + N_xc*FeedMix_In.X_c + N_i*(FeedMix_In.S_i + FeedMix_In.X_i) + N_aa*(FeedMix_In.S_aa + FeedMix_In.X_pr) + N_bac*(FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IN_balance_out = -Digestate_Out.Q*(S_in + N_xc*X_c + N_i*(S_i + X_i) + N_aa*(S_aa + X_pr) + N_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2));
      IN_balance_gas = Q_gas*T_ref/T_op/P_atm_Pa*P_gas*(p_gas_nh3/(P_gas))/(R*T_ref/P_atm_Pa);
      der(IN_balance_in_cum) = IN_balance_in;
      der(IN_balance_out_cum) = IN_balance_out;
      der(IN_balance_gas_cum) = IN_balance_gas;
      annotation(
        Diagram(coordinateSystem(extent = {{-100, 100}, {80, -80}})),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
    end Digester;

    model Sludge_Discharge_noProbes
      extends Icons.SludgeDischarge;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Stoichiometric;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Physiochemical;
      extends Variables.OtherVariables_Discharge;
      ADM1.Interfaces.Digestate Digestate_In annotation(
        Placement(visible = true, transformation(origin = {-90, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
/* Computation of missing parameters */
      f_xli_xc_out = 1 - f_xch_xc_out - f_xpr_xc_out;
      f_xli_xi_out = 1 - f_xch_xi_out - f_xpr_xi_out;
      f_si_li_out = 1 - f_si_ch_out - f_si_pr_out;
      f_xbac_li_out = 1 - f_xbac_ch_out - f_xbac_pr_out;
      COD_VS_Xi_out = COD_CH_out*f_xch_xi_out + COD_PR_out*f_xpr_xi_out + COD_LI_out*f_xli_xi_out;
      COD_VS_Si_out = COD_CH_out*f_si_ch_out + COD_PR_out*f_si_pr_out + COD_LI_out*f_si_li_out;
//
/* Digestate physiochemical properties */
      Alk_out = (Digestate_In.S_nh3 + 2*Digestate_In.S_co3 + Digestate_In.S_hco3 + Digestate_In.S_oh + Digestate_In.S_acm/COD_Ac + Digestate_In.S_prom/COD_Pro + Digestate_In.S_bum/COD_Bu + Digestate_In.S_vam/COD_Va - Digestate_In.S_h + Digestate_In.S_hpo4 + 2*Digestate_In.S_po4 - Digestate_In.S_h3po4)*MWCaCO3/2*1000;
      VFA_out = (Digestate_In.S_ac/COD_Ac*MWHAc + Digestate_In.S_pro/COD_Pro*MWHPro + Digestate_In.S_bu/COD_Bu*MWHBu + Digestate_In.S_va/COD_Va*MWHVa)*1000;
      VS_out = ((Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_xbac_ch_out/COD_CH_out + (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_xbac_pr_out/COD_PR_out + (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_xbac_li_out/COD_LI_out + (Digestate_In.S_su + Digestate_In.X_ch)/COD_CH_out + (Digestate_In.S_aa + Digestate_In.X_pr)/COD_PR_out + (Digestate_In.S_fa + Digestate_In.X_li)/COD_LI_out + Digestate_In.S_i/COD_VS_Si_out + Digestate_In.X_i/COD_VS_Xi_out + Digestate_In.X_c*f_xch_xc_out/COD_CH_out + Digestate_In.X_c*f_xpr_xc_out/COD_PR_out + Digestate_In.X_c*f_xli_xc_out/COD_LI_out)/d_h2o*1000;
      TAN_out = Digestate_In.S_in*MWN*1000;
      COD_tot_out = (Digestate_In.S_aa + Digestate_In.S_ac + Digestate_In.S_bu + Digestate_In.S_ch4 + Digestate_In.S_fa + Digestate_In.S_h2 + Digestate_In.S_i + Digestate_In.S_pro + Digestate_In.S_su + Digestate_In.S_va + Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c + Digestate_In.X_c4 + Digestate_In.X_ch + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_i + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su);
      CH_tot_out = (Digestate_In.S_su + Digestate_In.X_ch + Digestate_In.X_c*f_xch_xc_out + Digestate_In.S_i*f_si_ch_out + Digestate_In.X_i*f_xch_xi_out + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su)*f_xbac_ch_out)/COD_CH_out*1000;
      PR_BCA_tot_out = (Digestate_In.S_aa + Digestate_In.X_pr + Digestate_In.X_c*f_xpr_xc_out + Digestate_In.S_i*f_si_pr_out + Digestate_In.X_i*f_xpr_xi_out + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_pro + Digestate_In.X_su)*f_xbac_pr_out)/COD_PR_BSA_out*1000;
      PR_TKN_tot_out = (Digestate_In.S_aa + Digestate_In.X_pr + Digestate_In.X_c*f_xpr_xc_out + Digestate_In.S_i*f_si_pr_out + Digestate_In.X_i*f_xpr_xi_out + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_pro + Digestate_In.X_su)*f_xbac_pr_out)/COD_PR_out/PR_N_out*1000;
      LI_tot_out = (Digestate_In.S_fa + Digestate_In.X_li + Digestate_In.X_c*f_xli_xc_out + Digestate_In.S_i*f_si_li_out + Digestate_In.X_i*f_xli_xi_out + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_pro + Digestate_In.X_su)*f_xbac_li_out)/COD_LI_out*1000;
      CH_sol_out = (Digestate_In.S_su + Digestate_In.S_i*f_si_ch_out)/COD_CH_out*1000;
      PR_BCA_sol_out = (Digestate_In.S_aa + Digestate_In.S_i*f_si_pr_out)/COD_PR_BSA_out*1000;
      PR_TKN_sol_out = (Digestate_In.S_aa + Digestate_In.S_i*f_si_pr_out)/COD_PR_out/PR_N_out*1000;
      LI_sol_out = (Digestate_In.S_fa + Digestate_In.S_i*f_si_li_out)/COD_LI_out*1000;
/* 
      when sample(t_sampling_t1, 86400) then
      der (S_su_t1_media) = Digestate_In.M_S_su/Digestate_In.Q/86400 "va bene per fare la media delle conc in un intevallo di tempo";
      Digestate_out1.S_su_t1 = S_su_t1_media;
      end when
      // come faccio se ne ho più di uno?
      */
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        Icon);
    end Sludge_Discharge_noProbes;

    model Sludge_Discharge
      extends Icons.SludgeDischarge;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Stoichiometric;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Physiochemical;
      extends Variables.OtherVariables_Discharge;
      ADM1.Interfaces.Digestate Digestate_In annotation(
        Placement(visible = true, transformation(origin = {-90, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput VS_meas annotation(
        Placement(visible = true, transformation(origin = {95, -65}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {95, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput Alk_meas annotation(
        Placement(visible = true, transformation(origin = {7, -1}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {13, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput VFA_meas annotation(
        Placement(visible = true, transformation(origin = {37, -1}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {41, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput pH_meas annotation(
        Placement(visible = true, transformation(origin = {-8, 0}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {-1, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput COD_BCA_meas annotation(
        Placement(visible = true, transformation(origin = {7, -65}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {5, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput TAN_meas annotation(
        Placement(visible = true, transformation(origin = {21, -1}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {27, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput COD_TKN_meas annotation(
        Placement(visible = true, transformation(origin = {23, -65}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {21, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput CH_tot_meas annotation(
        Placement(visible = true, transformation(origin = {37, -65}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {37, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput PR_tot_BCA_meas annotation(
        Placement(visible = true, transformation(origin = {67, -65}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {53, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput LI_tot_meas annotation(
        Placement(visible = true, transformation(origin = {81, -65}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {81, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput COD_SM_meas annotation(
        Placement(visible = true, transformation(origin = {-7, -65}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-11, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput Hac_meas annotation(
        Placement(visible = true, transformation(origin = {52, 0}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {55, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput Hpro_meas annotation(
        Placement(visible = true, transformation(origin = {66, 0}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {69, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput Hbu_meas annotation(
        Placement(visible = true, transformation(origin = {80, 0}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {81, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput Hva_meas annotation(
        Placement(visible = true, transformation(origin = {94, 0}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {93, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput PR_tot_TKN_meas annotation(
        Placement(visible = true, transformation(origin = {53, -65}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {67, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput pH_PLC annotation(
        Placement(visible = true, transformation(origin = {-22, 0}, extent = {{-11, -11}, {11, 11}}, rotation = 270), iconTransformation(origin = {-19, -3}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
    equation
/* Computation of missing parameters */
      f_xli_xc_out = 1 - f_xch_xc_out - f_xpr_xc_out;
      f_xli_xi_out = 1 - f_xch_xi_out - f_xpr_xi_out;
      f_si_li_out = 1 - f_si_ch_out - f_si_pr_out;
      f_xbac_li_out = 1 - f_xbac_ch_out - f_xbac_pr_out;
      COD_VS_Xi_out = COD_CH_out*f_xch_xi_out + COD_PR_out*f_xpr_xi_out + COD_LI_out*f_xli_xi_out;
      COD_VS_Si_out = COD_CH_out*f_si_ch_out + COD_PR_out*f_si_pr_out + COD_LI_out*f_si_li_out;
//
/* Digestate physiochemical properties */
      Alk_out = (Digestate_In.S_nh3 + 2*Digestate_In.S_co3 + Digestate_In.S_hco3 + Digestate_In.S_oh + Digestate_In.S_acm/COD_Ac + Digestate_In.S_prom/COD_Pro + Digestate_In.S_bum/COD_Bu + Digestate_In.S_vam/COD_Va - Digestate_In.S_h + Digestate_In.S_hpo4 + 2*Digestate_In.S_po4 - Digestate_In.S_h3po4)*MWCaCO3/2*1000;
//ATTENZIONE!!
      VFA_out = (Digestate_In.S_ac/COD_Ac*MWHAc + Digestate_In.S_pro/COD_Pro*MWHPro + Digestate_In.S_bu/COD_Bu*MWHBu + Digestate_In.S_va/COD_Va*MWHVa)*1000;
      VS_out = ((Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_xbac_ch_out/COD_CH_out + (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_xbac_pr_out/COD_PR_out + (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2)*f_xbac_li_out/COD_LI_out + (Digestate_In.S_su + Digestate_In.X_ch)/COD_CH_out + (Digestate_In.S_aa + Digestate_In.X_pr)/COD_PR_out + (Digestate_In.S_fa + Digestate_In.X_li)/COD_LI_out + Digestate_In.S_i/COD_VS_Si_out + Digestate_In.X_i/COD_VS_Xi_out + Digestate_In.X_c*f_xch_xc_out/COD_CH_out + Digestate_In.X_c*f_xpr_xc_out/COD_PR_out + Digestate_In.X_c*f_xli_xc_out/COD_LI_out)/d_h2o*1000;
      TAN_out = Digestate_In.S_in*MWN*1000;
      COD_tot_out = (Digestate_In.S_aa + Digestate_In.S_ac + Digestate_In.S_bu + Digestate_In.S_ch4 + Digestate_In.S_fa + Digestate_In.S_h2 + Digestate_In.S_i + Digestate_In.S_pro + Digestate_In.S_su + Digestate_In.S_va + Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c + Digestate_In.X_c4 + Digestate_In.X_ch + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_i + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su);
      CH_tot_out = (Digestate_In.S_su + Digestate_In.X_ch + Digestate_In.X_c*f_xch_xc_out + Digestate_In.S_i*f_si_ch_out + Digestate_In.X_i*f_xch_xi_out + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_pro + Digestate_In.X_su)*f_xbac_ch_out)/COD_CH_out*1000;
      PR_BCA_tot_out = (Digestate_In.S_aa + Digestate_In.X_pr + Digestate_In.X_c*f_xpr_xc_out + Digestate_In.S_i*f_si_pr_out + Digestate_In.X_i*f_xpr_xi_out + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_pro + Digestate_In.X_su)*f_xbac_pr_out)/COD_PR_BSA_out*1000;
      PR_TKN_tot_out = (Digestate_In.S_aa + Digestate_In.X_pr + Digestate_In.X_c*f_xpr_xc_out + Digestate_In.S_i*f_si_pr_out + Digestate_In.X_i*f_xpr_xi_out + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_pro + Digestate_In.X_su)*f_xbac_pr_out)/COD_PR_out/PR_N_out*1000;
      LI_tot_out = (Digestate_In.S_fa + Digestate_In.X_li + Digestate_In.X_c*f_xli_xc_out + Digestate_In.S_i*f_si_li_out + Digestate_In.X_i*f_xli_xi_out + (Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c4 + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su)*f_xbac_li_out)/COD_LI_out*1000;
      CH_sol_out = (Digestate_In.S_su + Digestate_In.S_i*f_si_ch_out)/COD_CH_out*1000;
      PR_BCA_sol_out = (Digestate_In.S_aa + Digestate_In.S_i*f_si_pr_out)/COD_PR_BSA_out*1000;
      PR_TKN_sol_out = (Digestate_In.S_aa + Digestate_In.S_i*f_si_pr_out)/COD_PR_out/PR_N_out*1000;
      LI_sol_out = (Digestate_In.S_fa + Digestate_In.S_i*f_si_li_out)/COD_LI_out*1000;
/* 
      when sample(t_sampling_t1, 86400) then
      der (S_su_t1_media) = Digestate_In.M_S_su/Digestate_In.Q/86400 "va bene per fare la media delle conc in un intevallo di tempo";
      Digestate_out1.S_su_t1 = S_su_t1_media;
      end when
      // come faccio se ne ho più di uno?
      */
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        Icon);
    end Sludge_Discharge;

    model Gas_Meter_noProbes
      extends Icons.GasMeter;
      extends Parameters.Parameters_Operative;
      extends Variables.OtherVariables_GasMeter;
      Interfaces.Gas Biogas_In annotation(
        Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      x_ch4 = Biogas_In.p_gas_ch4/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_co2 = Biogas_In.p_gas_co2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_h2 = Biogas_In.p_gas_h2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_nh3 = Biogas_In.p_gas_nh3/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      Q_ch4_N = Biogas_In.Q_gas_N*Biogas_In.p_gas_ch4/Biogas_In.P_gas;
      Q_co2_N = Biogas_In.Q_gas_N*Biogas_In.p_gas_co2/Biogas_In.P_gas;
      Q_h2_N = Biogas_In.Q_gas_N*Biogas_In.p_gas_h2/Biogas_In.P_gas;
      Q_nh3_N = Biogas_In.Q_gas_N*Biogas_In.p_gas_nh3/Biogas_In.P_gas;
    end Gas_Meter_noProbes;

    model Gas_Meter
      extends Icons.GasMeter;
      extends Parameters.Parameters_Operative;
      extends Variables.OtherVariables_GasMeter;
      Interfaces.Gas Biogas_In annotation(
        Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput CH4Content_meas annotation(
        Placement(visible = true, transformation(origin = {-30, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {-33, 81}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput CH4FlowRate_meas annotation(
        Placement(visible = true, transformation(origin = {10, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {11, 81}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput CO2Content_meas annotation(
        Placement(visible = true, transformation(origin = {-10, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {-11, 81}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput CO2FlowRate_meas annotation(
        Placement(visible = true, transformation(origin = {30, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {33, 81}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
    equation
      x_ch4 = Biogas_In.p_gas_ch4/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_co2 = Biogas_In.p_gas_co2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_h2 = Biogas_In.p_gas_h2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_nh3 = Biogas_In.p_gas_nh3/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      Q_ch4_N = Biogas_In.Q_gas_N*Biogas_In.p_gas_ch4/Biogas_In.P_gas;
      Q_co2_N = Biogas_In.Q_gas_N*Biogas_In.p_gas_co2/Biogas_In.P_gas;
      Q_h2_N = Biogas_In.Q_gas_N*Biogas_In.p_gas_h2/Biogas_In.P_gas;
      Q_nh3_N = Biogas_In.Q_gas_N*Biogas_In.p_gas_nh3/Biogas_In.P_gas;
    end Gas_Meter;

    model Batch_test_preparation
      extends Icons.BatchTestPreparation;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Stoichiometric;
      extends Parameters.Parameters_Kinetic;
      extends Parameters.Parameters_Physiochemical;
      extends Parameters.Parameters_BatchTest;
      extends Variables.OtherVariables_BatchTestPreparation;
      ADM1.Interfaces.MixBatchTest MixBatchTest_out annotation(
        Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      // Parameters in Sections A, B and C, to be changed according to test
      /* A. Dilution water properties */
      parameter SI.MassConcentration Alk_water_test = 0.051/1000 "Alkalinity concentration in dilution water  [kg CaCO3/m3]";
      parameter SI.PerUnit pH_water_test = 7.6 "Dilution water pH [-]";
      //
      /* B. Inoculum properties */
      parameter SI.MassConcentration Alk_inoculum_test = 0.051/1000 "Alkalinity concentration in inoculum [kg CaCO3/m3]";
      parameter SI.PerUnit pH_inoculum_test = 7.6 "Inoculum pH [-]";
      parameter SI.MassConcentration TAN_inoculum_test = 0.051/1000 "TAN concentration in inoculum [kg N/m3]";
      parameter SI.MassConcentration ac_inoculum_test = 0.051/1000 "Acetic acid concentration in inoculum [kg/m3]";
      parameter SI.MassConcentration pro_inoculum_test = 0.051/1000 "Propionic acid concentration in inoculum [kg/m3]";
      parameter SI.MassConcentration bu_inoculum_test = 0.051/1000 "Butyric acid concentration in inoculum [kg/m3]";
      parameter SI.MassConcentration isobu_inoculum_test = 0.051/1000 "Iso-butyric acid concentration in inoculum [kg/m3]";
      parameter SI.MassConcentration va_inoculum_test = 0.051/1000 "Valeric acid concentration in inoculum [kg/m3]";
      parameter SI.MassConcentration isova_inoculum_test = 0.051/1000 "Iso-Valeric acid concentration in inoculum [kg/m3]";
      parameter SI.MassConcentration S_su_inoculum_test = 0 "Soluble monosaccharides concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration S_aa_inoculum_test = 0 "Soluble amino acids concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration S_fa_inoculum_test = 0 "Soluble long chain fatty acids concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration S_i_inoculum_test = 0 "Soluble inerts concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration S_h2_inoculum_test = 0 "Soluble hydrogen gas concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration S_ch4_inoculum_test = 0 "Soluble methane concentration in inoculum [kgCOD/m3]";
      parameter SI.MolarDensity S_an_inoculum_test = 0.02 "Soluble anionic ions concentration in inoculum [mol/m3]";
      parameter SI.MassConcentration X_c_inoculum_test = 0 "Complex particulate concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_ch_inoculum_test = 0 "Particulate carbohydrates concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_pr_inoculum_test = 0 "Particulate proteins concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_li_inoculum_test = 0 "Particulate lipids concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_i_inoculum_test = 0 "Particulate inerts concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_su_inoculum_test = 0 "Monosaccharide degrading organisms concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_aa_inoculum_test = 0 "Amino Acid degrading organisms concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_fa_inoculum_test = 0 "Long chain fatty acid degrading organisms concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_c4_inoculum_test = 0 "C4 degrading organisms concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_pro_inoculum_test = 0 "Propionate degrading organisms concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_ac_inoculum_test = 0 "Acetate degrading organisms concentration in inoculum [kgCOD/m3]";
      parameter SI.MassConcentration X_h2_inoculum_test = 0 "Hydrogen degrading organisms concentration in inoculum [kgCOD/m3]";
      //
      /* C. Substrate solution properties */
      parameter SI.PerUnit pH_substrate_test = 6 "Substrate solution pH [-]";
      parameter SI.MassConcentration S_su_substrate_test = 0 "Soluble monosaccharides concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration S_aa_substrate_test = 0 "Soluble amino acids concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration S_fa_substrate_test = 0 "Soluble long chain fatty acids concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration va_substrate_test = 0 "Valeric acid concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration isova_substrate_test = 0 "Iso-valeric acid concentration in substrate [kg/m3]";
      parameter SI.MassConcentration bu_substrate_test = 0 "Butyric concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration isobu_substrate_test = 0 "Iso-butyric acid concentration in substrate [kg/m3]";
      parameter SI.MassConcentration pro_substrate_test = 0 "Propionic acid concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration ac_substrate_test = 0.05 "Acetic acid concentration in substrate solution [kgCOD/m3]";
      parameter SI.MassConcentration TAN_substrate_test = 0.051/1000 "TAN concentration in inoculum [kg N/m3]";
    equation
//
/* VFA acid-base constants at standart T and P */
      Ka_va_test = convKa*10^(-pKa_va)*1000;
      Ka_bu_test = convKa*10^(-pKa_bu)*1000;
      Ka_pro_test = convKa*10^(-pKa_pro)*1000;
      Ka_ac_test = convKa*10^(-pKa_ac)*1000;
//
/* Temperature dependent parameters */
      Ka_co2_test = convKa*10^(-pKa_co2)*1000*exp(deltaH0_Ka_co2/R*(1/T_ref_phychem - 1/T_op_test));
      Ka_nh3_test = convKa*10^(-pKa_nh3)*1000*exp(deltaH0_Ka_nh3/R*(1/T_ref_phychem - 1/T_op_test));
      Ka_h2o_test = convKa*10^(-pKa_h2o)*1000*exp(deltaH0_Ka_h2o/R*(1/T_ref_phychem - 1/T_op_test));
//
/* Speciation of ionic compounds in water */
      S_h_water_test = 10^(-pH_water_test)*1000*convKa "mol/m3";
      S_oh_water_test = Ka_h2o_test/S_h_water_test*convKa "mol/m3";
      Alk_mol_water_test = Alk_water_test/MWCaCO3*2 "mol/m3";
      S_hco3_water_test = Alk_mol_water_test - S_oh_water_test + S_h_water_test "mol/m3";
      S_ic_water_test = S_hco3_water_test*(S_h_water_test + Ka_co2_test)/Ka_co2_test "mol/m3";
      S_cat_water_test - S_an_water_test = S_h_water_test - S_oh_water_test - S_hco3_water_test "mol/m3";
//
/* Speciation of ionic compounds in digestate */
      S_h_inoculum_test = 10^(-pH_inoculum_test)*1000*convKa "mol/m3";
      S_oh_inoculum_test = Ka_h2o_test/S_h_inoculum_test*convKa "mol/m3";
      S_in_inoculum_test = TAN_inoculum_test/MWN "mol/m3";
      S_nh4_inoculum_test = S_in_inoculum_test*S_h_inoculum_test/(Ka_nh3_test + S_h_inoculum_test) "mol/m3";
      S_nh3_inoculum_test = S_in_inoculum_test - S_nh4_inoculum_test "mol/m3";
      S_ac_mol_inoculum_test = ac_inoculum_test/MWHAc "mol/m3";
      S_pro_mol_inoculum_test = pro_inoculum_test/MWHPro "mol/m3";
      S_bu_mol_inoculum_test = (bu_inoculum_test + isobu_inoculum_test)/MWHBu "mol/m3";
      S_va_mol_inoculum_test = (va_inoculum_test + isova_inoculum_test)/MWHVa "mol/m3";
      S_acm_mol_inoculum_test = Ka_ac_test*S_ac_mol_inoculum_test/(S_h_inoculum_test + Ka_ac_test) "mol/m3";
      S_prom_mol_inoculum_test = Ka_pro_test*S_pro_mol_inoculum_test/(S_h_inoculum_test + Ka_pro_test) "mol/m3";
      S_bum_mol_inoculum_test = Ka_bu_test*S_bu_mol_inoculum_test/(S_h_inoculum_test + Ka_bu_test) "mol/m3";
      S_vam_mol_inoculum_test = Ka_va_test*S_va_mol_inoculum_test/(S_h_inoculum_test + Ka_va_test) "mol/m3";
      Alk_mol_inoculum_test = Alk_inoculum_test/MWCaCO3*2 "mol/m3";
      S_hco3_inoculum_test = Alk_mol_inoculum_test - (S_acm_mol_inoculum_test + S_prom_mol_inoculum_test + S_bum_mol_inoculum_test + S_vam_mol_inoculum_test) - S_oh_inoculum_test - S_nh3_inoculum_test + S_h_inoculum_test "mol/m3";
      S_ic_inoculum_test = S_hco3_inoculum_test*(S_h_inoculum_test + Ka_co2_test)/Ka_co2_test "mol/m3";
      S_cat_inoculum_test = (-S_nh4_inoculum_test) - S_h_inoculum_test + S_an_inoculum_test + S_hco3_inoculum_test + S_oh_inoculum_test + S_acm_mol_inoculum_test + S_prom_mol_inoculum_test + S_bum_mol_inoculum_test + S_vam_mol_inoculum_test "mol/m3";
      S_ac_inoculum_test = ac_inoculum_test*COD_Ac/MWHAc "kg COD/m3";
      S_pro_inoculum_test = pro_inoculum_test*COD_Pro/MWHPro "kg COD/m3";
      S_bu_inoculum_test = (bu_inoculum_test + isobu_inoculum_test)*COD_Bu/MWHBu "kg COD/m3";
      S_va_inoculum_test = (va_inoculum_test + isova_inoculum_test)*COD_Va/MWHVa "kg COD/m3";
      S_acm_inoculum_test = S_acm_mol_inoculum_test*COD_Ac "kg COD/m3";
      S_prom_inoculum_test = S_prom_mol_inoculum_test*COD_Pro "kg COD/m3";
      S_bum_inoculum_test = S_bum_mol_inoculum_test*COD_Bu "kg COD/m3";
      S_vam_inoculum_test = S_vam_mol_inoculum_test*COD_Va "kg COD/m3";
//
/* Speciation of ionic compounds in substrate */
      S_h_substrate_test = 10^(-pH_substrate_test)*1000*convKa "mol/m3";
      S_oh_substrate_test = Ka_h2o_test/S_h_substrate_test*convKa "mol/m3";
      S_in_substrate_test = TAN_substrate_test/MWN "mol/m3";
      S_nh4_substrate_test = S_in_substrate_test*S_h_substrate_test/(Ka_nh3_test + S_h_substrate_test) "mol/m3";
      S_nh3_substrate_test = S_in_substrate_test - S_nh4_substrate_test "mol/m3";
      S_ac_mol_substrate_test = ac_substrate_test/MWHAc "mol/m3";
      S_pro_mol_substrate_test = pro_substrate_test/MWHPro "mol/m3";
      S_bu_mol_substrate_test = (bu_substrate_test + isobu_substrate_test)/MWHBu "mol/m3";
      S_va_mol_substrate_test = (va_substrate_test + isova_substrate_test)/MWHVa "mol/m3";
      S_acm_mol_substrate_test = Ka_ac_test*S_ac_mol_substrate_test/(S_h_substrate_test + Ka_ac_test) "mol/m3";
      S_prom_mol_substrate_test = Ka_pro_test*S_pro_mol_substrate_test/(S_h_substrate_test + Ka_pro_test) "mol/m3";
      S_bum_mol_substrate_test = Ka_bu_test*S_bu_mol_substrate_test/(S_h_substrate_test + Ka_bu_test) "mol/m3";
      S_vam_mol_substrate_test = Ka_va_test*S_va_mol_substrate_test/(S_h_substrate_test + Ka_va_test) "mol/m3";
      S_ac_substrate_test = ac_substrate_test*COD_Ac/MWHAc "kg COD/m3";
      S_pro_substrate_test = pro_substrate_test*COD_Pro/MWHPro "kg COD/m3";
      S_bu_substrate_test = (bu_substrate_test + isobu_substrate_test)*COD_Bu/MWHBu "kg COD/m3";
      S_va_substrate_test = (va_substrate_test + isova_substrate_test)*COD_Va/MWHVa "kg COD/m3";
      S_acm_substrate_test = S_acm_mol_substrate_test*COD_Ac "kg COD/m3";
      S_prom_substrate_test = S_prom_mol_substrate_test*COD_Pro "kg COD/m3";
      S_bum_substrate_test = S_bum_mol_substrate_test*COD_Bu "kg COD/m3";
      S_vam_substrate_test = S_vam_mol_substrate_test*COD_Va "kg COD/m3";
      S_cat_substrate_test = (-S_nh4_substrate_test) - S_h_substrate_test + S_an_substrate_test + S_oh_substrate_test + S_hco3_substrate_test + S_acm_mol_substrate_test + S_prom_mol_substrate_test + S_bum_mol_substrate_test + S_vam_mol_substrate_test "mol/m3";
//
/* Mass balances (preparing the test, determination of initial conditions) */
      V_working_test = V_water_test + V_inoculum_test + V_substrate_test;
      MixBatchTest_out.S_su_test_0*V_working_test = S_su_water_test*V_water_test + S_su_inoculum_test*V_inoculum_test + S_su_substrate_test*V_substrate_test;
      MixBatchTest_out.S_aa_test_0*V_working_test = S_aa_water_test*V_water_test + S_aa_inoculum_test*V_inoculum_test + S_aa_substrate_test*V_substrate_test;
      MixBatchTest_out.S_fa_test_0*V_working_test = S_fa_water_test*V_water_test + S_fa_inoculum_test*V_inoculum_test + S_fa_substrate_test*V_substrate_test;
      MixBatchTest_out.S_va_test_0*V_working_test = S_va_water_test*V_water_test + S_va_inoculum_test*V_inoculum_test + S_va_substrate_test*V_substrate_test;
      MixBatchTest_out.S_bu_test_0*V_working_test = S_bu_water_test*V_water_test + S_bu_inoculum_test*V_inoculum_test + S_bu_substrate_test*V_substrate_test;
      MixBatchTest_out.S_pro_test_0*V_working_test = S_pro_water_test*V_water_test + S_pro_inoculum_test*V_inoculum_test + S_pro_substrate_test*V_substrate_test;
      MixBatchTest_out.S_ac_test_0*V_working_test = S_ac_water_test*V_water_test + S_ac_inoculum_test*V_inoculum_test + S_ac_substrate_test*V_substrate_test;
      MixBatchTest_out.S_h2_test_0*V_working_test = S_h2_water_test*V_water_test + S_h2_inoculum_test*V_inoculum_test + S_h2_substrate_test*V_substrate_test;
      MixBatchTest_out.S_ch4_test_0*V_working_test = S_ch4_water_test*V_water_test + S_ch4_inoculum_test*V_inoculum_test + S_ch4_substrate_test*V_substrate_test;
      MixBatchTest_out.S_ic_test_0*V_working_test = S_ic_water_test*V_water_test + S_ic_inoculum_test*V_inoculum_test + S_ic_substrate_test*V_substrate_test;
      MixBatchTest_out.S_in_test_0*V_working_test = S_in_water_test*V_water_test + S_in_inoculum_test*V_inoculum_test + S_in_substrate_test*V_substrate_test;
      MixBatchTest_out.S_i_test_0*V_working_test = S_i_water_test*V_water_test + S_i_inoculum_test*V_inoculum_test + S_i_substrate_test*V_substrate_test;
      MixBatchTest_out.X_i_test_0*V_working_test = X_i_water_test*V_water_test + X_i_inoculum_test*V_inoculum_test + X_i_substrate_test*V_substrate_test;
      MixBatchTest_out.X_c_test_0*V_working_test = X_c_water_test*V_water_test + X_c_inoculum_test*V_inoculum_test + X_c_substrate_test*V_substrate_test;
      MixBatchTest_out.X_ch_test_0*V_working_test = X_ch_water_test*V_water_test + X_ch_inoculum_test*V_inoculum_test + X_ch_substrate_test*V_substrate_test;
      MixBatchTest_out.X_pr_test_0*V_working_test = X_pr_water_test*V_water_test + X_pr_inoculum_test*V_inoculum_test + X_pr_substrate_test*V_substrate_test;
      MixBatchTest_out.X_li_test_0*V_working_test = X_li_water_test*V_water_test + X_li_inoculum_test*V_inoculum_test + X_li_substrate_test*V_substrate_test;
      MixBatchTest_out.X_su_test_0*V_working_test = X_su_water_test*V_water_test + X_su_inoculum_test*V_inoculum_test + X_su_substrate_test*V_substrate_test;
      MixBatchTest_out.X_aa_test_0*V_working_test = X_aa_water_test*V_water_test + X_aa_inoculum_test*V_inoculum_test + X_aa_substrate_test*V_substrate_test;
      MixBatchTest_out.X_fa_test_0*V_working_test = X_fa_water_test*V_water_test + X_fa_inoculum_test*V_inoculum_test + X_fa_substrate_test*V_substrate_test;
      MixBatchTest_out.X_c4_test_0*V_working_test = X_c4_water_test*V_water_test + X_c4_inoculum_test*V_inoculum_test + X_c4_substrate_test*V_substrate_test;
      MixBatchTest_out.X_pro_test_0*V_working_test = X_pro_water_test*V_water_test + X_pro_inoculum_test*V_inoculum_test + X_pro_substrate_test*V_substrate_test;
      MixBatchTest_out.X_ac_test_0*V_working_test = X_ac_water_test*V_water_test + X_ac_inoculum_test*V_inoculum_test + X_ac_substrate_test*V_substrate_test;
      MixBatchTest_out.X_h2_test_0*V_working_test = X_h2_water_test*V_water_test + X_i_inoculum_test*V_inoculum_test + X_h2_substrate_test*V_substrate_test;
      MixBatchTest_out.S_an_test_0*V_working_test = S_an_water_test*V_water_test + S_an_inoculum_test*V_inoculum_test + S_an_substrate_test*V_substrate_test;
      MixBatchTest_out.S_cat_test_0*V_working_test = S_cat_water_test*V_water_test + S_cat_inoculum_test*V_inoculum_test + S_cat_substrate_test*V_substrate_test;
      MixBatchTest_out.S_oh_test_0*MixBatchTest_out.S_h_test_0 = Ka_h2o_test*convKa;
      MixBatchTest_out.S_vam_test_0 = Ka_va_test*MixBatchTest_out.S_va_test_0/(MixBatchTest_out.S_h_test_0 + Ka_va_test);
      MixBatchTest_out.S_bum_test_0 = Ka_bu_test*MixBatchTest_out.S_bu_test_0/(MixBatchTest_out.S_h_test_0 + Ka_bu_test);
      MixBatchTest_out.S_prom_test_0 = Ka_pro_test*MixBatchTest_out.S_pro_test_0/(MixBatchTest_out.S_h_test_0 + Ka_pro_test);
      MixBatchTest_out.S_acm_test_0 = Ka_ac_test*MixBatchTest_out.S_ac_test_0/(MixBatchTest_out.S_h_test_0 + Ka_ac_test);
      MixBatchTest_out.S_nh4_test_0 = MixBatchTest_out.S_in_test_0*MixBatchTest_out.S_h_test_0/(Ka_nh3_test + MixBatchTest_out.S_h_test_0);
      MixBatchTest_out.S_nh3_test_0 = MixBatchTest_out.S_in_test_0 - MixBatchTest_out.S_nh4_test_0;
      MixBatchTest_out.S_hco3_test_0 = MixBatchTest_out.S_ic_test_0*Ka_co2_test/(MixBatchTest_out.S_h_test_0 + Ka_co2_test);
      MixBatchTest_out.S_co2_test_0 = MixBatchTest_out.S_ic_test_0 - MixBatchTest_out.S_hco3_test_0;
      MixBatchTest_out.S_h_test_0 + MixBatchTest_out.S_nh4_test_0 + MixBatchTest_out.S_cat_test_0 = MixBatchTest_out.S_acm_test_0/COD_Ac + MixBatchTest_out.S_prom_test_0/COD_Pro + MixBatchTest_out.S_bum_test_0/COD_Bu + MixBatchTest_out.S_vam_test_0/COD_Va + MixBatchTest_out.S_hco3_test_0 + Ka_h2o_test*convKa/MixBatchTest_out.S_h_test_0 + MixBatchTest_out.S_an_test_0;
      MixBatchTest_out.Q_test = Q_test;
    end Batch_test_preparation;

    model Batch_activity_test
      extends Icons.BatchTest;
      extends Parameters.Parameters_Operative;
      extends Parameters.Parameters_Conversion;
      extends Parameters.Parameters_Stoichiometric;
      extends Parameters.Parameters_Kinetic;
      extends Parameters.Parameters_Physiochemical;
      extends Parameters.Parameters_BatchTest;
      extends Variables.StateVariables_BatchTest;
      //  extends Variables.OtherVariables_BatchTest;
      Modelica.Blocks.Sources.CombiTimeTable Cumulated_CH4_exp(columns = integer({2}), fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Exp_gross_HAc_22_09_26.txt", startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Exp_gross_HAc_22_09_26", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {68, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.MixBatchTest MixBatchTest_in annotation(
        Placement(visible = true, transformation(origin = {-32, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-32, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      X_su_test = MixBatchTest_in.X_su_test_0;
      X_aa_test = MixBatchTest_in.X_aa_test_0;
      X_fa_test = MixBatchTest_in.X_fa_test_0;
      X_c4_test = MixBatchTest_in.X_c4_test_0;
      X_pro_test = MixBatchTest_in.X_pro_test_0;
      X_ac_test = MixBatchTest_in.X_ac_test_0;
      X_h2_test = MixBatchTest_in.X_h2_test_0;
      X_c_test = MixBatchTest_in.X_c_test_0;
      X_i_test = MixBatchTest_in.X_i_test_0;
      X_ch_test = MixBatchTest_in.X_ch_test_0;
      X_pr_test = MixBatchTest_in.X_pr_test_0;
      X_li_test = MixBatchTest_in.X_li_test_0;
      S_i_test = MixBatchTest_in.S_i_test_0;
      S_su_test = MixBatchTest_in.S_su_test_0;
      S_aa_test = MixBatchTest_in.S_aa_test_0;
      S_fa_test = MixBatchTest_in.S_fa_test_0;
      S_va_test = MixBatchTest_in.S_va_test_0;
      S_bu_test = MixBatchTest_in.S_bu_test_0;
      S_pro_test = MixBatchTest_in.S_pro_test_0;
      S_ac_test = MixBatchTest_in.S_ac_test_0;
      S_vam_test = MixBatchTest_in.S_vam_test_0;
      S_bum_test = MixBatchTest_in.S_bum_test_0;
      S_prom_test = MixBatchTest_in.S_prom_test_0;
      S_acm_test = MixBatchTest_in.S_acm_test_0;
      S_h2_test = MixBatchTest_in.S_h2_test_0;
      S_ch4_test = MixBatchTest_in.S_ch4_test_0;
      S_ic_test = MixBatchTest_in.S_ic_test_0;
      S_in_test = MixBatchTest_in.S_in_test_0;
      S_cat_test = MixBatchTest_in.S_cat_test_0;
      S_an_test = MixBatchTest_in.S_an_test_0;
      S_hco3_test = MixBatchTest_in.S_hco3_test_0;
      S_nh3_test = MixBatchTest_in.S_nh3_test_0;
      S_nh4_test = MixBatchTest_in.S_nh4_test_0;
      S_co2_test = MixBatchTest_in.S_co2_test_0;
      S_h_test = MixBatchTest_in.S_h_test_0;
      S_oh_test = MixBatchTest_in.S_oh_test_0;
    equation
      V_working_test = V_water_test + V_inoculum_test + V_substrate_test;
//
/* Stoichiometric parameters */
      f_h2_su_test = 0.33*nu_1_su + 0.17*(1 - nu_1_su - nu_2_su);
      f_bu_su_test = 0.83*(1 - nu_1_su - nu_2_su);
      f_pro_su_test = 0.78*nu_2_su;
      f_ac_su_test = 0.67*nu_1_su + 0.22*nu_2_su;
      f_si_xc_test = S_i_test*V_working_test/(X_c_test*V_working_test);
      f_xi_xc_test = X_i_test*V_working_test/(X_c_test*V_working_test);
      f_xch_xc_test = X_ch_test*V_working_test/(X_c_test*V_working_test);
      f_xpr_xc_test = X_pr_test*V_working_test/(X_c_test*V_working_test);
      f_xli_xc_test = X_li_test*V_working_test/(X_c_test*V_working_test);
//
/* VFA acid-base constants at standart T and P */
      Ka_va_test = convKa*10^(-pKa_va)*1000;
      Ka_bu_test = convKa*10^(-pKa_bu)*1000;
      Ka_pro_test = convKa*10^(-pKa_pro)*1000;
      Ka_ac_test = convKa*10^(-pKa_ac)*1000;
//
/* Temperature dependent parameters */
      Ka_co2_test = convKa*10^(-pKa_co2)*1000*exp(deltaH0_Ka_co2/R*(1/T_ref_phychem - 1/T_op_test));
      Ka_nh3_test = convKa*10^(-pKa_nh3)*1000*exp(deltaH0_Ka_nh3/R*(1/T_ref_phychem - 1/T_op_test));
      Ka_h2o_test = convKa*10^(-pKa_h2o)*1000*exp(deltaH0_Ka_h2o/R*(1/T_ref_phychem - 1/T_op_test));
      KH_ch4_test = KH_ch4_Tref*exp(deltaH0_KH_ch4/R*(1/T_ref_phychem - 1/T_op_test));
      KH_co2_test = KH_co2_Tref*exp(deltaH0_KH_co2/R*(1/T_ref_phychem - 1/T_op_test));
      KH_h2_test = KH_h2_Tref*exp(deltaH0_KH_h2/R*(1/T_ref_phychem - 1/T_op_test));
      KH_nh3_test = KH_nh3_Tref;
      KH_n2_test = KH_n2_Tref;
      p_gas_h2o_test = coeffph20_p*exp(coeffph20_T*(1/T_ref_phychem - 1/T_op_test));
      k_dis_T_test = k_dis/86400;
      k_hyd_ch_T_test = k_hyd_ch/86400*exp(expth_k_hyd*(T_op_test - T_ref_bio));
      k_hyd_pr_T_test = k_hyd_pr/86400*exp(expth_k_hyd*(T_op_test - T_ref_bio));
      k_hyd_li_T_test = k_hyd_li/86400*exp(expth_k_hyd*(T_op_test - T_ref_bio));
      k_m_su_T_test = k_m_su/86400*exp(expth_k_m_su*(T_op_test - T_ref_bio));
      k_m_aa_T_test = k_m_aa/86400*exp(expth_k_m_aa*(T_op_test - T_ref_bio));
      k_m_fa_T_test = k_m_fa/86400*exp(expth_k_m_fa*(T_op_test - T_ref_bio));
      k_m_pro_T_test = k_m_pro/86400*exp(expth_k_m_pro*(T_op_test - T_ref_bio));
      k_m_c4_T_test = k_m_c4/86400 "not found expth_k_m_c4";
      k_m_ac_T_test = k_m_ac/86400*exp(expth_k_m_ac*(T_op_test - T_ref_bio));
      k_m_h2_T_test = k_m_h2/86400*exp(expth_k_m_h2*(T_op_test - T_ref_bio));
      Ks_su_T_test = Ks_su*exp(expth_Ks_su*(T_op_test - T_ref_bio));
      Ks_aa_T_test = Ks_aa*exp(expth_Ks_aa*(T_op_test - T_ref_bio));
      Ks_fa_T_test = Ks_fa*exp(expth_Ks_fa*(T_op_test - T_ref_bio));
      Ks_pro_T_test = Ks_pro*exp(expth_Ks_pro*(T_op_test - T_ref_bio));
      Ks_c4_T_test = Ks_c4 "not found expth_Ks_c4";
      Ks_ac_T_test = Ks_ac*exp(expth_Ks_ac*(T_op_test - T_ref_bio));
      Ks_h2_T_test = Ks_h2*exp(expth_Ks_h2*(T_op_test - T_ref_bio));
      k_dec_su_T_test = k_dec_su/86400*exp(expth_k_dec_su*(T_op_test - T_ref_bio));
      k_dec_aa_T_test = k_dec_aa/86400*exp(expth_k_dec_aa*(T_op_test - T_ref_bio));
      k_dec_fa_T_test = k_dec_fa/86400*exp(expth_k_dec_fa*(T_op_test - T_ref_bio));
      k_dec_pro_T_test = k_dec_pro/86400*exp(expth_k_dec_pro*(T_op_test - T_ref_bio));
      k_dec_c4_T_test = k_dec_c4/86400 "not found expth_k_dec_c4";
      k_dec_ac_T_test = k_dec_ac/86400*exp(expth_k_dec_ac*(T_op_test - T_ref_bio));
      k_dec_h2_T_test = k_dec_h2/86400*exp(expth_k_dec_h2*(T_op_test - T_ref_bio));
//
/* Inhibition functions */
      pH_test = -log10(S_h_test/1000/convKa);
      I_pH_aa_test = if noEvent(pH_test < pH_UL_aa) then exp(-3*((pH_test - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0;
      I_pH_ac_test = if noEvent(pH_test < pH_UL_ac) then exp(-3*((pH_test - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0;
      I_pH_h2_test = if noEvent(pH_test < pH_UL_h2) then exp(-3*((pH_test - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0;
      I_in_lim_test = 1/(1 + Ks_IN/S_in_test);
      I_h2_fa_test = 1/(1 + S_h2_test/Ki_h2_fa);
      I_h2_c4_test = 1/(1 + S_h2_test/Ki_h2_c4);
      I_h2_pro_test = 1/(1 + S_h2_test/Ki_h2_pro);
      I_nh3_test = 1/(1 + S_nh3_test/Ki_nh3_ac);
      I_5_test = I_pH_aa_test*I_in_lim_test;
      I_6_test = I_pH_aa_test*I_in_lim_test;
      I_7_test = I_pH_aa_test*I_in_lim_test*I_h2_fa_test;
      I_8_test = I_pH_aa_test*I_in_lim_test*I_h2_c4_test;
      I_9_test = I_pH_aa_test*I_in_lim_test*I_h2_c4_test;
      I_10_test = I_pH_aa_test*I_in_lim_test*I_h2_pro_test;
      I_11_test = I_pH_ac_test*I_in_lim_test*I_nh3_test;
      I_12_test = I_pH_h2_test*I_in_lim_test;
//
/* Inorganic carbon coefficients of processes */
      v1_test = (-C_xc) + f_si_xc_test*C_si + f_xch_xc_test*C_ch + f_xpr_xc_test*C_pr + f_xli_xc_test*C_li + f_xi_xc_test*C_xi;
      v2_test = (-C_ch) + C_su;
      v3_test = (-C_pr) + C_aa;
      v4_test = (-C_li) + (1 - f_fa_li)*C_su + f_fa_li*C_fa;
      v5_test = (-C_su) + (1 - Y_su)*(f_bu_su_test*C_bu + f_pro_su_test*C_pro + f_ac_su_test*C_ac) + Y_su*C_bac;
      v6_test = (-C_aa) + (1 - Y_aa)*(f_va_aa*C_va + f_bu_aa*C_bu + f_pro_aa*C_aa + f_ac_aa*C_aa) + Y_aa*C_bac;
      v7_test = (-C_fa) + (1 - Y_fa)*0.7*C_ac + Y_fa*C_bac;
      v8_test = (-C_va) + (1 - Y_c4)*0.54*C_pro + (1 - Y_c4)*0.31*C_ac + Y_c4*C_bac;
      v9_test = (-C_bu) + (1 - Y_c4)*0.8*C_ac + Y_c4*C_bac;
      v10_test = (-C_pro) + (1 - Y_pro)*0.57*C_ac + Y_pro*C_bac;
      v11_test = (-C_ac) + (1 - Y_ac)*C_ch4 + Y_ac*C_bac;
      v12_test = (1 - Y_h2)*C_ch4 + Y_h2*C_bac;
      v13_test = (-C_bac) + C_xc;
//
/* Volume-specific liquid-gas transfer coefficients */
      kla_s_ch4_test = kla_d_o2_test/86400*(D_ch4/D_o2)^(1/2);
      kla_s_h2_test = kla_d_o2_test/86400*(D_h2/D_o2)^(1/2);
      kla_s_co2_test = kla_d_o2_test/86400*(D_co2/D_o2)^(1/2);
      kla_s_nh3_test = kla_d_o2_test/86400*(D_nh3/D_o2)^(1/2);
      kla_s_n2_test = kla_d_o2_test/86400*(D_n2/D_o2)^(1/2);
//
/* Process rates */
      r1_test = k_dis_T_test*X_c_test;
      r2_test = k_hyd_ch_T_test*X_ch_test;
      r3_test = k_hyd_pr_T_test*X_pr_test;
      r4_test = k_hyd_li_T_test*X_li_test;
      r5_test = k_m_su_T_test*S_su_test/(S_su_test + Ks_su_T_test)*X_su_test*I_5_test;
      r6_test = k_m_aa_T_test*S_aa_test/(S_aa_test + Ks_aa_T_test)*X_aa_test*I_6_test;
      r7_test = k_m_fa_T_test*S_fa_test/(S_fa_test + Ks_fa_T_test)*X_fa_test*I_7_test;
      r8_test = k_m_c4_T_test*S_va_test/(S_va_test + Ks_c4_T_test)*X_c4_test*S_va_test/(S_bu_test + S_va_test + epsilon)*I_8_test;
      r9_test = k_m_c4_T_test*S_bu_test/(S_bu_test + Ks_c4_T_test)*X_c4_test*S_bu_test/(S_bu_test + S_va_test + epsilon)*I_9_test;
//r10_test = k_m_pro_T_test * S_pro_test / (S_pro_test + Ks_pro_T_test) * X_pro_test * I_10_test;
      r10_test = k_m_pro_T_test*S_pro_test/(S_pro_test + Ks_pro_T_test + S_pro_test^2/K_HPro_haldane)*X_pro_test*I_10_test;
//r11_test = k_m_ac_T_test * S_ac_test / (S_ac_test + Ks_ac_T_test) * X_ac_test * I_11_test;
      r11_test = k_m_ac_T_test*S_ac_test/(S_ac_test + Ks_ac_T_test + S_ac_test^2/K_HAc_haldane)*X_ac_test*I_11_test;
      r12_test = k_m_h2_T_test*S_h2_test/(S_h2_test + Ks_h2_T_test)*X_h2_test*I_12_test;
      r13_test = k_dec_su_T_test*X_su_test;
      r14_test = k_dec_aa_T_test*X_aa_test;
      r15_test = k_dec_fa_T_test*X_fa_test;
      r16_test = k_dec_c4_T_test*X_c4_test;
      r17_test = k_dec_pro_T_test*X_pro_test;
      r18_test = k_dec_ac_T_test*X_ac_test;
      r19_test = k_dec_h2_T_test*X_h2_test;
      ra4_test = k_AB_va*(S_vam_test*(Ka_va_test + S_h_test) - Ka_va_test*S_va_test);
      ra5_test = k_AB_bu*(S_bum_test*(Ka_bu_test + S_h_test) - Ka_bu_test*S_bu_test);
      ra6_test = k_AB_pro*(S_prom_test*(Ka_pro_test + S_h_test) - Ka_pro_test*S_pro_test);
      ra7_test = k_AB_ac*(S_acm_test*(Ka_ac_test + S_h_test) - Ka_ac_test*S_ac_test);
      ra10_test = k_AB_co2*(S_hco3_test*(Ka_co2_test + S_h_test) - Ka_co2_test*S_ic_test);
      ra11_test = k_AB_in*(S_nh3_test*(Ka_nh3_test + S_h_test) - Ka_nh3_test*S_in_test);
      rt8_test = kla_s_h2_test*(S_h2_test - COD_h2*KH_h2_test*p_gas_h2_test);
      rt9_test = kla_s_ch4_test*(S_ch4_test - COD_ch4*KH_ch4_test*p_gas_ch4_test);
      rt10_test = kla_s_co2_test*(S_co2_test - KH_co2_test*p_gas_co2_test);
      rt11_test = kla_s_n2_test*(S_n2_test - KH_n2_test*p_gas_n2_test);
      rt12_test = kla_s_nh3_test*(S_nh3_test - KH_nh3_test*p_gas_nh3_test);
//
/* Liquid-phase equations */
      der(X_c_test) = (-r1_test + r13_test + r14_test + r15_test + r16_test + r17_test + r18_test + r19_test);
      der(X_ch_test) = (f_xch_xc_test*r1_test - r2_test);
      der(X_pr_test) = (f_xpr_xc_test*r1_test - r3_test);
      der(X_li_test) = (f_xli_xc_test*r1_test - r4_test);
      der(X_i_test) = (f_xi_xc_test*r1_test);
      der(S_i_test) = (f_si_xc_test*r1_test);
      der(S_su_test) = (r2_test + (1 - f_fa_li)*r4_test - r5_test);
      der(S_aa_test) = (r3_test - r6_test);
      der(S_fa_test) = (f_fa_li*r4_test - r7_test);
      der(S_va_test) = ((1 - Y_aa)*f_va_aa*r6_test - r8_test);
      der(S_bu_test) = ((1 - Y_su)*f_bu_su_test*r5_test + (1 - Y_aa)*f_bu_aa*r6_test - r9_test);
      der(S_pro_test) = ((1 - Y_su)*f_pro_su_test*r5_test + (1 - Y_aa)*f_pro_aa*r6_test + (1 - Y_c4)*0.54*r8_test - r10_test);
      der(S_ac_test) = ((1 - Y_su)*f_ac_su_test*r5_test + (1 - Y_aa)*f_ac_aa*r6_test + (1 - Y_fa)*0.7*r7_test + (1 - Y_c4)*0.31*r8_test + (1 - Y_c4)*0.8*r9_test + (1 - Y_pro)*0.57*r10_test - r11_test);
      der(S_h2_test) = ((1 - Y_su)*f_h2_su_test*r5_test + (1 - Y_aa)*f_h2_aa*r6_test + (1 - Y_fa)*0.3*r7_test + (1 - Y_c4)*0.15*r8_test + (1 - Y_c4)*0.2*r9_test + (1 - Y_pro)*0.43*r10_test - r12_test - rt8_test);
      der(S_ch4_test) = ((1 - Y_ac)*r11_test + (1 - Y_h2)*r12_test - rt9_test);
      der(S_ic_test) = (-(v1_test*r1_test + v2_test*r2_test + v3_test*r3_test + v4_test*r4_test + v5_test*r5_test + v6_test*r6_test + v7_test*r7_test + v8_test*r8_test + v9_test*r9_test + v10_test*r10_test + v11_test*r11_test + v12_test*r12_test + v13_test*(r13_test + r14_test + r15_test + r16_test + r17_test + r18_test + r19_test)) - rt10_test);
      der(S_in_test) = (-Y_su*N_bac*r5_test + (N_aa - Y_aa*N_bac)*r6_test - Y_fa*N_bac*r7_test - Y_c4*N_bac*r8_test - Y_c4*N_bac*r9_test - Y_pro*N_bac*r10_test - Y_ac*N_bac*r11_test - Y_h2*N_bac*r12_test + (N_bac - N_xc)*(r13_test + r14_test + r15_test + r16_test + r17_test + r18_test + r19_test) + (N_xc - f_xi_xc_test*N_i - f_si_xc_test*N_i - f_xpr_xc_test*N_aa)*r1_test - rt12_test);
      der(X_su_test) = (Y_su*r5_test - r13_test);
      der(X_aa_test) = (Y_aa*r6_test - r14_test);
      der(X_fa_test) = (Y_fa*r7_test - r15_test);
      der(X_c4_test) = (Y_c4*r8_test + Y_c4*r9_test - r16_test);
      der(X_pro_test) = (Y_pro*r10_test - r17_test);
      der(X_ac_test) = (Y_ac*r11_test - r18_test);
      der(X_h2_test) = (Y_h2*r12_test - r19_test);
      der(S_cat_test) = 0;
      der(S_an_test) = 0;
      der(S_n2_test) = 0;
      der(S_vam_test) = (-ra4_test);
      der(S_bum_test) = (-ra5_test);
      der(S_prom_test) = (-ra6_test);
      der(S_acm_test) = (-ra7_test);
      der(S_hco3_test) = (-ra10_test);
      der(S_nh3_test) = (-ra11_test);
      S_nh4_test = S_in_test - S_nh3_test;
      S_co2_test = S_ic_test - S_hco3_test;
      S_h_test*S_oh_test = Ka_h2o_test*convKa;
      der(S_h_test) = (der(S_an_test) + Ka_nh3_test/(Ka_nh3_test + S_h_test)*der(S_in_test) + Ka_co2_test/(Ka_co2_test + S_h_test)*der(S_ic_test) + 1/COD_Ac*Ka_ac_test/(Ka_ac_test + S_h_test)*der(S_ac_test) + 1/COD_Pro*Ka_pro_test/(Ka_pro_test + S_h_test)*der(S_pro_test) + 1/COD_Bu*Ka_bu_test/(Ka_bu_test + S_h_test)*der(S_bu_test) + 1/COD_Va*Ka_va_test/(Ka_va_test + S_h_test)*der(S_va_test) - der(S_in_test) - der(S_cat_test))/(1 + Ka_nh3_test*S_in_test/(Ka_nh3_test + S_h_test)^2 + Ka_co2_test*S_ic_test/(Ka_co2_test + S_h_test)^2 + S_ac_test/COD_Ac*Ka_ac_test/(Ka_ac_test + S_h_test)^2 + S_pro_test/COD_Pro*Ka_pro_test/(Ka_pro_test + S_h_test)^2 + S_bu_test/COD_Bu*Ka_bu_test/(Ka_bu_test + S_h_test)^2 + S_va_test/COD_Va*Ka_va_test/(Ka_va_test + S_h_test)^2 + Ka_h2o_test*convKa/S_h_test^2);
      der(S_gas_h2_test) = (-S_gas_h2_test*Q_gas_test/(V_tot_test - V_working_test)) + rt8_test*V_working_test/(V_tot_test - V_working_test);
      der(S_gas_ch4_test) = (-S_gas_ch4_test*Q_gas_test/(V_tot_test - V_working_test)) + rt9_test*V_working_test/(V_tot_test - V_working_test);
      der(S_gas_co2_test) = (-S_gas_co2_test*Q_gas_test/(V_tot_test - V_working_test)) + rt10_test*V_working_test/(V_tot_test - V_working_test);
      der(S_gas_nh3_test) = (-S_gas_nh3_test*Q_gas_test/(V_tot_test - V_working_test)) + rt12_test*V_working_test/(V_tot_test - V_working_test);
      der(S_gas_n2_test) = (-S_gas_n2_test*Q_gas_test/(V_tot_test - V_working_test)) + rt11_test*V_working_test/(V_tot_test - V_working_test);
      p_gas_h2_test = S_gas_h2_test*R*T_op_test/COD_h2;
      p_gas_ch4_test = S_gas_ch4_test*R*T_op_test/COD_ch4;
      p_gas_co2_test = S_gas_co2_test*R*T_op_test;
      p_gas_nh3_test = S_gas_nh3_test*R*T_op_test;
      p_gas_n2_test = S_gas_n2_test*R*T_op_test;
      P_gas_test = p_gas_n2_test + p_gas_h2_test + p_gas_nh3_test + p_gas_ch4_test + p_gas_co2_test + p_gas_h2o_test;
//  Q_gas = u "Biogas rate [m3/s] P_atm o P_atm + P_guardia";
//  Q_gas = 50000 / 1e5 / 86400 * (P_gas - P_atm_Pa);
      Q_gas_test = 50/1e5/86400*(P_gas_test - P_atm_Pa)*P_gas_test/P_atm_Pa;
      Q_gas_N_test = Q_gas_test*T_ref/T_op_test/P_atm_Pa*P_gas_test;
      x_ch4_test = p_gas_ch4_test/(P_gas_test - p_gas_h2o_test);
      x_co2_test = p_gas_co2_test/(P_gas_test - p_gas_h2o_test);
      x_h2_test = p_gas_h2_test/(P_gas_test - p_gas_h2o_test);
      x_n2_test = p_gas_n2_test/(P_gas_test - p_gas_h2o_test);
      x_nh3_test = p_gas_nh3_test/(P_gas_test - p_gas_h2o_test);
      Q_ch4_N_test = Q_gas_N_test*p_gas_ch4_test/P_gas_test;
      Q_co2_N_test = Q_gas_N_test*p_gas_co2_test/P_gas_test;
      Q_h2_N_test = Q_gas_N_test*p_gas_h2_test/P_gas_test;
      Q_n2_N_test = Q_gas_N_test*p_gas_n2_test/P_gas_test;
      Q_nh3_N_test = Q_gas_N_test*p_gas_nh3_test/P_gas_test;
      der(V_CH4_H2_N2_NH3_cum_test) = Q_gas_N_test*1000000;
      der(V_CH4_H2_cum_test) = (Q_ch4_N_test + Q_co2_N_test)*1000000;
//  der(V_ch4_cum) = rt9 * V_liq / COD_ch4 * R * T_ref / P_atm_Pa;
    end Batch_activity_test;

    model Probe_InputData
      extends Icons.ProbeInputData;
      Modelica.Blocks.Interfaces.RealOutput y_InputData annotation(
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput InputData[1] annotation(
        Placement(visible = true, transformation(origin = {-78, -2.22045e-16}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-61, 1}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
    equation
      y_InputData = InputData[1];
    end Probe_InputData;

    model Probe_FittingData_1OUT
      extends Icons.ProbeFittingData;
      Modelica.Blocks.Interfaces.RealOutput y_FittingData annotation(
        Placement(visible = true, transformation(origin = {0, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput FittingData[1] annotation(
        Placement(visible = true, transformation(origin = {0, 74}, extent = {{-14, -14}, {14, 14}}, rotation = 270), iconTransformation(origin = {1, 63}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
    equation
      y_FittingData = FittingData[1];
    end Probe_FittingData_1OUT;

    model Probe_FittingData_2OUT
      extends Icons.ProbeFittingData;
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_1 annotation(
        Placement(visible = true, transformation(origin = {-10, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput FittingData[2] annotation(
        Placement(visible = true, transformation(origin = {0, 74}, extent = {{-14, -14}, {14, 14}}, rotation = 270), iconTransformation(origin = {1, 63}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_2 annotation(
        Placement(visible = true, transformation(origin = {10, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      y_FittingData_1 = FittingData[1];
      y_FittingData_2 = FittingData[2];
    end Probe_FittingData_2OUT;

    model Probe_FittingData_3OUT
      extends Icons.ProbeFittingData;
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_1 annotation(
        Placement(visible = true, transformation(origin = {0, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-20, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_2 annotation(
        Placement(visible = true, transformation(origin = {10, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_3 annotation(
        Placement(visible = true, transformation(origin = {10, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {20, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput FittingData[3] annotation(
        Placement(visible = true, transformation(origin = {0, 74}, extent = {{-14, -14}, {14, 14}}, rotation = 270), iconTransformation(origin = {1, 63}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
    equation
      y_FittingData_1 = FittingData[1];
      y_FittingData_2 = FittingData[2];
      y_FittingData_3 = FittingData[3];
    end Probe_FittingData_3OUT;

    model Probe_FittingData_4OUT
      extends Icons.ProbeFittingData;
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_1 annotation(
        Placement(visible = true, transformation(origin = {0, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_2 annotation(
        Placement(visible = true, transformation(origin = {10, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_3 annotation(
        Placement(visible = true, transformation(origin = {10, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_FittingData_4 annotation(
        Placement(visible = true, transformation(origin = {10, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput FittingData[4] annotation(
        Placement(visible = true, transformation(origin = {0, 74}, extent = {{-14, -14}, {14, 14}}, rotation = 270), iconTransformation(origin = {1, 63}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
    equation
      y_FittingData_1 = FittingData[1];
      y_FittingData_2 = FittingData[2];
      y_FittingData_3 = FittingData[3];
      y_FittingData_4 = FittingData[4];
    end Probe_FittingData_4OUT;
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(origin = {-2, 9}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-40, 31}, {40, -49}}), Line(origin = {-61.5166, -0.463576}, points = {{-19, 0}, {19, 0}}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 8), Line(origin = {58.4834, -1.46358}, points = {{-21, 1}, {21, 1}}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 8)}));
  end BlockLibrary;

  class PilotPlant_Dynamic
    extends Modelica.Icons.Example;
    ADM1.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-40, -26}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1.BlockLibrary.Digester digester annotation(
      Placement(visible = true, transformation(origin = {41, -25}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1.BlockLibrary.Gas_Meter Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {84, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID(controllerType = Modelica.Blocks.Types.SimpleController.P, initType = Modelica.Blocks.Types.Init.SteadyState, k = 0.00000001, xi_start = 104500, yMax = 5.8e-1) annotation(
      Placement(visible = true, transformation(origin = {24, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_1 Feed_1 annotation(
      Placement(visible = true, transformation(origin = {-82, -2}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_2 Feed_2 annotation(
      Placement(visible = true, transformation(origin = {-82, -38}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_Conc_Feed1_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-120, -6}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_Q_Feed1_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-120, 38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_BMP(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_BMP_B0_Feed1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_BMP_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-120, 16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_Q_Feed2_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_Conc_Feed2_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-120, -54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_InputData Probe_T annotation(
      Placement(visible = true, transformation(origin = {0, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_T_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-22, -64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_InputData Probe_P annotation(
      Placement(visible = true, transformation(origin = {-18, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pressure(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-38, 22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_2OUT Probe_BiogasComposition annotation(
      Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_2OUT Probe_BiogasFlowRate annotation(
      Placement(visible = true, transformation(origin = {98, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable ProbeBiogasComposition_meas(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeBiogasComposition_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasComposition_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {56, 62}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable ProbeBiogasFlowRate_meas(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeBiogasFlowRate_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasFlowRate_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {86, 62}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_1OUT Probe_pH annotation(
      Placement(visible = true, transformation(origin = {110, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_1OUT Probe_Alk annotation(
      Placement(visible = true, transformation(origin = {118, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_1OUT Probe_VS annotation(
      Placement(visible = true, transformation(origin = {172, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_1OUT Probe_TVFA annotation(
      Placement(visible = true, transformation(origin = {134, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_1OUT Probe_TAN annotation(
      Placement(visible = true, transformation(origin = {126, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbepH_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {85, -21}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    ADM1.BlockLibrary.Sludge_Discharge Discharge annotation(
      Placement(visible = true, transformation(origin = {116, -71}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_4OUT Probe_SingleVFA annotation(
      Placement(visible = true, transformation(origin = {142, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Alk_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeAlk_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeAlk_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {97, -13}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TAN_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeTAN_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTAN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {109, -5}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TVFA_meas(columns = integer({2}), fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeTVFA_meas_2023.txt", startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTVFA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {121, 3}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable SingleVFAs_meas(columns = integer({2, 3, 4, 5}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeSingleVFAs_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeSingleVFAs_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {133, 11}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_3OUT Probe_COD annotation(
      Placement(visible = true, transformation(origin = {94, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_1OUT Probe_CHtot annotation(
      Placement(visible = true, transformation(origin = {80, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_1OUT Probe_LItot annotation(
      Placement(visible = true, transformation(origin = {186, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_2OUT Probe_PRtot annotation(
      Placement(visible = true, transformation(origin = {66, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable VS_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeVS_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVS_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {157, -69}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable LI_tot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeLItot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeLItot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {177, -61}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CH_tot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeCHtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCHtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {49, -93}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable ProbeCODtot_meas(columns = integer({2, 3, 4}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbeCODtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCODtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {63, -83}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable PR_tot_meas(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbePRtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbePRtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {35, -103}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_FittingData_1OUT Probe_pH_PLC annotation(
      Placement(visible = true, transformation(origin = {98, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_PLC(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/ProbepH_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {73, -29}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  equation
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-24.16, -38.32}, {-8.16, -38.32}, {-8.16, -15.32}, {21.84, -15.32}}));
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{52.5, -6}, {52.5, 8}, {76, 8}}));
    connect(PID.y, digester.u) annotation(
      Line(points = {{35, 26}, {41, 26}, {41, -2}}, color = {0, 0, 127}));
    connect(digester.P_gas, PID.u_s) annotation(
      Line(points = {{38, -1.5}, {38, 2.5}, {2, 2.5}, {2, 26}, {12, 26}}, color = {0, 0, 127}));
    connect(Sludge_BMP.y, Feed_1.BMP_1) annotation(
      Line(points = {{-111, 16}, {-103.5, 16}, {-103.5, 1}, {-92, 1}}, color = {0, 0, 127}));
    connect(Sludge_concentrations.y, Feed_1.Concentrations_1) annotation(
      Line(points = {{-111, -6}, {-100.5, -6}, {-100.5, -4}, {-92, -4}}, color = {0, 0, 127}));
    connect(Yogurth_concentrations.y, Feed_2.Concentrations_2) annotation(
      Line(points = {{-111, -54}, {-103, -54}, {-103, -40}, {-92, -40}}, color = {0, 0, 127}));
    connect(Probe_T.y_InputData, digester.T_op) annotation(
      Line(points = {{9, -64}, {13, -64}, {13, -40}, {21, -40}}, color = {0, 0, 127}));
    connect(Feed_1.Sludge_Out, feeding_Tank.Sludge_In) annotation(
      Line(points = {{-70, -12}, {-56, -12}}));
    connect(Feed_2.Yogurth_Out, feeding_Tank.Yogurth_In) annotation(
      Line(points = {{-70, -48}, {-64, -48}, {-64, -22}, {-56, -22}}));
    connect(Sludge_flowrate.y, Feed_1.FlowRate_1) annotation(
      Line(points = {{-111, 38}, {-100, 38}, {-100, 6}, {-92, 6}}, color = {0, 0, 127}));
    connect(Yogurth_flowrate.y, Feed_2.FlowRate_2) annotation(
      Line(points = {{-112, -30}, {-92, -30}}, color = {0, 0, 127}));
    connect(temperature.y, Probe_T.InputData) annotation(
      Line(points = {{-16, -64}, {-6, -64}}, color = {0, 0, 127}));
    connect(pressure.y, Probe_P.InputData) annotation(
      Line(points = {{-31, 22}, {-24, 22}}, color = {0, 0, 127}));
    connect(Probe_P.y_InputData, PID.u_m) annotation(
      Line(points = {{-9, 22}, {-6, 22}, {-6, 6}, {24, 6}, {24, 14}}, color = {0, 0, 127}));
    connect(ProbeBiogasComposition_meas.y, Probe_BiogasComposition.FittingData) annotation(
      Line(points = {{62, 62}, {70, 62}, {70, 46}}, color = {0, 0, 127}));
    connect(ProbeBiogasFlowRate_meas.y, Probe_BiogasFlowRate.FittingData) annotation(
      Line(points = {{92, 62}, {98, 62}, {98, 46}}, color = {0, 0, 127}));
    connect(Probe_BiogasComposition.y_FittingData_1, Gas_Meter.CH4Content_meas) annotation(
      Line(points = {{70, 32}, {68, 32}, {68, 22}, {80, 22}, {80, 16}}, color = {0, 0, 127}));
    connect(Probe_BiogasComposition.y_FittingData_2, Gas_Meter.CO2Content_meas) annotation(
      Line(points = {{72, 32}, {72, 26}, {82, 26}, {82, 16}}, color = {0, 0, 127}));
    connect(Probe_BiogasFlowRate.y_FittingData_1, Gas_Meter.CH4FlowRate_meas) annotation(
      Line(points = {{98, 32}, {96, 32}, {96, 26}, {86, 26}, {86, 16}}, color = {0, 0, 127}));
    connect(Probe_BiogasFlowRate.y_FittingData_2, Gas_Meter.CO2FlowRate_meas) annotation(
      Line(points = {{100, 32}, {98, 32}, {98, 22}, {88, 22}, {88, 16}}, color = {0, 0, 127}));
    connect(digester.Digestate_Out, Discharge.Digestate_In) annotation(
      Line(points = {{60, -41.5}, {72.5, -41.5}, {72.5, -64}, {89, -64}}));
    connect(Probe_pH.y_FittingData, Discharge.pH_meas) annotation(
      Line(points = {{110, -50}, {110, -60}, {116, -60}, {116, -72}}, color = {0, 0, 127}));
    connect(pH_meas.y, Probe_pH.FittingData) annotation(
      Line(points = {{90.5, -21}, {110, -21}, {110, -36}}, color = {0, 0, 127}));
    connect(Probe_SingleVFA.y_FittingData_4, Discharge.Hva_meas) annotation(
      Line(points = {{146, -50}, {146, -60}, {144, -60}, {144, -72}}, color = {0, 0, 127}));
    connect(Probe_Alk.y_FittingData, Discharge.Alk_meas) annotation(
      Line(points = {{118, -40}, {118, -58}, {120, -58}, {120, -72}}, color = {0, 0, 127}));
    connect(Probe_TAN.y_FittingData, Discharge.TAN_meas) annotation(
      Line(points = {{126, -50}, {126, -56}, {124, -56}, {124, -72}}, color = {0, 0, 127}));
    connect(Probe_TVFA.y_FittingData, Discharge.VFA_meas) annotation(
      Line(points = {{134, -40}, {134, -60}, {128, -60}, {128, -72}}, color = {0, 0, 127}));
    connect(Probe_SingleVFA.y_FittingData_1, Discharge.Hac_meas) annotation(
      Line(points = {{140, -50}, {138, -50}, {138, -64}, {132, -64}, {132, -72}}, color = {0, 0, 127}));
    connect(Probe_SingleVFA.y_FittingData_2, Discharge.Hpro_meas) annotation(
      Line(points = {{142, -50}, {140, -50}, {140, -66}, {136, -66}, {136, -72}}, color = {0, 0, 127}));
    connect(Probe_SingleVFA.y_FittingData_3, Discharge.Hbu_meas) annotation(
      Line(points = {{144, -50}, {142, -50}, {142, -68}, {140, -68}, {140, -72}}, color = {0, 0, 127}));
    connect(Alk_meas.y, Probe_Alk.FittingData) annotation(
      Line(points = {{102.5, -13}, {118, -13}, {118, -26}}, color = {0, 0, 127}));
    connect(TAN_meas.y, Probe_TAN.FittingData) annotation(
      Line(points = {{114.5, -5}, {126, -5}, {126, -36}}, color = {0, 0, 127}));
    connect(TVFA_meas.y, Probe_TVFA.FittingData) annotation(
      Line(points = {{126.5, 3}, {134, 3}, {134, -26}}, color = {0, 0, 127}));
    connect(SingleVFAs_meas.y, Probe_SingleVFA.FittingData) annotation(
      Line(points = {{138.5, 11}, {142, 11}, {142, -36}}, color = {0, 0, 127}));
    connect(VS_meas.y, Probe_VS.FittingData) annotation(
      Line(points = {{162.5, -69}, {172, -69}, {172, -76}}, color = {0, 0, 127}));
    connect(Probe_VS.y_FittingData, Discharge.VS_meas) annotation(
      Line(points = {{172, -91}, {172, -94}, {144, -94}, {144, -86}}, color = {0, 0, 127}));
    connect(LI_tot_meas.y, Probe_LItot.FittingData) annotation(
      Line(points = {{182.5, -61}, {186, -61}, {186, -86}}, color = {0, 0, 127}));
    connect(Probe_LItot.y_FittingData, Discharge.LI_tot_meas) annotation(
      Line(points = {{186, -100}, {186, -106}, {140, -106}, {140, -86}}, color = {0, 0, 127}));
    connect(Probe_COD.y_FittingData_3, Discharge.COD_TKN_meas) annotation(
      Line(points = {{96, -104}, {96, -112}, {122, -112}, {122, -86}}, color = {0, 0, 127}));
    connect(Probe_COD.y_FittingData_2, Discharge.COD_BCA_meas) annotation(
      Line(points = {{94, -104}, {94, -110}, {118, -110}, {118, -86}}, color = {0, 0, 127}));
    connect(Probe_COD.y_FittingData_1, Discharge.COD_SM_meas) annotation(
      Line(points = {{92, -104}, {92, -108}, {112, -108}, {112, -86}}, color = {0, 0, 127}));
    connect(ProbeCODtot_meas.y, Probe_COD.FittingData) annotation(
      Line(points = {{68.5, -83}, {94, -83}, {94, -90}}, color = {0, 0, 127}));
    connect(CH_tot_meas.y, Probe_CHtot.FittingData) annotation(
      Line(points = {{54.5, -93}, {80, -93}, {80, -100}}, color = {0, 0, 127}));
    connect(Probe_CHtot.y_FittingData, Discharge.CH_tot_meas) annotation(
      Line(points = {{80, -115}, {80, -120}, {128, -120}, {128, -86}}, color = {0, 0, 127}));
    connect(Probe_PRtot.y_FittingData_1, Discharge.PR_tot_BCA_meas) annotation(
      Line(points = {{65, -125}, {66, -125}, {66, -130}, {132, -130}, {132, -86}}, color = {0, 0, 127}));
    connect(Probe_PRtot.y_FittingData_2, Discharge.PR_tot_TKN_meas) annotation(
      Line(points = {{67, -125}, {68, -125}, {68, -132}, {136, -132}, {136, -86}}, color = {0, 0, 127}));
    connect(PR_tot_meas.y, Probe_PRtot.FittingData) annotation(
      Line(points = {{40.5, -103}, {66, -103}, {66, -110}}, color = {0, 0, 127}));
    connect(pH_PLC.y, Probe_pH_PLC.FittingData) annotation(
      Line(points = {{78.5, -29}, {98, -29}, {98, -34}}, color = {0, 0, 127}));
    connect(Probe_pH_PLC.y_FittingData, Discharge.pH_PLC) annotation(
      Line(points = {{98, -48}, {98, -54}, {108, -54}, {108, -68}, {110, -68}, {110, -72}}, color = {0, 0, 127}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 8.4672e+06, Tolerance = 1e-06, Interval = 3600));
  end PilotPlant_Dynamic;

  class PilotPlant_SteadyState
    extends Modelica.Icons.Example;
    ADM1.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-32, -32}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1.BlockLibrary.Digester digester annotation(
      Placement(visible = true, transformation(origin = {49, -31}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID(Td = 30000, Ti = 60000, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.SteadyState, k = 0.05, xi_start = 104500, yMax = 1) annotation(
      Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Gas_Meter_noProbes Gas_Meter_noProbes annotation(
      Placement(visible = true, transformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Sludge_Discharge_noProbes Sludge_Discharge_noProbes annotation(
      Placement(visible = true, transformation(origin = {127, -53}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_1 Feed_1 annotation(
      Placement(visible = true, transformation(origin = {-77, -7}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Conc_Feed1_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -9}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Q_Feed1_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, 27}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_BMP(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_BMP_B0_Feed1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_BMP_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, 9}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_2 Feed_2 annotation(
      Placement(visible = true, transformation(origin = {-77, -43}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Conc_Feed2_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -53}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Q_Feed2_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -35}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_InputData Probe_T annotation(
      Placement(visible = true, transformation(origin = {6, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_T_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-14, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_InputData Probe_P annotation(
      Placement(visible = true, transformation(origin = {-18, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pressure(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-38, 22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  equation
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-16.16, -44.32}, {-0.16, -44.32}, {-0.16, -21.32}, {29.84, -21.32}}));
    connect(PID.y, digester.u) annotation(
      Line(points = {{41, 20}, {49, 20}, {49, -8}}, color = {0, 0, 127}));
    connect(digester.P_gas, PID.u_s) annotation(
      Line(points = {{46, -7.5}, {46, 2.5}, {10, 2.5}, {10, 20.5}, {18, 20.5}}, color = {0, 0, 127}));
    connect(digester.Biogas_Out, Gas_Meter_noProbes.Biogas_In) annotation(
      Line(points = {{60.5, -12}, {62.5, -12}, {62.5, 0}, {86.5, 0}}));
    connect(digester.Digestate_Out, Sludge_Discharge_noProbes.Digestate_In) annotation(
      Line(points = {{68, -47.5}, {104, -47.5}}));
    connect(Feed_1.Sludge_Out, feeding_Tank.Sludge_In) annotation(
      Line(points = {{-64, -17.5}, {-64, -17.9}, {-48.04, -17.9}}));
    connect(Sludge_flowrate.y, Feed_1.FlowRate_1) annotation(
      Line(points = {{-107, 27}, {-96.3, 27}, {-96.3, 1}, {-87, 1}}, color = {0, 0, 127}));
    connect(Sludge_concentrations.y, Feed_1.Concentrations_1) annotation(
      Line(points = {{-107, -9}, {-87, -9}}, color = {0, 0, 127}));
    connect(Yogurth_flowrate.y, Feed_2.FlowRate_2) annotation(
      Line(points = {{-107, -35}, {-87, -35}}, color = {0, 0, 127}));
    connect(Yogurth_concentrations.y, Feed_2.Concentrations_2) annotation(
      Line(points = {{-107, -53}, {-98.3, -53}, {-98.3, -45}, {-87, -45}}, color = {0, 0, 127}));
    connect(Probe_T.y_InputData, digester.T_op) annotation(
      Line(points = {{15, -80}, {20, -80}, {20, -46}, {30, -46}}, color = {0, 0, 127}));
    connect(Probe_P.y_InputData, PID.u_m) annotation(
      Line(points = {{-9, 22}, {-1, 22}, {-1, -6}, {29, -6}, {29, 8}}, color = {0, 0, 127}));
    connect(pressure.y, Probe_P.InputData) annotation(
      Line(points = {{-31, 22}, {-23.4, 22}}, color = {0, 0, 127}));
    connect(temperature.y, Probe_T.InputData) annotation(
      Line(points = {{-7, -80}, {0.6, -80}}, color = {0, 0, 127}));
    connect(Sludge_BMP.y, Feed_1.BMP_1) annotation(
      Line(points = {{-108, 10}, {-102, 10}, {-102, -4}, {-88, -4}}, color = {0, 0, 127}));
    connect(Feed_2.Yogurth_Out, feeding_Tank.Yogurth_In) annotation(
      Line(points = {{-64, -54}, {-58, -54}, {-58, -28}, {-48, -28}}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      experiment(StartTime = 0, StopTime = 6.3066e+07, Tolerance = 1e-06, Interval = 446.896));
  end PilotPlant_SteadyState;

  class Prova_x_Alberto
    extends Modelica.Icons.Example;
    ADM1.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-32, -32}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1.BlockLibrary.Digester digester annotation(
      Placement(visible = true, transformation(origin = {49, -31}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID(Td = 30000, Ti = 60000, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.SteadyState, k = 0.05, xi_start = 104500, yMax = 1) annotation(
      Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Gas_Meter_noProbes Gas_Meter_noProbes annotation(
      Placement(visible = true, transformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Sludge_Discharge_noProbes Sludge_Discharge_noProbes annotation(
      Placement(visible = true, transformation(origin = {127, -53}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_1 Feed_1 annotation(
      Placement(visible = true, transformation(origin = {-77, -7}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Conc_Feed1_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -9}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Q_Feed1_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, 27}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_BMP(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_BMP_B0_Feed1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_BMP_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, 9}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_2 Feed_2 annotation(
      Placement(visible = true, transformation(origin = {-77, -43}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Conc_Feed2_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -53}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Q_Feed2_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -35}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_InputData Probe_T annotation(
      Placement(visible = true, transformation(origin = {6, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_T_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-14, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_InputData Probe_P annotation(
      Placement(visible = true, transformation(origin = {-18, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pressure(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-38, 22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TAN_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/ProbeTAN_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTAN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {138, -28}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  equation
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-16.16, -44.32}, {-0.16, -44.32}, {-0.16, -21.32}, {29.84, -21.32}}));
    connect(PID.y, digester.u) annotation(
      Line(points = {{41, 20}, {49, 20}, {49, -8}}, color = {0, 0, 127}));
    connect(digester.P_gas, PID.u_s) annotation(
      Line(points = {{46, -7.5}, {46, 2.5}, {10, 2.5}, {10, 20.5}, {18, 20.5}}, color = {0, 0, 127}));
    connect(digester.Biogas_Out, Gas_Meter_noProbes.Biogas_In) annotation(
      Line(points = {{60.5, -12}, {62.5, -12}, {62.5, 0}, {86.5, 0}}));
    connect(digester.Digestate_Out, Sludge_Discharge_noProbes.Digestate_In) annotation(
      Line(points = {{68, -47.5}, {104, -47.5}}));
    connect(Feed_1.Sludge_Out, feeding_Tank.Sludge_In) annotation(
      Line(points = {{-64, -17.5}, {-64, -17.9}, {-48.04, -17.9}}));
    connect(Sludge_flowrate.y, Feed_1.FlowRate_1) annotation(
      Line(points = {{-107, 27}, {-96.3, 27}, {-96.3, 1}, {-87, 1}}, color = {0, 0, 127}));
    connect(Sludge_concentrations.y, Feed_1.Concentrations_1) annotation(
      Line(points = {{-107, -9}, {-87, -9}}, color = {0, 0, 127}));
    connect(Yogurth_flowrate.y, Feed_2.FlowRate_2) annotation(
      Line(points = {{-107, -35}, {-87, -35}}, color = {0, 0, 127}));
    connect(Yogurth_concentrations.y, Feed_2.Concentrations_2) annotation(
      Line(points = {{-107, -53}, {-98.3, -53}, {-98.3, -45}, {-87, -45}}, color = {0, 0, 127}));
    connect(Probe_T.y_InputData, digester.T_op) annotation(
      Line(points = {{15, -80}, {20, -80}, {20, -46}, {30, -46}}, color = {0, 0, 127}));
    connect(Probe_P.y_InputData, PID.u_m) annotation(
      Line(points = {{-9, 22}, {-1, 22}, {-1, -6}, {29, -6}, {29, 8}}, color = {0, 0, 127}));
    connect(pressure.y, Probe_P.InputData) annotation(
      Line(points = {{-31, 22}, {-23.4, 22}}, color = {0, 0, 127}));
    connect(temperature.y, Probe_T.InputData) annotation(
      Line(points = {{-7, -80}, {0.6, -80}}, color = {0, 0, 127}));
    connect(Sludge_BMP.y, Feed_1.BMP_1) annotation(
      Line(points = {{-108, 10}, {-102, 10}, {-102, -4}, {-88, -4}}, color = {0, 0, 127}));
    connect(Feed_2.Yogurth_Out, feeding_Tank.Yogurth_In) annotation(
      Line(points = {{-64, -54}, {-58, -54}, {-58, -28}, {-48, -28}}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      experiment(StartTime = 0, StopTime = 8.4672e+06, Tolerance = 1e-06, Interval = 3600));
  end Prova_x_Alberto;

  class Batch_Test
    extends Modelica.Icons.Example;
    BlockLibrary.Batch_activity_test Batch_activity_test annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Batch_test_preparation Batch_test_preparation annotation(
      Placement(visible = true, transformation(origin = {-54, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Batch_test_preparation.MixBatchTest_out, Batch_activity_test.MixBatchTest_in) annotation(
      Line(points = {{-50, 20}, {38, 20}}));
  end Batch_Test;

  //  annotation(
  //    uses(Modelica(version = "3.2.3")));

  class Prova
    Modelica.Blocks.Sources.CombiTimeTable Sludge_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_Conc_Feed1_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-46, -16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_BMP(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_BMP_B0_Feed1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_BMP_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-46, 6}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_Q_Feed1_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-46, 28}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_1_sink feed_1_sink annotation(
      Placement(visible = true, transformation(origin = {12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Sludge_flowrate.y, feed_1_sink.FlowRate_1) annotation(
      Line(points = {{-38, 28}, {-18, 28}, {-18, 6}, {6, 6}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Sludge_BMP.y, feed_1_sink.BMP_1) annotation(
      Line(points = {{-38, 6}, {-22, 6}, {-22, 2}, {6, 2}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Sludge_concentrations.y, feed_1_sink.Concentrations_1) annotation(
      Line(points = {{-38, -16}, {-14, -16}, {-14, -2}, {6, -2}}, color = {0, 0, 127}, thickness = 0.5));
    annotation(
      experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-6, Interval = 1728),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Prova;

  class Prova2
    BlockLibrary.Feed_2_sink feed_2_sink annotation(
      Placement(visible = true, transformation(origin = {28, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_Conc_Feed2_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/user/Documents/2022-2024_RTDA/03_Ricerca/01_ADM1 Modelling/DEIB/Codig_Ari/txt_dynamic/Input_Q_Feed2_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-54, 28}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  equation
    connect(Yogurth_flowrate.y, feed_2_sink.FlowRate_2) annotation(
      Line(points = {{-46, 28}, {-12, 28}, {-12, 18}, {22, 18}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Yogurth_concentrations.y, feed_2_sink.Concentrations_2) annotation(
      Line(points = {{-46, 4}, {-12, 4}, {-12, 10}, {22, 10}}, color = {0, 0, 127}, thickness = 0.5));
    annotation(
      experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-6, Interval = 1728),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Prova2;

  model Identification_discrete_meas
    //Measurments from sapling or combiTimeTable?
    parameter Boolean combi = true;
    //Measurments from sampling
    parameter Real Ts = 5;
    parameter Integer n_sample = 20 "round(simulation_time/Ts)-1";
    //Measurments from combiTimeTable
    parameter Real meas[6, 3] = [1, 1, 483.69; 2, 21, 496.66; 3, 40, 490.00; 4, 66, 455.93; 5, 85, 465.09; 6, 98, 426.60];
    parameter Integer n_meas = if combi == true then size(combiTimeTable.table[2:end, :], 1) else size(t_sampling, 1);
    Real t_meas[n_meas] = if combi == true then meas[:, 2] else t_sampling;
  //  Real v_meas[n_meas] = if combi == true then meas[:, 3] else y;
    Real v_meas[n_meas] = meas[:, 3];
    parameter Real table[7, 3] = [0, 0, 0; meas];
    //Parameters to be identified
    parameter Real mu = 266.856;
    parameter Real T = 0.1077115;
    //Variable declaration
    Real ISE(start = 0, fixed = false);
    Integer i_curr;
    Real err;
  //  Real err(start = 0, fixed = false);
    //Real y[20](each start=1);
    Real t_sampling[n_sample];
    Modelica.Blocks.Sources.RealExpression u(y = if time > 1 then 1 else 0) annotation(
      Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction P(a = {1, 10}, b = {3000}) annotation(
      Placement(visible = true, transformation(origin = {-32, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder Mrat(T = T, k = mu) annotation(
      Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = table[:, 2:3]) annotation(
      Placement(visible = true, transformation(origin = {-184, 70}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod = 1, sigma = 10) annotation(
      Placement(visible = true, transformation(origin = {-32, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add annotation(
      Placement(visible = true, transformation(origin = {6, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Prova_x_Alberto_model prova_x_Alberto_model annotation(
      Placement(visible = true, transformation(origin = {-16, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    for i in 1:size(t_sampling, 1) loop
      t_sampling[i] = Ts*i;
    end for;
    connect(u.y, P.u) annotation(
      Line(points = {{-118, 30}, {-84, 30}, {-84, 58}, {-44, 58}}, color = {0, 0, 127}));
    connect(u.y, Mrat.u) annotation(
      Line(points = {{-118, 30}, {-100, 30}, {-100, 10}, {-82, 10}}, color = {0, 0, 127}));
    connect(P.y, add.u1) annotation(
      Line(points = {{-20, 58}, {-6, 58}}, color = {0, 0, 127}));
    connect(normalNoise.y, add.u2) annotation(
      Line(points = {{-20, 40}, {-6, 40}, {-6, 46}}, color = {0, 0, 127}));
  initial algorithm
//ISE := 0;
    i_curr := 1;
    err :=0;
  algorithm
//      when sample(0,Ts) then
//      y[i_curr] := add.y;
//      i_curr := i_curr +1;
//      end when;
//
    when time >= t_meas[i_curr] then
      //y[i_curr] := add.y;
      err := prova_x_Alberto_model.Sludge_Discharge_noProbes.TAN_out - v_meas[i_curr];
      ISE := ISE + err^2;
      i_curr := i_curr + 1;
    end when;
//
//      when time >= t_meas[i_curr] then
//      err := Mrat.y - v_meas[i_curr];
//      ISE := ISE+err^2;
//      i_curr := i_curr +1;
////      if i_curr>6 then
////      terminate("Terminate");
////      end if;
//      end when;
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 3.0303),
      uses(Modelica(version = "4.0.0")),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*", noRestart = "()"));
  end Identification_discrete_meas;
  
  model Prova_x_Alberto_model
    extends Modelica.Icons.Example;
    ADM1.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-32, -32}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1.BlockLibrary.Digester digester annotation(
      Placement(visible = true, transformation(origin = {49, -31}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID(Td = 30000, Ti = 60000, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.SteadyState, k = 0.05, xi_start = 104500, yMax = 1) annotation(
      Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Gas_Meter_noProbes Gas_Meter_noProbes annotation(
      Placement(visible = true, transformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Sludge_Discharge_noProbes Sludge_Discharge_noProbes annotation(
      Placement(visible = true, transformation(origin = {127, -53}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_1 Feed_1 annotation(
      Placement(visible = true, transformation(origin = {-77, -7}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Conc_Feed1_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -9}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Q_Feed1_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, 27}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Sludge_BMP(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_BMP_B0_Feed1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_BMP_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, 9}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_2 Feed_2 annotation(
      Placement(visible = true, transformation(origin = {-77, -43}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Conc_Feed2_2023v5.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -53}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Yogurth_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_Q_Feed2_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-115, -35}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_InputData Probe_T annotation(
      Placement(visible = true, transformation(origin = {6, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_T_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-14, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_InputData Probe_P annotation(
      Placement(visible = true, transformation(origin = {-18, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pressure(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-38, 22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TAN_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Downloads/I_ Modello impianto da calibrare/ProbeTAN_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTAN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {138, -28}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  equation
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-16.16, -44.32}, {-0.16, -44.32}, {-0.16, -21.32}, {29.84, -21.32}}));
    connect(PID.y, digester.u) annotation(
      Line(points = {{41, 20}, {49, 20}, {49, -8}}, color = {0, 0, 127}));
    connect(digester.P_gas, PID.u_s) annotation(
      Line(points = {{46, -7.5}, {46, 2.5}, {10, 2.5}, {10, 20.5}, {18, 20.5}}, color = {0, 0, 127}));
    connect(digester.Biogas_Out, Gas_Meter_noProbes.Biogas_In) annotation(
      Line(points = {{60.5, -12}, {62.5, -12}, {62.5, 0}, {86.5, 0}}));
    connect(digester.Digestate_Out, Sludge_Discharge_noProbes.Digestate_In) annotation(
      Line(points = {{68, -47.5}, {104, -47.5}}));
    connect(Feed_1.Sludge_Out, feeding_Tank.Sludge_In) annotation(
      Line(points = {{-64, -17.5}, {-64, -17.9}, {-48.04, -17.9}}));
    connect(Sludge_flowrate.y, Feed_1.FlowRate_1) annotation(
      Line(points = {{-107, 27}, {-96.3, 27}, {-96.3, 1}, {-87, 1}}, color = {0, 0, 127}));
    connect(Sludge_concentrations.y, Feed_1.Concentrations_1) annotation(
      Line(points = {{-107, -9}, {-87, -9}}, color = {0, 0, 127}));
    connect(Yogurth_flowrate.y, Feed_2.FlowRate_2) annotation(
      Line(points = {{-107, -35}, {-87, -35}}, color = {0, 0, 127}));
    connect(Yogurth_concentrations.y, Feed_2.Concentrations_2) annotation(
      Line(points = {{-107, -53}, {-98.3, -53}, {-98.3, -45}, {-87, -45}}, color = {0, 0, 127}));
    connect(Probe_T.y_InputData, digester.T_op) annotation(
      Line(points = {{15, -80}, {20, -80}, {20, -46}, {30, -46}}, color = {0, 0, 127}));
    connect(Probe_P.y_InputData, PID.u_m) annotation(
      Line(points = {{-9, 22}, {-1, 22}, {-1, -6}, {29, -6}, {29, 8}}, color = {0, 0, 127}));
    connect(pressure.y, Probe_P.InputData) annotation(
      Line(points = {{-31, 22}, {-23.4, 22}}, color = {0, 0, 127}));
    connect(temperature.y, Probe_T.InputData) annotation(
      Line(points = {{-7, -80}, {0.6, -80}}, color = {0, 0, 127}));
    connect(Sludge_BMP.y, Feed_1.BMP_1) annotation(
      Line(points = {{-108, 10}, {-102, 10}, {-102, -4}, {-88, -4}}, color = {0, 0, 127}));
    connect(Feed_2.Yogurth_Out, feeding_Tank.Yogurth_In) annotation(
      Line(points = {{-64, -54}, {-58, -54}, {-58, -28}, {-48, -28}}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxIntegrationOrder = "1"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      experiment(StartTime = 0, StopTime = 8.4672e+06, Tolerance = 1e-06, Interval = 3600));
  end Prova_x_Alberto_model;
  
  model Identification_discrete_meas_
    //Measurments from sapling or combiTimeTable?
    parameter Boolean combi = true;
    //Measurments from sampling
    parameter Real Ts = 5;
    parameter Integer n_sample = 20 "round(simulation_time/Ts)-1";
    //Measurments from combiTimeTable
    parameter Real meas[6, 3] = [1, 1, 483.69; 2, 21, 496.66; 3, 40, 490.00; 4, 66, 455.93; 5, 85, 465.09; 6, 98, 426.60];
    parameter Integer n_meas = if combi == true then size(combiTimeTable.table[2:end, :], 1) else size(t_sampling, 1);
    Real t_meas[n_meas] = if combi == true then meas[:, 2] else t_sampling;
  //  Real v_meas[n_meas] = if combi == true then meas[:, 3] else y;
    Real v_meas[n_meas] = meas[:, 3];
    parameter Real table[7, 3] = [0, 0, 0; meas];
    //Parameters to be identified
    parameter Real mu = 266.856;
    parameter Real T = 0.1077115;
    //Variable declaration
    Real ISE(start = 0, fixed = false);
    discrete Integer i_curr(start=1,fixed=true);
    Real err(start=0);
  //  Real err(start = 0, fixed = false);
    //Real y[20](each start=1);
    Real t_sampling[n_sample];
    Modelica.Blocks.Sources.RealExpression u(y = if time > 1 then 1 else 0) annotation(
      Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction P(a = {1, 10}, b = {3000}) annotation(
      Placement(visible = true, transformation(origin = {-32, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder Mrat(T = T, k = mu) annotation(
      Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = table[:, 2:3]) annotation(
      Placement(visible = true, transformation(origin = {-184, 70}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = table[:, 1:2]) annotation(
      Placement(visible = true, transformation(origin = {-184, 70}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod = 1, sigma = 10) annotation(
      Placement(visible = true, transformation(origin = {-32, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add annotation(
      Placement(visible = true, transformation(origin = {6, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Prova_x_Alberto_model prova_x_Alberto_model annotation(
      Placement(visible = true, transformation(origin = {-16, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    for i in 1:size(t_sampling, 1) loop
      t_sampling[i] = Ts*i;
    end for;
    der(ISE) = err^2;
    connect(u.y, P.u) annotation(
      Line(points = {{-118, 30}, {-84, 30}, {-84, 58}, {-44, 58}}, color = {0, 0, 127}));
    connect(u.y, Mrat.u) annotation(
      Line(points = {{-118, 30}, {-100, 30}, {-100, 10}, {-82, 10}}, color = {0, 0, 127}));
    connect(P.y, add.u1) annotation(
      Line(points = {{-20, 58}, {-6, 58}}, color = {0, 0, 127}));
    connect(normalNoise.y, add.u2) annotation(
      Line(points = {{-20, 40}, {-6, 40}, {-6, 46}}, color = {0, 0, 127}));
  
  //      when sample(0,Ts) then
  //      y[i_curr] := add.y;
  //      i_curr := i_curr +1;
  //      end when;
  //
  //  when time >= t_meas[i_curr] then
  //    //y[i_curr] := add.y;
  //    err := prova_x_Alberto_model.Sludge_Discharge_noProbes.TAN_out - v_meas[i_curr];
  //    ISE := ISE + err^2;
  //    i_curr := i_curr + 1;
  //  end when;
  //i_curr=1;
  //err = if noEvent(time >= combiTimeTable2.y[1]) then pre(err) + prova_x_Alberto_model.Sludge_Discharge_noProbes.TAN_out - combiTimeTable.y[1] else pre(err);
  algorithm
    if noEvent(time == t_meas[i_curr]) then
      err := prova_x_Alberto_model.Sludge_Discharge_noProbes.TAN_out - v_meas[i_curr];
      i_curr := i_curr+1;
    end if;
  
  //
  //      when time >= t_meas[i_curr] then
  //      err := Mrat.y - v_meas[i_curr];
  //      ISE := ISE+err^2;
  //      i_curr := i_curr +1;
  ////      if i_curr>6 then
  ////      terminate("Terminate");
  ////      end if;
  //      end when;
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 3.0303),
      uses(Modelica(version = "4.0.0")),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*", noRestart = "()"));
  end Identification_discrete_meas_;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(origin = {-3, 18}, textColor = {193, 0, 0}, extent = {{-77, 62}, {83, -98}}, textString = "ADM")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    uses(Modelica(version = "4.0.0")));
end ADM1;
