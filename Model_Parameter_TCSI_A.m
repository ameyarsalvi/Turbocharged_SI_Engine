% Model Parameters for air system model ;
u_0 = 0.0039; % [rad] throttle opening corresponding to u_alpha = 0
d_th = 32e-3; % [m] throttle diameter

R = 287; % Gas Constant
theta_a = 298; % [K] ambient temperature
p_a = 0.98e5; % [Pa] ambient pressure

V_m = 16.3210e-3; % [m^3] Manifold Volume
theta_m = 298; % [K] Manifold Temperature, assumed should be higher 340 K

gamma0 = 0.5337;   %Coeffients for speed dependence of the volumetric efficiency
gamma1 = 4e-3; % etha_v(omega_e)=(gamma0+gamma1*omega_e+gamma2*omega_e^2)
gamma2 = -9.4152e-6;

V_d = 1.99e-3; % [m^3] engine displacement
V_c = 1.99e-3; % [m^3] volume of combustion chamber
kappa = 1.35; 
p_e = 1.05e5; % [Pa] exhaust pressure
lambda = 1; % [-] air-excess factor
sigma_0 = 14.7; % [-] Stoichiometric AFR

p_minit = 3e4; %[Pa] initial manifold pressure

% Parameters for Torque Generation Model
eta0 = 0.41512;
eta1 = 6.9379e-005;  % coefficient for speed influence on Willans slope e
beta0 = 47.9602; 
beta2 = 2.1291e-005; % coefficient for speed influence on Willans intercept pmeof
tau_injTC_ref = 0.10348; % [s] injection to torque-center delay at omega_ref.
omega_tauref = 90; % [rad/s] omega for tau_ref
dm_init = 4e-3;% initial condition for transport-delayed engine air flow

LHV = 42.5e6; % [J/kg] LHV of the fuel

I_e = 0.32074; % [kg m^3] Engine Inertia
omega_einit = 90;% [rad/s] initial engine speed

% Pade approximation of constant IPS delay at reference speed: tau_injTC_ref  
[num,den]=pade(tau_injTC_ref,3); % 4th order Pade approximation. Then use in Simulink Block as an LTI object or as a TF object
TCdelay=tf(num,den);%  LTI object (transfer function) form.--- (optional)
%%
% Step 2. Change the simulink model (its delay subsystem). The variable delay is approximated with a
%fixed-delay with the obtained Pade transfer function (The nonlinear simulink model so
% modified (only with this change) is saved as 'nonlin_pade.mdl)
% %%

theta_exm=873;
V_exm=0.0012;

c_pa=1011;
            c_pe=1332;
             R_a=287;
             R_e=286;
            c_va=724;
            c_ve=1046;
         gamma_a=1.3964;
         gamma_e=1.2734;
         gamma_c=1.3500;
           T_amb=298.4636;
           p_amb=1.0111e+05;
            V_im=0.0220;
       p_im_Init=1.0111e+05;
            T_im=300.6186;
            V_em=0.0200;
       p_em_Init=1.0111e+05;
             r_c=17;
             V_d=0.0127;
            q_HV=42900000;
             AFs=14.5700;
           n_cyl=6;
             T_w=298.4636;
          d_pipe=0.1000;
          l_pipe=1;
          n_pipe=2;
             R_c=0.0400;
          c_psi2=0;
          c_phi2=0;
       c_wpsiVec=[1.0882e-08 -1.7320e-04 1.0286];
       c_wphiVec=[-1.4298e-08 -0.0015 29.6462];
             Q_c=[3.09189776853185,-2.48232013831700;-2.48232013831700,2.14785596204381];
        eta_cmax=0.7364;
          w_copt=0.2753;
         pi_copt=1.0455;
        c_volVec=[-0.000208166198432250;-0.00344651580527006;1.14970210210591];
        T_1_Init=300.6418;
        x_r_Init=0;
          eta_sc=1.1015;
            x_cv=2.3371e-14;
           h_tot=96.2755;
        eta_igch=0.6894;
        A_egrmax=4.0000e-04;
        tau_degr=0.0650;
       uInit_egr=0;
       PI_egropt=0.6500;
        A_vgtmax=8.4558e-04;
             R_t=0.0400;
         BSR_opt=0.9755;
          c_mVec=[1.3563 2.7692e+03 0.0100];
          w_tlin=2.7969e+03;
          c_mlin=1.4021;
         tau_vgt=0.0250;
       uInit_vgt=0;
             K_t=2.8902;
            c_f1=1.9480;
            c_f2=-0.7763;
          c_vgt1=126.8719;
          c_vgt2=117.1447;
             J_t=2.0000e-04;
    omega_t_Init=5.2360e+03;
           c_egr=[-0.000111042379923460;0.0177806122860778;0];
       eta_tmmax=0.8180;
        tau_egr1=0.0500;
        tau_egr=0.1300;
           K_egr=1.8000;
        tau_dvgt= 0.0400;
            X_Oc= 0.2314;
            c_pi= 0.2708;
       c_fricVec=[0.972722756898463;-0.676883030256722;0.598189125972120];

       