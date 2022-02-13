
// set state-full object
export const state = () => ({
  parent_id: null,
  voted_status: false,
  show_modal: false,
})

// sync method
export const mutations = {
  updateParentId(state, parent_id) {
    state.parent_id = parent_id
  },
  updateVotedStatus(state, voted_status) {
    state.voted_status = voted_status
  },
  updateShowModal(state, show_modal) {
    state.show_modal = show_modal
  },
}

// async method
// export const actions = {}

// export const getters = {
//   getParentId: (state) => {
//     return state.parent_id
//   }
// }
