import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure GlobalAttractorPackage {P : PhaseSpacePackage} where
  attractorSet : Set P.stateManifold
  invarianceUnderFlow : Prop
  attractingRegion : Prop
  globalAttractingProperty : Prop

structure GlobalAttractorEvidence {P : PhaseSpacePackage} (A : GlobalAttractorPackage P) where
  invarianceUnderFlowClosed : A.invarianceUnderFlow
  attractingRegionClosed : A.attractingRegion
  globalAttractingPropertyClosed : A.globalAttractingProperty

def GlobalAttractorClosed {P : PhaseSpacePackage} (A : GlobalAttractorPackage P) : Prop :=
  A.invarianceUnderFlow ∧ A.attractingRegion ∧ A.globalAttractingProperty

theorem global_attractor_closed_from_evidence {P : PhaseSpacePackage} (A : GlobalAttractorPackage P) (E : GlobalAttractorEvidence A) :
    GlobalAttractorClosed A := by
  exact And.intro E.invarianceUnderFlowClosed (And.intro E.attractingRegionClosed E.globalAttractingPropertyClosed)

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse