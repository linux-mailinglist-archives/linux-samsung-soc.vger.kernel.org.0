Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73D42C0033
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Nov 2020 07:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgKWGpd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Nov 2020 01:45:33 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:58707 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgKWGpd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 01:45:33 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201123064528epoutp04a7dc92cfee9f1b30a30fbab5911883af~KEBvHkobF2387023870epoutp04K
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2020 06:45:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201123064528epoutp04a7dc92cfee9f1b30a30fbab5911883af~KEBvHkobF2387023870epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606113928;
        bh=I0U092CDwXoviOYxf2YYvubgJPKMhqJc2nqxTG/RXRc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=BF29P0/KV7cEgE6l2vfDlvut9/IFR3VvPGh61N0764SZJHhTTHq1Vuro22CCK9ouO
         /pGQwoZyoD5KGkUZUgrPoPklPCuGwZVU8IIuI+Sp/uogxUfHmI4BqgzYDyizfGYsXe
         auwd1h0iSoDQhyM619kWS0M/ICZQre7Rq4pb/qZ8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20201123064528epcas1p4f57e91f5292f1f456fbe22307e561015~KEBumWQMc1365213652epcas1p4X;
        Mon, 23 Nov 2020 06:45:28 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.153]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Cfd2F0qy6zMqYkb; Mon, 23 Nov
        2020 06:45:25 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        0E.BD.09577.48A5BBF5; Mon, 23 Nov 2020 15:45:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20201123064524epcas1p3b554aa626f05f77fc998072d90f23033~KEBq9llD_1164311643epcas1p3t;
        Mon, 23 Nov 2020 06:45:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201123064524epsmtrp17ef0c144f615abde7c01b039bdf58591~KEBq8uBvI1981819818epsmtrp1Q;
        Mon, 23 Nov 2020 06:45:24 +0000 (GMT)
X-AuditID: b6c32a39-c13ff70000002569-8b-5fbb5a84bafb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        AE.FC.13470.38A5BBF5; Mon, 23 Nov 2020 15:45:23 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201123064523epsmtip28ae4895a3d174ec429ccd5a71527b6e7~KEBql0n831760317603epsmtip2c;
        Mon, 23 Nov 2020 06:45:23 +0000 (GMT)
Subject: Re: [PATCH v9 0/5] Exynos: Simple QoS for exynos-bus using
 interconnect
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        georgi.djakov@linaro.org, inki.dae@samsung.com
Cc:     krzk@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
        a.swigon@samsung.com, myungjoo.ham@samsung.com,
        sw0312.kim@samsung.com, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <81c97cb7-faf3-0e03-85a1-75093058d68e@samsung.com>
Date:   Mon, 23 Nov 2020 15:59:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201112140931.31139-1-s.nawrocki@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUwTZxzH99y114ON7VZ1PDaZg1OygAI9oHooMLMx16W6kL2QzGUpN7hR
        Qt/WF+NgDsmoAjqkkswOQQyMjUEJozAKKHTQCoKLNEGYogwS3KYF1LVC3HRuPQ4z/vs8z+/7
        e/k+LzgqvohJ8DytiTVoGTWJhQq63NHxsSX7zyml5x7vpGfOWADdbmsT0nWey0L6ytJdjD7V
        58DokzOVAnps7AcR7ZibFNLjvTUYHfjSA2jbWD9Ct3qmRfT14iaMtvR5RLR74aiQtlXdxnYT
        ckdzGSa/MXkek88cG0bkHd8UySs6m4E84NiUge3PT1GxTA5riGC12bqcPG1uKql4R/maUrZd
        SsVSyfQOMkLLaNhUMn1vRuyePHVwbjLiAKM2B7cyGKORjE9LMejMJjZCpTOaUklWn6PWJ+vj
        jIzGaNbmxmXrNDspqTRBFhRm5avKiu+j+stxB0cvjQsOA3dUOQjBIZEE/6o/IygHobiY6AbQ
        sdwg4gJiwg9gnV/IB5YBrHf60ScZHceGVjP6AHzYcQXhF3cBvOT8Wcip1hFvQ+uMJ1gKx9cT
        DPT3fMxpUGIege5rYwinwYgY6Lp1FeP4OSISTjyYAxyHEWnw+o35FRYQUXDufuOKfgORCUe6
        SlY1z8ORr28KOA4hUmDtb5aVOigRDqdu1iE8vwSdizWrU9/CoatdzXM6rG31iXheB33Dnass
        gbdPHFnlQvj9iAfjhoZEKYCdLq+QDyRCV2MVwhlDiWjY1hvPb0fCnoe1gO/7LLyzdFzISSAR
        BkuPiHnJZjg+O43wvBE2HC3DKgFZvcZN9RoH1WscVP/f7CwQNIMXWL1Rk8saKb1s7WU7wMqT
        jknuBqcW78UNAgQHgwDiKLk+zLKpRykOy2E+LWANOqXBrGaNg0AWPF8rKtmQrQv+Ca1JSckS
        EhMT6SRqu4yiyPCwR1tLlWIilzGx+SyrZw1P8hA8RHIYEdk3Lk78uEuleirPpZy62v3HolSo
        +SBj/t/6fWjA/rr33WjJowu+0aH8QJrJhkoUqo+K2iparZZteYaW2P6G2unA6eFS+SeTX3ha
        Cm1L7w3kKKZH3a22v78tJJdt1dSr5k5punlecmi00XC+wJde9cvpfmfJ1gebz54ES4rKFyNd
        dWok0z+wZZtoLlzxe/bUnePqgPNa5kAGW1JZ6G5qKsqyxhXMzr5xcKhiT9lX955Ocu57Of6n
        Kt+OVEkL9c/7Fy8U7/XO5yer36yJnFwo/5Um7FbzK8Jn3gp8NpHVldS0S/Xdn/Yt9Qvez9MU
        cl+Cr/dx1yHfh/bdUe3e9vIDoc12UmBUMVQMajAy/wFSDQe2WwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsWy7bCSvG5z1O54g+6fNhb357UyWmycsZ7V
        Yv6Rc6wWV76+Z7OYvncTm8Wk+xNYLM6f38BusenxNVaLy7vmsFl87j3CaDHj/D4mi7VH7rJb
        3G5cwWbRuvcIu8XhN+2sFjMmv2RzEPDYtKqTzePOtT1sHve7jzN5bF5S79G3ZRWjx+dNcgFs
        UVw2Kak5mWWpRfp2CVwZnY1fmAvO6VWcOn2ZpYHxsGoXIyeHhICJxObuYyxdjFwcQgK7GSU2
        fbnOBJGQlJh28ShzFyMHkC0scfhwMUTNW0aJm5cbWEBqhAWCJCbeP8IOYosIJEo8XPefGaSI
        WeA1k8Scid/ZITr6GSV2NxwB62AT0JLY/+IGG4jNL6AocfXHY0YQm1fATuL2nddgNouAqsTj
        L0vBrhAVCJPYueQxE0SNoMTJmU/A5nAK2EjMfdoKNodZQF3iz7xLzBC2uMStJ/OZIGx5ie1v
        5zBPYBSehaR9FpKWWUhaZiFpWcDIsopRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzhm
        tTR3MG5f9UHvECMTB+MhRgkOZiUR3la5nfFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeW8ULowT
        EkhPLEnNTk0tSC2CyTJxcEo1MC3P37nZ7qfsCcutD2yu1YlfjimfIXPUTyfv6Oct33a+0eR+
        8abh3JZGj/9RnQ1TTArfpmx9+GqRtXnM0j3/I/8KbbhydeUi8Wu1kzXbd7OtW11rmBDxsHr/
        ow82h2cd1inUjwieFLRhUZSyyrbIK20ZqtXybUuOSwr6xplO5uhqNuz5Iij67YZP8M/tczSL
        evKEliZyR3wK1l72/6Ct/uyvs3Xm/OlsfGWh/cJ5Wcle/iyt8imnSuKXCDDcelAot59Xu5zL
        zbdpcve3jj0TPJRFjZR0M2wL83hmfzCaGrKq48d/7h1Xs5ccXbpM7t/Z7Q7bY+2XBej+trjg
        ttTqUGr9y3luT+TufdTQVS7mklZiKc5INNRiLipOBAAKUUH0SAMAAA==
X-CMS-MailID: 20201123064524epcas1p3b554aa626f05f77fc998072d90f23033
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c
References: <CGME20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c@eucas1p1.samsung.com>
        <20201112140931.31139-1-s.nawrocki@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On 11/12/20 11:09 PM, Sylwester Nawrocki wrote:
> 
> This patchset adds interconnect API support for the Exynos SoC "samsung,
> exynos-bus" compatible devices, which already have their corresponding
> exynos-bus driver in the devfreq subsystem.  Complementing the devfreq
> driver with an interconnect functionality allows to ensure the QoS
> requirements of devices accessing the system memory (e.g. video processing
> devices) are fulfilled and allows to avoid issues like the one discussed
> in thread [1].
> 
> This patch series adds implementation of the interconnect provider per each
> "samsung,exynos-bus" compatible DT node, with one interconnect node per
> provider.  The interconnect code which was previously added as a part of
> the devfreq driver has been converted to a separate platform driver.
> In the devfreq a corresponding virtual child platform device is registered.
> Integration of devfreq and interconnect frameworks is achieved through
> the PM QoS API.
> 
> A sample interconnect consumer for exynos-mixer is added in patch 5/5,
> it is currently added only for exynos4412 and allows to address the
> mixer DMA underrun error issues [1].
> 
> Changes since v8:
>  - excluded from the series already applied dts patches, 
>  - Co-developed-by/Signed-off-by tag corrections, Ack tags added,
>  - the maintainers entry corrections adressing review comments,
>  - Kconfig/Makefile improvements/corrections,
>  - whitespace/indentation cleanup.
> 
> The series has been tested on Odroid U3 board. It is based on v5.10-rc1.
> 
> --
> Regards,
> Sylwester
> 
> Changes since v7:
>  - drivers/interconnect/exynos renamed to drivers/interconnect/samsung,
>  - added INTERCONNECT_SAMSUNG Kconfig symbol,
>  - added missing driver sync_state callback,
>  - improved the DT binding description,
>  - added a patch adding maintainers entry,
>  - updated comment in patch 7/7, typo fix (patch 1/7).
> 
> Changes since v6:
>  - the interconnect consumer DT bindings are now used to describe dependencies
>    of the interconnects (samsung,exynos-bus nodes),
>  - bus-width property replaced with samsung,data-clk-ratio,
>  - adaptation to recent changes in the interconnect code
>    (of_icc_get_from_provider(), icc_node_add()).
> 
> Changes since v5:
>  - addition of "bus-width: DT property, which specifies data width
>    of the interconnect bus (patches 1...2/6),
>  - addition of synchronization of the interconnect bandwidth setting
>    with VSYNC (patch 6/6).
> 
> Changes since v3 [4] (v4 skipped to align with patchset [1]), detailed
> changes are listed in patches:
>  - conversion to a separate interconnect (platform) driver,
>  - an update of the DT binding documenting new optional properties:
>    #interconnect-cells, samsung,interconnect-parent in "samsung,exynos-bus"
>    nodes,
>  - new DT properties added to the SoC, rather than to the board specific
>    files.
> 
> Changes since v2 [5]:
>  - Use icc_std_aggregate().
>  - Implement a different modification of apply_constraints() in
>    drivers/interconnect/core.c (patch 03).
>  - Use 'exynos,interconnect-parent-node' in the DT instead of
>    'devfreq'/'parent', depending on the bus.
>  - Rebase on DT patches that deprecate the 'devfreq' DT property.
>  - Improve error handling, including freeing generated IDs on failure.
>  - Remove exynos_bus_icc_connect() and add exynos_bus_icc_get_parent().
> 
> Changes since v1 [6]:
>  - Rebase on coupled regulators patches.
>  - Use dev_pm_qos_*() API instead of overriding frequency in
>    exynos_bus_target().
>  - Use IDR for node ID allocation.
>  - Reverse order of multiplication and division in
>    mixer_set_memory_bandwidth() (patch 07) to avoid integer overflow.
> 
> 
> References:
> [1] https://patchwork.kernel.org/patch/10861757/ (original issue)
> [2] https://protect2.fireeye.com/v1/url?k=0c5b42ec-53c07bee-0c5ac9a3-0cc47a31381a-25eb9fb6f0f852e5&q=1&e=3074012f-8e28-49a9-9773-669dbeefe1a6&u=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-samsung-soc%2Fmsg70014.html
> [3] https://protect2.fireeye.com/v1/url?k=f3fdf673-ac66cf71-f3fc7d3c-0cc47a31381a-8ab39522e9fe68a8&q=1&e=3074012f-8e28-49a9-9773-669dbeefe1a6&u=https%3A%2F%2Fwww.spinics.net%2Flists%2Farm-kernel%2Fmsg810722.html
> [4] https://lore.kernel.org/linux-pm/20191220115653.6487-1-a.swigon@samsung.com
> [5] https://patchwork.kernel.org/cover/11054417/ (v1 of this RFC)
> [6] https://patchwork.kernel.org/cover/11152595/ (v2 of this RFC)
> 
> 
> Sylwester Nawrocki (5):
>   dt-bindings: devfreq: Add documentation for the interconnect
>     properties
>   interconnect: Add generic interconnect driver for Exynos SoCs
>   MAINTAINERS: Add entry for Samsung interconnect drivers
>   PM / devfreq: exynos-bus: Add registration of interconnect child
>     device
>   drm: exynos: mixer: Add interconnect support
> 
>  .../devicetree/bindings/devfreq/exynos-bus.txt     |  71 +++++++-
>  MAINTAINERS                                        |   8 +
>  drivers/devfreq/exynos-bus.c                       |  17 ++
>  drivers/gpu/drm/exynos/exynos_mixer.c              | 146 ++++++++++++++-
>  drivers/interconnect/Kconfig                       |   1 +
>  drivers/interconnect/Makefile                      |   1 +
>  drivers/interconnect/samsung/Kconfig               |  13 ++
>  drivers/interconnect/samsung/Makefile              |   4 +
>  drivers/interconnect/samsung/exynos.c              | 199 +++++++++++++++++++++
>  9 files changed, 450 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/interconnect/samsung/Kconfig
>  create mode 100644 drivers/interconnect/samsung/Makefile
>  create mode 100644 drivers/interconnect/samsung/exynos.c
> 

I checked that the icc patches were merged to icc.git.
So, I applied patch1 and patch4 to devfreq.git.


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
