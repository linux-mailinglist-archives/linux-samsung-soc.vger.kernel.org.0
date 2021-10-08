Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933CC42619C
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  8 Oct 2021 03:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhJHBOu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 7 Oct 2021 21:14:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230156AbhJHBOu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 21:14:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D844F6120C;
        Fri,  8 Oct 2021 01:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633655575;
        bh=z7lw/oarDgJeAdFRkuApXzkQK/1CKC2C1T2gfDGbCLg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rQPWiLw2cCMlvoz0b2t9Mg5/7yHgMoUHNChODTwyVyNlBJLEukF5mCpKXfRZbeIOC
         AzKCngxpEHWYnNHhkTXg2JYiAOpfnma7QC70nKHbcAZzpv22GjcjntJEqI+DlZMuQ8
         iUnuM/HRfRFbVbsGIjInwAJzHjBpJ6otfZBrH13JD6hRQBJulKHAsJXT5q6AdP4R2C
         Y5ST2S5avHBYDcDccCspP1gJ0KQ+T7Uh6tjMS9IyNgETU0U2iQ1qEsgCUAMTvh/lA7
         P1cct9WuvqDyDZ9xx4+n+eB8j2WcjpC7fYw0Wc65O1cva8d8glBVu+fGuWwepRpDqm
         ZX6oz47q69sTA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211006132324.76008-4-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com> <20211006132324.76008-4-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: clock: samsung,s2mps11: convert to dtschema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date:   Thu, 07 Oct 2021 18:12:54 -0700
Message-ID: <163365557460.2041162.5688299364943292354@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-10-06 06:23:17)
> Convert the clock provider of Samsung S2MPS11 family of PMICs to DT
> schema format.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
