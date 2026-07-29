import canonicalLaneMathlib.AdmissibleClass

/-!
# Global Ground Dynamics Package

This module defines the core objects for the Dynamical Systems Over Global Ground Theorem:
a global attractor package, the dynamical system, and the ground-state energy surface.
The bridge/gate closure pattern is applied to these objects.
-/

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure GlobalCocycle where
  timeDomain : Type u
  stateSpace : Type v
  cocycleMap : timeDomain → stateSpace → stateSpace
  cocycleProperty : Prop

structure GlobalAttractor where
  globalCocycle : GlobalCocycle
  attractorSet : Set (GlobalCocycle.stateSpace)
  invariance : Prop
  attracting : Prop
  uniformAttracting : Prop
  globalAttractorProperty : Prop

structure GroundStateEnergySurface where
  globalAttractor : GlobalAttractor
  energyFunctional : (GlobalAttractor.globalCocycle.stateSpace) → ℝ
  groundStateValue : ℝ
  energyDissipation : Prop
  globalMinimality : Prop

structure AdmittedObject where
  globalAttractor : GlobalAttractor
  groundStateEnergySurface : GroundStateEnergySurface
  groundStateAttractorRelation : Prop
  conclusion : groundStateAttractorRelation

def GlobalWitnessClosed (O : AdmittedObject) : Prop :=
  O.groundStateAttractorRelation

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse
