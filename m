Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C659128B3F
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 21 Dec 2019 20:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfLUTyL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 21 Dec 2019 14:54:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:35990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbfLUTyL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Dec 2019 14:54:11 -0500
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF1F22070C;
        Sat, 21 Dec 2019 19:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576958050;
        bh=3mvIp7eCgLyIgK3WlQH2he9am3EJW5RwfOxvQvZgdQg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B391l5osAlZ5SHO53Qp5utmrFhMkaaWLzybm7nhAAvfonipqlqYeqpDr1hlOeslMd
         1YO6IshupLISWoe6WVamFvNJtmbIz5AJWZ6ppXMIzpzoytK2kTOXsBqf6oEzFewu1U
         zGJOrQ/ifjZqGLdrlSIM3BpeNW5vCYNOmShBHo/c=
Received: by mail-lf1-f48.google.com with SMTP id n12so9644560lfe.3;
        Sat, 21 Dec 2019 11:54:09 -0800 (PST)
X-Gm-Message-State: APjAAAXrJjKhQ47ZPp745o2XZbnjrHdsZaqpjEqi6pgCNquUukJt0kGA
        VtR4Wo1XhiPp2I9EkuYbiq/JoMr9+8N8u3WKc3c=
X-Google-Smtp-Source: APXvYqyuxa6OGfJkXcrWQ9dn2GfMjOFQrnG53Uc8++kOXDZUm7kXUGyZziVIKkCNJaMpvwFgSgYrK0m9/y2baLAXPHI=
X-Received: by 2002:ac2:5498:: with SMTP id t24mr12216807lfk.84.1576958047872;
 Sat, 21 Dec 2019 11:54:07 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191220120145eucas1p295af63eed7b23982d8c49fcf875cec8c@eucas1p2.samsung.com>
 <20191220115653.6487-1-a.swigon@samsung.com> <20191220115653.6487-6-a.swigon@samsung.com>
In-Reply-To: <20191220115653.6487-6-a.swigon@samsung.com>
From:   Chanwoo Choi <chanwoo@kernel.org>
Date:   Sun, 22 Dec 2019 04:53:31 +0900
X-Gmail-Original-Message-ID: <CAGTfZH0M5yJ3e2mEEc6XE89zV1289C6FvhqVEcuBdi2OgeMtig@mail.gmail.com>
Message-ID: <CAGTfZH0M5yJ3e2mEEc6XE89zV1289C6FvhqVEcuBdi2OgeMtig@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/7] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
To:     =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>, inki.dae@samsung.com,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Fri, Dec 20, 2019 at 9:02 PM Artur =C5=9Awigo=C5=84 <a.swigon@samsung.co=
m> wrote:
>
> This patch adds interconnect functionality to the exynos-bus devfreq
> driver.
>
> The SoC topology is a graph (or, more specifically, a tree) and its
> edges are specified using the 'exynos,interconnect-parent-node' in the
> DT. Due to unspecified relative probing order, -EPROBE_DEFER may be
> propagated to ensure that the parent is probed before its children.
>
> Each bus is now an interconnect provider and an interconnect node as well
> (cf. Documentation/interconnect/interconnect.rst), i.e. every bus registe=
rs
> itself as a node. Node IDs are not hardcoded but rather assigned at
> runtime, in probing order (subject to the above-mentioned exception
> regarding relative order). This approach allows for using this driver wit=
h
> various Exynos SoCs.
>
> Frequencies requested via the interconnect API for a given node are
> propagated to devfreq using dev_pm_qos_update_request(). Please note that
> it is not an error when CONFIG_INTERCONNECT is 'n', in which case all
> interconnect API functions are no-op.
>
> Signed-off-by: Artur =C5=9Awigo=C5=84 <a.swigon@samsung.com>
> ---
>  drivers/devfreq/exynos-bus.c | 144 +++++++++++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index 9fdb188915e8..694a9581dcdb 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -14,14 +14,19 @@
>  #include <linux/devfreq-event.h>
>  #include <linux/device.h>
>  #include <linux/export.h>
> +#include <linux/idr.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_qos.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>
>  #define DEFAULT_SATURATION_RATIO       40
>
> +#define kbps_to_khz(x) ((x) / 8)
> +
>  struct exynos_bus {
>         struct device *dev;
>
> @@ -35,6 +40,12 @@ struct exynos_bus {
>         struct opp_table *opp_table;
>         struct clk *clk;
>         unsigned int ratio;
> +
> +       /* One provider per bus, one node per provider */
> +       struct icc_provider provider;
> +       struct icc_node *node;
> +
> +       struct dev_pm_qos_request qos_req;
>  };
>
>  /*
> @@ -205,6 +216,39 @@ static void exynos_bus_passive_exit(struct device *d=
ev)
>         clk_disable_unprepare(bus->clk);
>  }
>
> +static int exynos_bus_icc_set(struct icc_node *src, struct icc_node *dst=
)
> +{
> +       struct exynos_bus *src_bus =3D src->data, *dst_bus =3D dst->data;
> +       s32 src_freq =3D kbps_to_khz(src->avg_bw);
> +       s32 dst_freq =3D kbps_to_khz(dst->avg_bw);
> +       int ret;
> +
> +       ret =3D dev_pm_qos_update_request(&src_bus->qos_req, src_freq);
> +       if (ret < 0) {
> +               dev_err(src_bus->dev, "failed to update PM QoS request");

To catch the correct error point, better to add 'src node' to error message
as following:

dev_err(src_bus->dev, "failed to update PM QoS of %s\n",
                                               dev_name(src_bus->dev.parent=
))

> +               return ret;
> +       }
> +
> +       ret =3D dev_pm_qos_update_request(&dst_bus->qos_req, dst_freq);
> +       if (ret < 0) {
> +               dev_err(dst_bus->dev, "failed to update PM QoS request");

ditto.

dev_err(src_bus->dev, "failed to update PM QoS of %s\n",
                                               dev_name(dst_bus->dev.parent=
))


> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct icc_node *exynos_bus_icc_xlate(struct of_phandle_args *spe=
c,
> +                                            void *data)
> +{
> +       struct exynos_bus *bus =3D data;
> +
> +       if (spec->np !=3D bus->dev->of_node)
> +               return ERR_PTR(-EINVAL);
> +
> +       return bus->node;
> +}
> +
>  static int exynos_bus_parent_parse_of(struct device_node *np,
>                                         struct exynos_bus *bus)
>  {
> @@ -419,6 +463,96 @@ static int exynos_bus_profile_init_passive(struct ex=
ynos_bus *bus,
>         return 0;
>  }
>
> +static struct icc_node *exynos_bus_icc_get_parent(struct exynos_bus *bus=
)
> +{
> +       struct device_node *np =3D bus->dev->of_node;
> +       struct of_phandle_args args;
> +       int num, ret;
> +
> +       num =3D of_count_phandle_with_args(np, "exynos,interconnect-paren=
t-node",
> +                                       "#interconnect-cells");
> +       if (num !=3D 1)
> +               return NULL; /* parent nodes are optional */

You better to add the comment before calling exynos_bus_icc_get_parent
and remove '/* parent nodes are optional */'. Actually, it is not enough
to understand the role of 'interconnect-parent-node' with '/* parent
nodes are optional */'.
And I add my opinion about this comment below.

And I expect that you will add the description and example for
'exynos,interconnect-parent-node' on exynos-bus dt-binding document.

> +
> +       ret =3D of_parse_phandle_with_args(np, "exynos,interconnect-paren=
t-node",
> +                                       "#interconnect-cells", 0, &args);
> +       if (ret < 0)
> +               return ERR_PTR(ret);
> +
> +       of_node_put(args.np);
> +
> +       return of_icc_get_from_provider(&args);
> +}
> +
> +static int exynos_bus_icc_init(struct exynos_bus *bus)
> +{
> +       static DEFINE_IDA(ida);
> +
> +       struct device *dev =3D bus->dev;
> +       struct icc_provider *provider =3D &bus->provider;
> +       struct icc_node *node, *parent_node;
> +       int id, ret;
> +
> +       /* Initialize the interconnect provider */
> +       provider->set =3D exynos_bus_icc_set;
> +       provider->aggregate =3D icc_std_aggregate;
> +       provider->xlate =3D exynos_bus_icc_xlate;
> +       provider->dev =3D dev;
> +       provider->inter_set =3D true;
> +       provider->data =3D bus;
> +
> +       ret =3D icc_provider_add(provider);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D id =3D ida_alloc(&ida, GFP_KERNEL);
> +       if (ret < 0)
> +               goto err_id;
> +
> +       node =3D icc_node_create(id);
> +       if (IS_ERR(node)) {
> +               ret =3D PTR_ERR(node);
> +               goto err_node;
> +       }
> +
> +       bus->node =3D node;
> +       node->name =3D dev->of_node->name;
> +       node->data =3D bus;
> +       icc_node_add(node, provider);
> +

Better to add the following comment. If you add following comment
before calling exynos_bus_icc_get_parent, don't need to add the
same comment into exynos_bus_icc.
    /* If interconnect parent node is not existing, don't use
interconnect feature */

> +       parent_node =3D exynos_bus_icc_get_parent(bus);
> +       if (IS_ERR(parent_node)) {
> +               ret =3D PTR_ERR(parent_node);
> +               goto err_parent;
> +       }
> +
> +       if (parent_node) {

Better to change this if statement as following:
else if (parent_node)


> +               ret =3D icc_link_create(node, parent_node->id);
> +               if (ret < 0)
> +                       goto err_parent;
> +       }
> +
> +       ret =3D dev_pm_qos_add_request(bus->devfreq->dev.parent, &bus->qo=
s_req,
> +                                       DEV_PM_QOS_MIN_FREQUENCY, 0);

Is it necessary if interconnect-parent-node is not existing?


> +       if (ret < 0)
> +               goto err_request;
> +
> +       return 0;
> +
> +err_request:
> +       if (parent_node)
> +               icc_link_destroy(node, parent_node);
> +err_parent:
> +       icc_node_del(node);
> +       icc_node_destroy(id);
> +err_node:
> +       ida_free(&ida, id);
> +err_id:
> +       icc_provider_del(provider);
> +
> +       return ret;
> +}
> +
>  static int exynos_bus_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -468,6 +602,16 @@ static int exynos_bus_probe(struct platform_device *=
pdev)
>         if (ret < 0)
>                 goto err;
>
> +       /*
> +        * Initialize interconnect provider. A return value of -ENOTSUPP =
means
> +        * that CONFIG_INTERCONNECT is disabled.
> +        */
> +       ret =3D exynos_bus_icc_init(bus);
> +       if (ret < 0 && ret !=3D -ENOTSUPP) {
> +               dev_err(dev, "failed to initialize the interconnect provi=
der");
> +               goto err;
> +       }
> +
>         max_state =3D bus->devfreq->profile->max_state;
>         min_freq =3D (bus->devfreq->profile->freq_table[0] / 1000);
>         max_freq =3D (bus->devfreq->profile->freq_table[max_state - 1] / =
1000);
> --
> 2.17.1
>


--=20
Best Regards,
Chanwoo Choi
