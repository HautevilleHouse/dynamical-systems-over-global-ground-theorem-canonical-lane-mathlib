import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure GlobalAttractorPackage where
  phaseSpace : Type u
  flow : phaseSpace → ℝ → phaseSpace
  semiflowProperty : Prop
  dissipativity : Prop
  attractorExists : Prop
  attractorCompact : Prop
  attractorInvariant : Prop
  attractorAttractsAllBounded : Prop

structure GlobalAttractorEvidence (G : GlobalAttractorPackage) where
  semiflowPropertyClosed : G.semiflowProperty
  dissipativityClosed : G.dissipativity
  attractorExistsClosed : G.attractorExists
  attractorCompactClosed : G.attractorCompact
  attractorInvariantClosed : G.attractorInvariant
  attractorAttractsAllBoundedClosed : G.attractorAttractsAllBounded

def GlobalAttractorClosed (G : GlobalAttractorPackage) : Prop :=
  G.semiflowProperty ∧ G.dissipativity ∧ G.attractorExists ∧
  G.attractorCompact ∧ G.attractorInvariant ∧ G.attractorAttractsAllBounded

theorem global_attractor_closed_from_evidence (G : GlobalAttractorPackage)
    (E : GlobalAttractorEvidence G) : GlobalAttractorClosed G := by
  exact And.intro E.semiflowPropertyClosed
    (And.intro E.dissipativityClosed
      (And.intro E.attractorExistsClosed
        (And.intro E.attractorCompactClosed
          (And.intro E.attractorInvariantClosed E.attractorAttractsAllBoundedClosed))))

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse
