Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F40D242663
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Aug 2020 09:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgHLHzJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 12 Aug 2020 03:55:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:36684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbgHLHzI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 03:55:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24422206B5;
        Wed, 12 Aug 2020 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597218908;
        bh=P6v+unw8+Cq8ugJxHQzeI6KhK1z9BDyKTl+itDIq89k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eOxt9MNuhj1cKk0d5xTG90fjv0Ctty4ZGqOeO2Uh8PQvh/gnvfwuoW182bRg4EhJx
         FQBDOXTBDiSwUYMd0LkjiKTbvaeBUQ0tKBnrBuZgzho8dt4Pjd+ybugBmm+8dR20uS
         PHHnlfiCpdWDRX9zIYK6HhKBPLdPuD54Vw9CGdXU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200806182059.2431-6-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org> <20200806182059.2431-6-krzk@kernel.org>
Subject: Re: [PATCH v2 06/41] ARM: s3c24xx: pass pointer to clk driver via platform data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
To:     Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Date:   Wed, 12 Aug 2020 00:55:07 -0700
Message-ID: <159721890703.33733.8378221902467604348@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-08-06 11:20:23)
> Passing pointers directly as platform data is fragile and undocumented.
> Better to create a platform data structure which explicitly documents
> what is passed to the driver.
>=20
> Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> [krzk: Update maintainer's entry]
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
> ---

Ok.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
