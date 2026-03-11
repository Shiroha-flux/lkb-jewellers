DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-maisy',
    'Maisy',
    'Maisy - Round 6 Claw Solitaire with Pave Band and Cathedral Setting Engagement Ring',
    'Maisy is a sophisticated 6-claw round solitaire design featuring a sweeping cathedral setting and sparkling 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-maisy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-maisy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maisy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maisy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-maisy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maisy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maisy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-maisy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maisy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maisy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maisy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-maisy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-maisy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-maisy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maisy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-maisy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maisy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-maisy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-maisy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-maisy-size-0', 1, v_id, 'D'),
      ('ring-maisy-size-1', 2, v_id, 'E'),
      ('ring-maisy-size-2', 3, v_id, 'F'),
      ('ring-maisy-size-3', 4, v_id, 'G'),
      ('ring-maisy-size-4', 5, v_id, 'H'),
      ('ring-maisy-size-5', 6, v_id, 'I'),
      ('ring-maisy-size-6', 7, v_id, 'J'),
      ('ring-maisy-size-7', 8, v_id, 'K'),
      ('ring-maisy-size-8', 9, v_id, 'L'),
      ('ring-maisy-size-9', 10, v_id, 'M'),
      ('ring-maisy-size-10', 11, v_id, 'N'),
      ('ring-maisy-size-11', 12, v_id, 'O'),
      ('ring-maisy-size-12', 13, v_id, 'P'),
      ('ring-maisy-size-13', 14, v_id, 'Q'),
      ('ring-maisy-size-14', 15, v_id, 'R'),
      ('ring-maisy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-maisy-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-mariah',
    'Mariah',
    'Mariah - Round 6 Claw Solitaire with Crown Gallery Engagement Ring',
    'Mariah is an elegant low-set solitaire design with a round cut centre stone and six eagle-tipped claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-mariah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-mariah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mariah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mariah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mariah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mariah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mariah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mariah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mariah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mariah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mariah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-mariah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-mariah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-mariah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mariah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-mariah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mariah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-mariah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-mariah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-mariah-size-0', 1, v_id, 'D'),
      ('ring-mariah-size-1', 2, v_id, 'E'),
      ('ring-mariah-size-2', 3, v_id, 'F'),
      ('ring-mariah-size-3', 4, v_id, 'G'),
      ('ring-mariah-size-4', 5, v_id, 'H'),
      ('ring-mariah-size-5', 6, v_id, 'I'),
      ('ring-mariah-size-6', 7, v_id, 'J'),
      ('ring-mariah-size-7', 8, v_id, 'K'),
      ('ring-mariah-size-8', 9, v_id, 'L'),
      ('ring-mariah-size-9', 10, v_id, 'M'),
      ('ring-mariah-size-10', 11, v_id, 'N'),
      ('ring-mariah-size-11', 12, v_id, 'O'),
      ('ring-mariah-size-12', 13, v_id, 'P'),
      ('ring-mariah-size-13', 14, v_id, 'Q'),
      ('ring-mariah-size-14', 15, v_id, 'R'),
      ('ring-mariah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-mariah-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-matisse',
    'Matisse',
    'Matisse - Emerald 4 Claw Solitaire with Bezel Frame Engagement Ring',
    'Designed to be worn low set, the Matisse is an emerald cut solitaire that blends vintage character with sculptural modern design for an effortlessly elevated silhouette that features a subtle under bezel frame and our signature eagle claws, offering the perfect balance for those torn between a bezel and a claw setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-matisse';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-matisse-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/matisse/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/matisse/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-matisse-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/matisse/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/matisse/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-matisse-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/matisse/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/matisse/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-matisse-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-matisse-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-matisse-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-matisse-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-matisse-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-matisse-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-matisse-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-matisse-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-matisse-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-matisse-size-0', 1, v_id, 'D'),
      ('ring-matisse-size-1', 2, v_id, 'E'),
      ('ring-matisse-size-2', 3, v_id, 'F'),
      ('ring-matisse-size-3', 4, v_id, 'G'),
      ('ring-matisse-size-4', 5, v_id, 'H'),
      ('ring-matisse-size-5', 6, v_id, 'I'),
      ('ring-matisse-size-6', 7, v_id, 'J'),
      ('ring-matisse-size-7', 8, v_id, 'K'),
      ('ring-matisse-size-8', 9, v_id, 'L'),
      ('ring-matisse-size-9', 10, v_id, 'M'),
      ('ring-matisse-size-10', 11, v_id, 'N'),
      ('ring-matisse-size-11', 12, v_id, 'O'),
      ('ring-matisse-size-12', 13, v_id, 'P'),
      ('ring-matisse-size-13', 14, v_id, 'Q'),
      ('ring-matisse-size-14', 15, v_id, 'R'),
      ('ring-matisse-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-matisse-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-meghan',
    'Meghan',
    'Meghan - Elongated Cushion 8 Double Claw Trilogy with Round Side Stones, Pave Band and Cathedral Setting Engagement Ring',
    'The Meghan engagement ring is an exact replica of the iconic engagement ring worn by Meghan Markle, featuring an elongated cushion cut centre stone neighboured by two round cut side stones and a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-meghan';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-meghan-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meghan/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meghan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-meghan-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meghan/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meghan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-meghan-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meghan/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meghan/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meghan-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-meghan-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-meghan-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-meghan-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meghan-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-meghan-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meghan-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-meghan-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-meghan-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-meghan-size-0', 1, v_id, 'D'),
      ('ring-meghan-size-1', 2, v_id, 'E'),
      ('ring-meghan-size-2', 3, v_id, 'F'),
      ('ring-meghan-size-3', 4, v_id, 'G'),
      ('ring-meghan-size-4', 5, v_id, 'H'),
      ('ring-meghan-size-5', 6, v_id, 'I'),
      ('ring-meghan-size-6', 7, v_id, 'J'),
      ('ring-meghan-size-7', 8, v_id, 'K'),
      ('ring-meghan-size-8', 9, v_id, 'L'),
      ('ring-meghan-size-9', 10, v_id, 'M'),
      ('ring-meghan-size-10', 11, v_id, 'N'),
      ('ring-meghan-size-11', 12, v_id, 'O'),
      ('ring-meghan-size-12', 13, v_id, 'P'),
      ('ring-meghan-size-13', 14, v_id, 'Q'),
      ('ring-meghan-size-14', 15, v_id, 'R'),
      ('ring-meghan-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-meghan-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-meesha',
    'Meesha',
    'Meesha - Oval Bezel Solitaire with Marquise-Round Shoulder Stones and Cathedral Setting Engagement Ring',
    'The Meesha design showcases a striking bezel-set oval cut centre stone accented by round and marquise cut stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-meesha';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-meesha-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meesha/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meesha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-meesha-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meesha/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meesha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-meesha-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meesha/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meesha/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meesha-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-meesha-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-meesha-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-meesha-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meesha-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-meesha-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meesha-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-meesha-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-meesha-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-meesha-size-0', 1, v_id, 'D'),
      ('ring-meesha-size-1', 2, v_id, 'E'),
      ('ring-meesha-size-2', 3, v_id, 'F'),
      ('ring-meesha-size-3', 4, v_id, 'G'),
      ('ring-meesha-size-4', 5, v_id, 'H'),
      ('ring-meesha-size-5', 6, v_id, 'I'),
      ('ring-meesha-size-6', 7, v_id, 'J'),
      ('ring-meesha-size-7', 8, v_id, 'K'),
      ('ring-meesha-size-8', 9, v_id, 'L'),
      ('ring-meesha-size-9', 10, v_id, 'M'),
      ('ring-meesha-size-10', 11, v_id, 'N'),
      ('ring-meesha-size-11', 12, v_id, 'O'),
      ('ring-meesha-size-12', 13, v_id, 'P'),
      ('ring-meesha-size-13', 14, v_id, 'Q'),
      ('ring-meesha-size-14', 15, v_id, 'R'),
      ('ring-meesha-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-meesha-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;