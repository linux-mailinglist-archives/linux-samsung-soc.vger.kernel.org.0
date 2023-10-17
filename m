Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3602C7CC0A0
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 17 Oct 2023 12:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbjJQK0F (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 17 Oct 2023 06:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbjJQKZ6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 06:25:58 -0400
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C682D7C;
        Tue, 17 Oct 2023 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1697537940; x=1697797140;
        bh=SzTv8Fcb4hwq7Dtnm5h/o3jhzCSwX34AJg/3WWk7Qz8=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=JSKHE33tKsGkZ6lMXp/H2d9fFMgePevjoGa4ZaS84a5v6sHiczcXQ/lMI8uCxtsu2
         ngKHyIz7B+5d8sOXb0b7XpOlAsC04zfNeT75vJE3dKP+Pg6s1hcr2xDTJnzn3yua6+
         U5t4hfmdlLtuCdwhaZ6hBUTZpHdTKyYTjDKFBYxPbxQ8UJ953VhDxOT2smwR5sMhiT
         1A/PRAUQ4VxnpTxUWE6LwNSn1I6EHgC5yPpHuEzwUQQO4iWeFo13ylHF7rGgG9+P7B
         mA2MifJ03pLNb6XOwDp534vVKais67TDCaYo4M4qp4aYp96AJXA4uHNlEYZ0hll3Z5
         uyxutOH9h97jQ==
Date:   Tue, 17 Oct 2023 10:18:04 +0000
To:     linux-kernel@vger.kernel.org
From:   Raymond Hackley <raymondhackley@protonmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH v2 1/2] ARM: dts: samsung: exynos4412-midas: fix key-ok event code
Message-ID: <20231017101636.62755-1-raymondhackley@protonmail.com>
In-Reply-To: <20231017101402.62740-1-raymondhackley@protonmail.com>
References: <20231017101402.62740-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Input event code 139 stands for KEY_MENU, instead of KEY_OK as node name
key-ok inplies. Fix it with correct event code 0x160.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boo=
t/dts/samsung/exynos4412-midas.dtsi
index 7daf25865551..3c1ae3c19828 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -159,7 +159,7 @@ key-power {
=20
 =09=09key-ok {
 =09=09=09gpios =3D <&gpx0 1 GPIO_ACTIVE_LOW>;
-=09=09=09linux,code =3D <139>;
+=09=09=09linux,code =3D <0x160>;
 =09=09=09label =3D "ok";
 =09=09=09debounce-interval =3D <10>;
 =09=09=09wakeup-source;
--=20
2.39.2


