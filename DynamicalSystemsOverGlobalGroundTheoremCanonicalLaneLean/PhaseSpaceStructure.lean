import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure PhaseSpacePackage where
  spaceType : Type u
  topology : TopologicalSpace spaceType
  smoothStructure : Prop
  metric : Type v
  completeMetric : Prop
  separable : Prop

structure PhaseSpaceEvidence (P : PhaseSpacePackage) where
  smoothStructureClosed : P.smoothStructure
  completeMetricClosed : P.completeMetric
  separableClosed : P.separable

def PhaseSpaceClosed (P : PhaseSpacePackage) : Prop :=
  P.smoothStructure ∧ P.completeMetric ∧ P.separable

theorem phase_space_closed_from_evidence (P : PhaseSpacePackage)
    (E : PhaseSpaceEvidence P) : PhaseSpaceClosed P := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.completeMetricClosed E.separableClosed)

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse