import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure LyapunovStabilityPackage where
  equilibrium : Type u
  flow : equilibrium → ℝ → equilibrium
  stabilityProperty : Prop
  lyapunovFunction : Type v
  lyapunovFunctionExists : Prop
  lyapunovFunctionDecay : Prop
  asymptoticStability : Prop

structure LyapunovStabilityEvidence (L : LyapunovStabilityPackage) where
  stabilityPropertyClosed : L.stabilityProperty
  lyapunovFunctionExistsClosed : L.lyapunovFunctionExists
  lyapunovFunctionDecayClosed : L.lyapunovFunctionDecay
  asymptoticStabilityClosed : L.asymptoticStability

def LyapunovStabilityClosed (L : LyapunovStabilityPackage) : Prop :=
  L.stabilityProperty ∧ L.lyapunovFunctionExists ∧ L.lyapunovFunctionDecay ∧ L.asymptoticStability

theorem lyapunov_stability_closed_from_evidence (L : LyapunovStabilityPackage)
    (E : LyapunovStabilityEvidence L) : LyapunovStabilityClosed L := by
  exact And.intro E.stabilityPropertyClosed
    (And.intro E.lyapunovFunctionExistsClosed
      (And.intro E.lyapunovFunctionDecayClosed E.asymptoticStabilityClosed))

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse
