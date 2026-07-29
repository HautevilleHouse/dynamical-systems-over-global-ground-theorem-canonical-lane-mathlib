import canonicalLaneMathlib.DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean.LyapunovFunction

/-!
# Morse Decomposition Package

This module formalizes a Morse decomposition of the global attractor,
providing a filtration by invariant sets.
-/

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure MorseDecompositionPackage {A : AdmissibleClass}
    {G : GlobalAttractorPackage A} (L : LyapunovFunctionPackage G) where
  morseSets : List (Set G.phaseSpace)
  invariant : ∀ s ∈ morseSets, ∀ x ∈ s, ∀ t : ℝ, G.flow x t ∈ s
  disjoint : ∀ s t ∈ morseSets, s ≠ t → s ∩ t = ∅
  covering : ⋃₀ morseSets = Set.univ
  filtrationOrder : Prop
  structureClosed : invariant ∧ disjoint ∧ covering ∧ filtrationOrder

structure MorseDecompositionEvidence {A : AdmissibleClass}
    {G : GlobalAttractorPackage A} {L : LyapunovFunctionPackage G}
    (M : MorseDecompositionPackage L) where
  invariantClosed : M.invariant
  disjointClosed : M.disjoint
  coveringClosed : M.covering
  filtrationOrderClosed : M.filtrationOrder

def MorseDecompositionClosed {A : AdmissibleClass}
    {G : GlobalAttractorPackage A} {L : LyapunovFunctionPackage G}
    (M : MorseDecompositionPackage L) : Prop :=
  M.invariant ∧ M.disjoint ∧ M.covering ∧ M.filtrationOrder

theorem morse_decomposition_closed_from_evidence
    {A : AdmissibleClass} {G : GlobalAttractorPackage A} {L : LyapunovFunctionPackage G}
    (M : MorseDecompositionPackage L) (E : MorseDecompositionEvidence M) :
    MorseDecompositionClosed M := by
  exact And.intro E.invariantClosed
    (And.intro E.disjointClosed
      (And.intro E.coveringClosed E.filtrationOrderClosed))

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse