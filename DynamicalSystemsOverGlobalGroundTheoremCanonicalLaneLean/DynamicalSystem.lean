import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure DynamicalSystem (M : Type*) [TopologicalSpace M] where
  stateSpace : Type u
  timeDomain : Type v
  flow : timeDomain → stateSpace → stateSpace
  continuousFlow : Prop
  groupAction : Prop
  invariantSet : Set stateSpace

structure GlobalGroundTheorem where
  dynamicalSystem : DynamicalSystem (Type u) inferInstance
  globalAttractorExists : Prop
  basinOfAttractionFull : Prop
  groundStateUnique : Prop
  lyapunovFunctionExists : Prop

theorem global_ground_theorem_statement (D : DynamicalSystem (Type u) inferInstance)
    (G : GlobalGroundTheorem) : G.globalAttractorExists ∧ G.basinOfAttractionFull ∧
    G.groundStateUnique ∧ G.lyapunovFunctionExists := by
  rcases G with ⟨h1, h2, h3, h4⟩
  exact ⟨h1, h2, h3, h4⟩

end HautevilleHouse
end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean