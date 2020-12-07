Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415CA2D18AF
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Dec 2020 19:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgLGSmK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Dec 2020 13:42:10 -0500
Received: from mleia.com ([178.79.152.223]:53004 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbgLGSmJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 13:42:09 -0500
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 0071C421B3E;
        Mon,  7 Dec 2020 18:41:28 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: crypto: s5p-sss: drop Kamil Konieczny
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20201207165521.125129-1-krzk@kernel.org>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <58282ed8-18f1-08f4-444a-61f9aa7385e3@mleia.com>
Date:   Mon, 7 Dec 2020 20:41:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207165521.125129-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20201207_184128_023883_52516CEB 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message. 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/7/20 6:55 PM, Krzysztof Kozlowski wrote:
> E-mails to Kamil Konieczny to his Samsung address bounce with 550 (User
> unknown).  Kamil no longer takes care about Samsung S5P SSS driver so
> remove the invalid email address from:
>   - mailmap,
>   - bindings maintainer entries,
>   - maintainers entry for S5P Security Subsystem crypto accelerator.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
