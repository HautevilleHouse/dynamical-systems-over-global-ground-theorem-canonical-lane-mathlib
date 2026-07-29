import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure GlobalAttractorStructurePackage {M : Type*} [TopologicalSpace M]
    (D : DynamicalSystem M) where
  attractorSet : Set M
  compactness : Prop
  invariance : Prop
  attractsUniformly : Prop
  basinFullMeasure : Prop

structure GlobalAttractorStructureEvidence {M : Type*} [TopologicalSpace M]
    {D : DynamicalSystem M} (G : GlobalAttractorStructurePackage D) where
  compactnessClosed : G.compactness
  invarianceClosed : G.invariance
  attractsUniformlyClosed : G.attractsUniformly
  basinFullMeasureClosed : G.basinFullMeasure

def GlobalAttractorStructureClosed {M : Type*} [TopologicalSpace M]
    {D : DynamicalSystem M} (G : GlobalAttractorStructurePackage D) : Prop :=
  G.compactness ∧ G.invariance ∧ G.attractsUniformly ∧ G.basinFullMeasure

theorem global_attractor_structure_closed_from_evidence {M : Type*} [TopologicalSpace M]
    {D : DynamicalSystem M} (G : GlobalAttractorStructurePackage D)
    (E : GlobalAttractorStructureEvidence G) : GlobalAttractorStructureClosed G := by
  exact And.intro E.compactnessClosed
    (And.intro E.invarianceClosed
      (And.intro E.attractsUniformlyClosed E.basinFullMeasureClosed))

end HautevilleHouse
end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean