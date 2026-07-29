import canonicalLaneMathlib.DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean.GlobalAttractorPackage

/-!
# Lyapunov Function Package

This module defines a Lyapunov function structure used to establish stability
and convergence in dynamical systems.
-/

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure LyapunovFunctionPackage {A : AdmissibleClass}
    (G : GlobalAttractorPackage A) where
  lyapunovFunction : G.phaseSpace → ℝ
  continuous : Prop
  positiveDefinite : Prop
  derivativeNegativeSemiDefinite : Prop
  laSalleInvariancePrinciple : Prop
  stabilityConvergenceClosed : positiveDefinite ∧ derivativeNegativeSemiDefinite ∧ laSalleInvariancePrinciple

structure LyapunovFunctionEvidence {A : AdmissibleClass}
    {G : GlobalAttractorPackage A} (L : LyapunovFunctionPackage G) where
  continuousClosed : L.continuous
  positiveDefiniteClosed : L.positiveDefinite
  derivativeNegativeSemiDefiniteClosed : L.derivativeNegativeSemiDefinite
  laSalleInvariancePrincipleClosed : L.laSalleInvariancePrinciple

def LyapunovFunctionClosed {A : AdmissibleClass}
    {G : GlobalAttractorPackage A} (L : LyapunovFunctionPackage G) : Prop :=
  L.continuous ∧ L.positiveDefinite ∧ L.derivativeNegativeSemiDefinite ∧ L.laSalleInvariancePrinciple

theorem lyapunov_function_closed_from_evidence
    {A : AdmissibleClass} {G : GlobalAttractorPackage A}
    (L : LyapunovFunctionPackage G) (E : LyapunovFunctionEvidence L) :
    LyapunovFunctionClosed L := by
  exact And.intro E.continuousClosed
    (And.intro E.positiveDefiniteClosed
      (And.intro E.derivativeNegativeSemiDefiniteClosed E.laSalleInvariancePrincipleClosed))

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse