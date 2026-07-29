import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

def ConstrainedGlobalGroundClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_global_ground_endgame (A : AdmissibleClass) :
    ConstrainedGlobalGroundClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse
