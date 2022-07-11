Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B230755FCDA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Jun 2022 12:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiF2KIV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 29 Jun 2022 06:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbiF2KIT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 06:08:19 -0400
X-Greylist: delayed 1160 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Jun 2022 03:08:18 PDT
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net [87.98.172.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729661CE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 03:08:17 -0700 (PDT)
Received: from player789.ha.ovh.net (unknown [10.110.103.211])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id B378D22E90
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 09:48:55 +0000 (UTC)
Received: from etezian.org (bbcs-175-223.cust.wingo.ch [178.238.175.223])
        (Authenticated sender: andi@etezian.org)
        by player789.ha.ovh.net (Postfix) with ESMTPSA id 05D3E2C1D9875;
        Wed, 29 Jun 2022 09:48:44 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-100R00388997ff5-7013-4990-ac9c-20a2d1c25445,
                    27473AD2557E96BAE247B01472F11916F8881100) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.175.223
Date:   Wed, 29 Jun 2022 12:48:43 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] spi: s3c64xx: add spi port configuration for
 Exynos Auto v9 SoC
Message-ID: <Yrwf+25oliMGg9hz@jack.zhora.eu>
References: <20220628044222.152794-1-chanho61.park@samsung.com>
 <CGME20220628044432epcas2p2e2b4c0d52f11c0bf543c537e819224bc@epcas2p2.samsung.com>
 <20220628044222.152794-5-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044222.152794-5-chanho61.park@samsung.com>
X-Ovh-Tracer-Id: 2307813338288949784
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpeejgfelgeekieffjeegveeuvdehgeelveetveejudffvedvleehvdefleehudelueenucfkpheptddrtddrtddrtddpudejkedrvdefkedrudejhedrvddvfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeekledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhsrghmshhunhhgqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedt
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Chanho,

On Tue, Jun 28, 2022 at 01:42:22PM +0900, Chanho Park wrote:
> Add exynosautov9 spi port configuration. It supports up to 12 spis so
> MAX_SPI_PORTS should be increased from 6 to 12.
> It has DIV_4 as the default internal clock divider and an internal
> loopback mode to run a loopback test.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi
