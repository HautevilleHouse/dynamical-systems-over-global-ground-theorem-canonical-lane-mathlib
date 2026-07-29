import canonicalLaneMathlib.DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean.MorseDecomposition

/-!
# Topological Conjugacy Package

This module defines topological conjugacy between two dynamical systems
over the global ground theorem.
-/

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure TopologicalConjugacyPackage {A B : AdmissibleClass}
    {G_A : GlobalAttractorPackage A} {G_B : GlobalAttractorPackage B}
    (M_A : MorseDecompositionPackage (L : LyapunovFunctionPackage G_A))
    (M_B : MorseDecompositionPackage (L' : LyapunovFunctionPackage G_B)) where
  homeomorphism : G_A.phaseSpace → G_B.phaseSpace
  homeoContinuous : Continuous homeomorphism
  homeoInverseContinuous : Continuous (Function.invFun homeomorphism)
  conjugacyProperty : ∀ x : G_A.phaseSpace, ∀ t : ℝ,
    homeomorphism (G_A.flow x t) = G_B.flow (homeomorphism x) t
  morsemapPreserved : homeomorphism '' (⋃₀ M_A.morseSets) = ⋃₀ M_B.morseSets
  structureClosed : homeoContinuous ∧ homeoInverseContinuous ∧ conjugacyProperty ∧ morsemapPreserved

structure TopologicalConjugacyEvidence {A B : AdmissibleClass}
    {G_A : GlobalAttractorPackage A} {G_B : GlobalAttractorPackage B}
    {M_A : MorseDecompositionPackage (L : LyapunovFunctionPackage G_A)}
    {M_B : MorseDecompositionPackage (L' : LyapunovFunctionPackage G_B)}
    (C : TopologicalConjugacyPackage M_A M_B) where
  homeoContinuousClosed : C.homeoContinuous
  homeoInverseContinuousClosed : C.homeoInverseContinuous
  conjugacyPropertyClosed : C.conjugacyProperty
  morsemapPreservedClosed : C.morsemapPreserved

def TopologicalConjugacyClosed {A B : AdmissibleClass}
    {G_A : GlobalAttractorPackage A} {G_B : GlobalAttractorPackage B}
    {M_A : MorseDecompositionPackage (L : LyapunovFunctionPackage G_A)}
    {M_B : MorseDecompositionPackage (L' : LyapunovFunctionPackage G_B)}
    (C : TopologicalConjugacyPackage M_A M_B) : Prop :=
  C.homeoContinuous ∧ C.homeoInverseContinuous ∧ C.conjugacyProperty ∧ C.morsemapPreserved

theorem topological_conjugacy_closed_from_evidence
    {A B : AdmissibleClass} {G_A : GlobalAttractorPackage A} {G_B : GlobalAttractorPackage B}
    {M_A : MorseDecompositionPackage (L : LyapunovFunctionPackage G_A)}
    {M_B : MorseDecompositionPackage (L' : LyapunovFunctionPackage G_B)}
    (C : TopologicalConjugacyPackage M_A M_B) (E : TopologicalConjugacyEvidence C) :
    TopologicalConjugacyClosed C := by
  exact And.intro E.homeoContinuousClosed
    (And.intro E.homeoInverseContinuousClosed
      (And.intro E.conjugacyPropertyClosed E.morsemapPreservedClosed))

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse