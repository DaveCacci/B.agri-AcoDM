**Author:** Davide Carecci  
**Initial commit:** 07.01.2026  
⚠️ This repo uses Git LFS - do not download as ZIP (see Notes section of this README).
⚠️ The **general_utils** library contains also a user manual to setup VSCode/Python for non-expert users and the list of the required standard Python libraries (download it from the [GitHub](https://github.com/DaveCacci/general_utils.git) repository).

---

**BIOGoAlS.agri-AcoDM** is a comprehensive high-fidelity model tool designed for scenario analysis, *off-line* optimization of the diet input mix to maximize the plant performance (e.g. enhence biomethane production) and to mimic a real plant in the numerical validation of 'lower-level' controllers.

The tool is used primarily to:
- Conduct the *off-line* optimization of the diet input mix to set the reference controller's setpoints for the experimental campaigns
- Validate in simulation the *BIOGoAlS.Select* tool
- Provide an informative "synthetic" dataset for the 'first-stage' calibration of the reduced-order/control-oriented model used in the *BIOGoAlS.Twin* tool
- Validate in simulation the *BIOGoAlS.Twin* tool

---

### Documentation

- [**OpenModelica Software User Manual**](./OpenModelicaUsersGuide-latest.pdf)  
  User manual to start work with the **agriAcoDM.mo** library in OpenModelica and the Modelica language in general.

- [**OpenModelica Compiler Software User Manual**](./OMC_API-HowTo.pdf)  
  List of commands that can be user when calling the OpenModelica Compiler (OMC) from Python (used in almost all the notebooks by the **modelica_integrator.py** function, present in the **general_utils** library).

- [**Model calibration Pseudo-Code**](./Model_calibration_pseudo_code.pdf)  
  Simple conceptual guidance to clarify the work pipeline to be carried out when calibrating the model (adapt it to a specific case-study).

- [**Model calibration Visual Scheme**](./Model_calibration_scheme_general.pdf)  
  Simple conceptual visual representation to clarify the work pipeline to be carried out when calibrating the model (adapt it to a specific case-study).

- [**agri-AcoDM Visual Scheme**](./agri-AcoDM_model_scheme.pdf)  
  Simple conceptual visual representation to clarify the main variables and processes included in the agri-AcoDM model.

- [**Feedstock characterization Visual Scheme**](./Feedstock_characterization_myapp.pdf)  
  Simple conceptual visual representation to clarify the main approch to feedstock characterization used in the agri-AcoDM model.

- [**BIOGOALS.agriAcoDM User Manual**](./BIOGOALS.AGRI-ACODM_USER_MANUAL.pdf)  
  Comprehensive documentation of the repository structure and main scripts:
  - [`/agriAcoDM.mo`](./agriAcoDM.mo)
  - [`/Diet_optimization/Optimization_diet.ipynb`](./Diet_optimization/Optimization_diet.ipynb)
  - [`/Integration/Intgrate.ipynb`](./Integration/Intgrate.ipynb)
  - [`/Parameter_estimation/Parameter_estimation.ipynb`](./Parameter_estimation/Parameter_estimation.ipynb)
  - [`/Parameter_estimation/Parameter_uncertainty_linear.ipynb`](./Parameter_estimation/Parameter_uncertainty_linear.ipynb)
  - [`/Sensitivity_ParameterSweep/Parameter_sweep.ipynb`](./Sensitivity_ParameterSweep/Parameter_sweep.ipynb)
  - [`/Sensitivity_ParameterSweep/Sensitivity_local_OAT.ipynb`](./Sensitivity_ParameterSweep/Sensitivity_local_OAT.ipynb)
  - [`/Sensitivity_ParameterSweep/Sensitivity_global_Sobol.ipynb`](./Sensitivity_ParameterSweep/Sensitivity_global_Sobol.ipynb)

---

### Inside the `/CombiTimeTables` folder:

- **Jupyter Notebook** to convert data stored in a CSV file to proper TXT format, for it to be read inside the models of the **agriAcoDM.mo** Modelica library.

- **Examples** of TXT files used inside the **agriAcoDM.mo**.

---

### Inside the `/Diet_optimization` folder:

- **Jupyter Notebook** to run an *off-line* optimization of the diet input mix and, thus, to extract the reference controller's setpoints.

- **Example** of notebook's output.

---

### Inside the `/Integration` folder:

- **Jupyter Notebook** to simply integrate whatever model inside the **agriAcoDM.mo** library, extract, save and plot the dynamic trajectories of interest.

- **Example** of notebook's output.

---

### Inside the `/Parameter_estimation` folder:

- **Jupyter Notebook** to estimate the parameters of a model inside the **agriAcoDM.mo** library.

- **Jupyter Notebooks** to quantify and propagate the uncertainty of the parameter estimates.

- **Example** of notebook's output.

---

### Inside the `/Sensitivity_ParameterSweep` folder:

- **Jupyter Notebook** to simply conduct a 'parameter sweep'/Monte Carlo analysis (i.e. multiple model's simulations) of a model inside the **agriAcoDM.mo** library.

- **Jupyter Notebooks** to simply conduct sensitivity and collinearity analyses (Parameter Subset Selection (PSS)) of some model's outputs to some model's parameters (practical identifiability analysis).

- **Example** of notebook's output.

---

### Inside the `/Data` folder:

- **Example** of process data required to run the notebooks.

---

### Notes

- Markdown links (`./folder/file`) are used for proper GitHub rendering.  
- Python 3.10+ is required.
- Future work are needed to combine the results of the nonlinear constrained *off-line* optimization of the diet with the ones of the *BIOGoAlS.TE-LP* tool (simplified techno-economic/supply-chain prospective).
- The *off-line* optimization of the diet done with the **Optimization_diet.ipynb** notebook can be easily extended from the maximization of biomethane production to maximization of the plant profit (techno-economic framework). 
- Extensive use of the custom functions present inside the **general_utils** library (download it from [GitHub](https://github.com/DaveCacci/general_utils.git) repository).
- For further details, please refer also to the PhD thesis of the author (visit [POLItesi](https://www.politesi.polimi.it/) or request a copy to <davide.carecci@polimi.it>).

- ⚠️ Important: Git LFS Required
  This repository uses Git LFS (Large File Storage).
  ❌ Do NOT download the project using "Download ZIP" — files will be incomplete.
  ✅ Instead, clone the repository:

  `git clone <repo-url>`
  `cd <repo>`
  `git lfs pull`

---

© 2026 Davide Carecci — All rights reserved.