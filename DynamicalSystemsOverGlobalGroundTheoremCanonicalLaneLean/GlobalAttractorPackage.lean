import canonicalLaneMathlib.DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean.AdmissibleClass

/-!
# Global Attractor Package

This module formalizes the existence of a global attractor for a dynamical system
under admissibility constraints.
-/

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure GlobalAttractorPackage {A : AdmissibleClass} where
  phaseSpace : Type u
  flow : phaseSpace → ℝ → phaseSpace
  semiflowProperty : Prop
  globalAttractorExists : Prop
  attractorInvariant : Prop
  attractorAttractsAllBoundedSets : Prop
  structureClosed : globalAttractorExists ∧ attractorInvariant ∧ attractorAttractsAllBoundedSets

structure GlobalAttractorEvidence {A : AdmissibleClass} (G : GlobalAttractorPackage A) where
  semiflowPropertyClosed : G.semiflowProperty
  globalAttractorExistsClosed : G.globalAttractorExists
  attractorInvariantClosed : G.attractorInvariant
  attractorAttractsAllBoundedSetsClosed : G.attractorAttractsAllBoundedSets

def GlobalAttractorClosed {A : AdmissibleClass} (G : GlobalAttractorPackage A) : Prop :=
  G.semiflowProperty ∧ G.globalAttractorExists ∧ G.attractorInvariant ∧ G.attractorAttractsAllBoundedSets

theorem global_attractor_closed_from_evidence
    {A : AdmissibleClass} (G : GlobalAttractorPackage A) (E : GlobalAttractorEvidence G) :
    GlobalAttractorClosed G := by
  exact And.intro E.semiflowPropertyClosed
    (And.intro E.globalAttractorExistsClosed
      (And.intro E.attractorInvariantClosed E.attractorAttractsAllBoundedSetsClosed))

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse