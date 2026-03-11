DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-kate',
    'Kate',
    'Kate - Emerald 4 Claw Solitaire with Cigar Band and Hidden Halo Engagement Ring',
    'Kate showcases a sophisticated 4-claw emerald solitaire, sparkling hidden halo and thick cigar band. Kate is available in both high and low setting heights. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kate';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kate-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kate/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kate/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kate-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kate/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kate/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kate-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kate/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kate/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kate-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kate-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kate-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kate-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kate-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kate-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kate-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kate-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kate-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kate-size-0', 1, v_id, 'D'),
      ('ring-kate-size-1', 2, v_id, 'E'),
      ('ring-kate-size-2', 3, v_id, 'F'),
      ('ring-kate-size-3', 4, v_id, 'G'),
      ('ring-kate-size-4', 5, v_id, 'H'),
      ('ring-kate-size-5', 6, v_id, 'I'),
      ('ring-kate-size-6', 7, v_id, 'J'),
      ('ring-kate-size-7', 8, v_id, 'K'),
      ('ring-kate-size-8', 9, v_id, 'L'),
      ('ring-kate-size-9', 10, v_id, 'M'),
      ('ring-kate-size-10', 11, v_id, 'N'),
      ('ring-kate-size-11', 12, v_id, 'O'),
      ('ring-kate-size-12', 13, v_id, 'P'),
      ('ring-kate-size-13', 14, v_id, 'Q'),
      ('ring-kate-size-14', 15, v_id, 'R'),
      ('ring-kate-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kate-specs',
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
    'ring-kelsey',
    'Kelsey',
    'Kelsey - Elongated Cushion 4 Claw Solitaire with Cathedral Setting and Open Trellis Gallery Engagement Ring',
    'The timeless 4-claw elongated cushion solitaire design is elevated in the Kelsey engagement ring with a romantic woven trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kelsey';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kelsey-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kelsey/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kelsey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kelsey-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kelsey/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kelsey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kelsey-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kelsey/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kelsey/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kelsey-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kelsey-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kelsey-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kelsey-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kelsey-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kelsey-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kelsey-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kelsey-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kelsey-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kelsey-size-0', 1, v_id, 'D'),
      ('ring-kelsey-size-1', 2, v_id, 'E'),
      ('ring-kelsey-size-2', 3, v_id, 'F'),
      ('ring-kelsey-size-3', 4, v_id, 'G'),
      ('ring-kelsey-size-4', 5, v_id, 'H'),
      ('ring-kelsey-size-5', 6, v_id, 'I'),
      ('ring-kelsey-size-6', 7, v_id, 'J'),
      ('ring-kelsey-size-7', 8, v_id, 'K'),
      ('ring-kelsey-size-8', 9, v_id, 'L'),
      ('ring-kelsey-size-9', 10, v_id, 'M'),
      ('ring-kelsey-size-10', 11, v_id, 'N'),
      ('ring-kelsey-size-11', 12, v_id, 'O'),
      ('ring-kelsey-size-12', 13, v_id, 'P'),
      ('ring-kelsey-size-13', 14, v_id, 'Q'),
      ('ring-kelsey-size-14', 15, v_id, 'R'),
      ('ring-kelsey-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kelsey-specs',
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
    'ring-kiana',
    'Kiana',
    'Kiana - Oval 4 Claw Solitaire with Hidden Halo and Floating Cathedral Low Setting Engagement Ring',
    'Kiana is a modern solitaire that doesn''t ask you to choose between beauty and practicality. Featuring a low-set oval centre stone, its open bridge and hidden halo create a graceful floating effect, allowing the design to sit low on the finger while pairing seamlessly flush with a matching wedding band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kiana';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kiana-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kiana/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kiana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kiana-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kiana/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kiana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kiana-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kiana/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kiana/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kiana-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kiana-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kiana-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kiana-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kiana-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kiana-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kiana-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kiana-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kiana-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kiana-size-0', 1, v_id, 'D'),
      ('ring-kiana-size-1', 2, v_id, 'E'),
      ('ring-kiana-size-2', 3, v_id, 'F'),
      ('ring-kiana-size-3', 4, v_id, 'G'),
      ('ring-kiana-size-4', 5, v_id, 'H'),
      ('ring-kiana-size-5', 6, v_id, 'I'),
      ('ring-kiana-size-6', 7, v_id, 'J'),
      ('ring-kiana-size-7', 8, v_id, 'K'),
      ('ring-kiana-size-8', 9, v_id, 'L'),
      ('ring-kiana-size-9', 10, v_id, 'M'),
      ('ring-kiana-size-10', 11, v_id, 'N'),
      ('ring-kiana-size-11', 12, v_id, 'O'),
      ('ring-kiana-size-12', 13, v_id, 'P'),
      ('ring-kiana-size-13', 14, v_id, 'Q'),
      ('ring-kiana-size-14', 15, v_id, 'R'),
      ('ring-kiana-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kiana-specs',
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
    'ring-kimia',
    'Kimia',
    'Kimia - Round 4 Claw Solitaire with Bypass Band Engagement Ring',
    'Kimia centres a round stone in a refined four-claw setting, supported by a gently twisting bypass band. Soft curves wrap around the basket, creating a light, contemporary silhouette with sculptural balance. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kimia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kimia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kimia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kimia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kimia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kimia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kimia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kimia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kimia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kimia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kimia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kimia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kimia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kimia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kimia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kimia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kimia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kimia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kimia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kimia-size-0', 1, v_id, 'D'),
      ('ring-kimia-size-1', 2, v_id, 'E'),
      ('ring-kimia-size-2', 3, v_id, 'F'),
      ('ring-kimia-size-3', 4, v_id, 'G'),
      ('ring-kimia-size-4', 5, v_id, 'H'),
      ('ring-kimia-size-5', 6, v_id, 'I'),
      ('ring-kimia-size-6', 7, v_id, 'J'),
      ('ring-kimia-size-7', 8, v_id, 'K'),
      ('ring-kimia-size-8', 9, v_id, 'L'),
      ('ring-kimia-size-9', 10, v_id, 'M'),
      ('ring-kimia-size-10', 11, v_id, 'N'),
      ('ring-kimia-size-11', 12, v_id, 'O'),
      ('ring-kimia-size-12', 13, v_id, 'P'),
      ('ring-kimia-size-13', 14, v_id, 'Q'),
      ('ring-kimia-size-14', 15, v_id, 'R'),
      ('ring-kimia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kimia-specs',
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
    'ring-kirsten',
    'Kirsten',
    'Kirsten - Pear 6 Claw Solitaire with Pave Band and Halo and Low Setting Engagement Ring',
    'The Kirsten engagement ring is a glamourous 6-claw pear halo design with low-set basket setting and sparkling half pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kirsten';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kirsten-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kirsten/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kirsten/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kirsten-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kirsten/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kirsten/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kirsten-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kirsten/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kirsten/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kirsten-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kirsten-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kirsten-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kirsten-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kirsten-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kirsten-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kirsten-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kirsten-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kirsten-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kirsten-size-0', 1, v_id, 'D'),
      ('ring-kirsten-size-1', 2, v_id, 'E'),
      ('ring-kirsten-size-2', 3, v_id, 'F'),
      ('ring-kirsten-size-3', 4, v_id, 'G'),
      ('ring-kirsten-size-4', 5, v_id, 'H'),
      ('ring-kirsten-size-5', 6, v_id, 'I'),
      ('ring-kirsten-size-6', 7, v_id, 'J'),
      ('ring-kirsten-size-7', 8, v_id, 'K'),
      ('ring-kirsten-size-8', 9, v_id, 'L'),
      ('ring-kirsten-size-9', 10, v_id, 'M'),
      ('ring-kirsten-size-10', 11, v_id, 'N'),
      ('ring-kirsten-size-11', 12, v_id, 'O'),
      ('ring-kirsten-size-12', 13, v_id, 'P'),
      ('ring-kirsten-size-13', 14, v_id, 'Q'),
      ('ring-kirsten-size-14', 15, v_id, 'R'),
      ('ring-kirsten-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kirsten-specs',
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