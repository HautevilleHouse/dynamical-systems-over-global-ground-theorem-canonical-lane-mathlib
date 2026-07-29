import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure PhaseSpacePackage where
  stateManifold : Type u
  timeDomain : Type v
  vectorField : Type w
  globalFlow : Prop
  invariantMeasure : Prop

structure PhaseSpaceEvidence (P : PhaseSpacePackage) where
  globalFlowClosed : P.globalFlow
  invariantMeasureClosed : P.invariantMeasure

def PhaseSpaceClosed (P : PhaseSpacePackage) : Prop :=
  P.globalFlow ∧ P.invariantMeasure

theorem phase_space_closed_from_evidence (P : PhaseSpacePackage) (E : PhaseSpaceEvidence P) :
    PhaseSpaceClosed P := by
  exact And.intro E.globalFlowClosed E.invariantMeasureClosed

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse