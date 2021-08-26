// Copyright 2019 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:nabed_test/libs/charts_common/src/data/tree.dart';

import 'base_treemap_renderer.dart';
import 'treemap_renderer_config.dart';

/// A treemap renderer that renders a treemap with slice-and-dice layout.
class SliceDiceTreeMapRenderer<D> extends BaseTreeMapRenderer<D> {
  SliceDiceTreeMapRenderer(
      {String? rendererId, TreeMapRendererConfig<D>? config})
      : super(
            config: config ??
                TreeMapRendererConfig(tileType: TreeMapTileType.sliceDice),
            rendererId: rendererId ?? BaseTreeMapRenderer.defaultRendererId);

  /// Uses slice-and-dice as the tiling algorithm for this tree map.
  @override
  void tile(TreeNode<Object> node) {
    final children = node.children;
    if (children.isNotEmpty) {
      final rect = availableLayoutBoundingRect(node);
      final measure = measureForTreeNode(node);
      final scaleFactor = measure == 0 ? 0 : areaForRectangle(rect) / measure;
      scaleArea(children, scaleFactor);
      position(children, rect, node.depth & 1 == 1 ? rect.height : rect.width,
          areaForRectangle(rect));
    }
  }
}
