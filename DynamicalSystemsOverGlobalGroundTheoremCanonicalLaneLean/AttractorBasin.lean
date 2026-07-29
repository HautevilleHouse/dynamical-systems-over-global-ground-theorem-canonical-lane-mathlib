import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure AttractorBasinPackage {M : Type*} [TopologicalSpace M]
    (D : DynamicalSystem M) where
  attractorSet : Set M
  basinDefinition : Prop
  invarianceUnderFlow : Prop
  attractionRate : Prop
  basinOpenness : Prop

structure AttractorBasinEvidence {M : Type*} [TopologicalSpace M]
    {D : DynamicalSystem M} (B : AttractorBasinPackage D) where
  basinDefinitionClosed : B.basinDefinition
  invarianceUnderFlowClosed : B.invarianceUnderFlow
  attractionRateClosed : B.attractionRate
  basinOpennessClosed : B.basinOpenness

def AttractorBasinClosed {M : Type*} [TopologicalSpace M]
    {D : DynamicalSystem M} (B : AttractorBasinPackage D) : Prop :=
  B.basinDefinition ∧ B.invarianceUnderFlow ∧ B.attractionRate ∧ B.basinOpenness

theorem attractor_basin_closed_from_evidence {M : Type*} [TopologicalSpace M]
    {D : DynamicalSystem M} (B : AttractorBasinPackage D)
    (E : AttractorBasinEvidence B) : AttractorBasinClosed B := by
  exact And.intro E.basinDefinitionClosed
    (And.intro E.invarianceUnderFlowClosed
      (And.intro E.attractionRateClosed E.basinOpennessClosed))

end HautevilleHouse
end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean