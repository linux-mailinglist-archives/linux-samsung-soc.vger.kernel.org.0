Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9457D4FED
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Oct 2023 14:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbjJXMi0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 24 Oct 2023 08:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233892AbjJXMiS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Oct 2023 08:38:18 -0400
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DA3120;
        Tue, 24 Oct 2023 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1698151093; x=1698410293;
        bh=XZn4U+TTmmXfZmr3fNPkxTzNFm221OIMLprzX82zvtw=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=oNxwDKRhxtt42QaAcTyAYHwRtM1V3u/HDLpwBoyvusemBTPl8V54NWoZF6Qfz4jRi
         T953H554aX+7y3N0XyL/dYMZtqLaBhrhMV+n11kLsHKUn6vQVlP/aIN2vRA2axbUKC
         qUMl77GgvDTe0hz8whcktcwiPCCJihMuO95tRFA8Am83WeQ5xRHyzBVUhIfKbUzA0K
         rVUSOtJJRMnA0OhG/SJN8bVYuDif/nFpHQnfHyJ5YiQ54AENho8NNvcZ787Fy7valD
         IGzbZnMCTAlrDQyRFkbA/qSKA4cdZKlc40QoxwfhdryNYbZLmhWj21d35ZbXi08dKx
         2mI0c0D5/Js+Q==
Date:   Tue, 24 Oct 2023 12:37:26 +0000
To:     krzysztof.kozlowski@linaro.org
From:   Raymond Hackley <raymondhackley@protonmail.com>
Cc:     alim.akhtar@samsung.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, raymondhackley@protonmail.com,
        robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/2] ARM: dts: samsung: exynos4412-midas: fix key-ok event code
Message-ID: <20231024123415.2009-1-raymondhackley@protonmail.com>
In-Reply-To: <bc5bbf47-7bcb-4fc6-a88b-b92d74803a7a@linaro.org>
References: <20231017101402.62740-1-raymondhackley@protonmail.com> <20231017101636.62755-1-raymondhackley@protonmail.com> <bc5bbf47-7bcb-4fc6-a88b-b92d74803a7a@linaro.org>
Feedback-ID: 49437091:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

This key-ok is the hardware middle button on midas, and there is also
touchkey, which already provides <KEY_BACK KEY_MENU>, so I assume the other
KEY_MENU in key-ok is duplicated. Fixing it with KEY_OK as the node name
implies would make more sense.

Regards,
Raymond

