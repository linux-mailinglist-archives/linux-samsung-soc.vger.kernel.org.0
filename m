Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9024610902A
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Nov 2019 15:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfKYOjf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 25 Nov 2019 09:39:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:55138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728206AbfKYOjf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 Nov 2019 09:39:35 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63BA920679;
        Mon, 25 Nov 2019 14:39:33 +0000 (UTC)
Date:   Mon, 25 Nov 2019 09:39:32 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Kusanagi Kouichi <slash@ac.auone-net.jp>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm: exynos_config: Restore debugfs support
Message-ID: <20191125093932.4a111dc8@gandalf.local.home>
In-Reply-To: <7f6a5924-58f9-aafb-18c5-c749ad355a02@samsung.com>
References: <CGME20191125125531eucas1p17f4044301903eeafe56865ed63738798@eucas1p1.samsung.com>
        <20191125125515.30795-1-m.szyprowski@samsung.com>
        <7f6a5924-58f9-aafb-18c5-c749ad355a02@samsung.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 25 Nov 2019 15:30:39 +0100
Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com> wrote:

> It seems that commit 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS
> dependency") disabled DEBUG_FS also in some other ARM defconfigs.
> 
> For some of them it may be a correct change but a preferred way to
> introduce such changes would be to:
> 
> - add explicit CONFIG_DEBUG_FS=y instances to all affected defconfigs
>   while removing DEBUG_FS selection from TRACING config item
> 

I strongly disagree. It was wrong to assume DEBUG_FS is attached to
TRACING. If someone wanted DEBUG_FS in their def config, they should
have added it specifically. The addition of DEBUG_FS to defconfigs no
way belongs to the patch that removed DEBUG_FS from TRACING.

-- Steve


> - let platform maintainers disable DEBUG_FS manually in corresponding
>   defconfigs later if desirable

