Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C2EDA252
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Oct 2019 01:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439011AbfJPXeX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 16 Oct 2019 19:34:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728302AbfJPXeX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 19:34:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCA782168B;
        Wed, 16 Oct 2019 23:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571268862;
        bh=vteasG9t82lTuUd1FLxsGGoHzxtVjFCukWZwh1O1yTw=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=IJCEHxCyF/QrZcX1ouR2Xs87dz0bNKCt5dCEU2dtoyrONT+mSIiaEMnpeI3tAKWnd
         PvioMJG9hafa5yrkztUz0Emnqt23HrRJl78oroPpPjm3trt2MeRsBm0ofYHYE2jv8p
         2+zO2yQ8jmca61oU2cjWsnjZ2Enjzkypu/J18af8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191015142424.25944-1-yuehaibing@huawei.com>
References: <20191015142424.25944-1-yuehaibing@huawei.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>, cw00.choi@samsung.com,
        kgene@kernel.org, krzk@kernel.org, mturquette@baylibre.com,
        s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] clk: s3c2410: use devm_platform_ioremap_resource() to simplify code
User-Agent: alot/0.8.1
Date:   Wed, 16 Oct 2019 16:34:22 -0700
Message-Id: <20191016233422.CCA782168B@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting YueHaibing (2019-10-15 07:24:24)
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next

