// set state-full object
export const state = () => ({
  parent_id: null,
  voted_status: false,
})

// sync method
export const mutations = {
  updateParentId(state, parent_id) {
    state.parent_id = parent_id
  },
  updateVotedStatus(state, voted_status) {
    state.voted_status = voted_status
  },
}

// async method
// export const actions = {}

// export const getters = {
//   getParentId: (state) => {
//     return state.parent_id
//   }
// }
