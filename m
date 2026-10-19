Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDED145D5F3
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 06:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393001; cv=none; b=bWhQqoN5F2kCIzxpr3mX/lDgQmy3euRxegdJt429sSXHppcGmPzf849/7z5ZgPtIPeppxu7EtdSroFPQG9kqPZ8tbH6E43H7N+JrMYoMXd364CGba1J2CO+vdILO2cG/FgBtH7yoIA/NOyH8yml31mieZqMFj+7/i8mhPtMAr7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393001; c=relaxed/simple;
	bh=IWJHYQT5csf1bfxQNDgJxGfQE4utAXU++e6Y38iDegs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0cuIyIhrvRZr5PJ1raoZJQAhHVE17MPrxrwteUAFPp0WAaEhPVLQZ/yz7DiSeezK37ZV+Cd/w1NqN5pBSiyJUZcLIVHb77ZgwBAMlx9bZhHYK7NNChCMFhAOXbH2gKWrqZvLR9aGPu50dH1rb1K2XaZQqUb4x7aiN6XAk1z5mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=yGJstnc1; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="yGJstnc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1792392967; x=1792997767;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=jFT100uFamP5A1+7t6kGUO077SA2VYn6gbrf7ueKwUk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=yGJstnc1k0ZhoTrkV2gaLPKZI9GfuPNuv1thwQOb6n3eV/5yQCAMQRs2YixYAB/H
	 K8RlMIDDhyesxcvltBAI1KV0VKUfjddiZf6js1QKnaSJW9wDYuKQJhgdJ35TWdeq3
	 SOJfe79yww3/hLUCbRBX2D81NiRl7EEIhd979nauWmllAKO6Xpz1LvMAq2IAF3t9F
	 7+5fP6DM4MOc5wy3mo9TM8Tv4/JYXxKfAqTdNDFlX4BrFnvf1Iq2I778bzLxP2Q24
	 bJFhlUf8qf7JUzT9LMrWLWStaSOk7L5zD4+OZiWCh9hmnU9YVZr4dZq4yq7deqsys
	 LNPUBmn/jH3/DRpuNQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mzydy-1wMrLN0CZi-0130v9; Mon, 19
 Oct 2026 08:56:07 +0200
Message-ID: <40a18909-4a96-4bfd-924a-c62658f26de9@oldschoolsolutions.biz>
Date: Mon, 19 Oct 2026 08:56:04 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Xuyang Dong <dongxuyang@eswincomputing.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cUfu78x5LyhcERPtQ6iwVQ5kI6C3XoSd1pBuP6ROLgNSa4/agon
 FvZ0YKQO6mfr/Sg7+0bu9OskZeYf2YuUxDfo6uq8TiQWFoLDehyThCJYfmz+gVN4Cse07aN
 28sr3qdO9jnKUq57QZ30FZG6Nex4llIVlER07gNrWsUKGLTDGzzzBTP8oAE4PFTQhn+eywg
 lVcgRDQMkot7htJGzZY+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EFr0aD97/Ck=;jun2MmI4rkIbhI6nbvf3PzLR8I0
 Yo+ziqX/AvLtdckRrttAFtQFlt5SU9zFB431KMZ/jbGNdfLOvpL0MV2y0BlMvyjwIXvqEWvgH
 W2Ct+f/Z2Ao1WkslqaLGlBYDrRxrEm0wr9JPOWFRm+S8l4zooWi/C81CQm6ZI+fLpXqrtmXqV
 k33Z5Th24eEg2lm/G7aU0XDm0hNFXTNiTucF0V6FSCsaHUCvRo2IrPEMGsxVBqXVm3RxXAV8l
 95uXQ1wzF4tTQb1bUXv2d0Fm1F+v8zxC8taFwMriJjBF/ELVFxWDCNPVzofvBGth4Y0b5pOSD
 O5uEhVp8YIg2w1ZJyNKM01ipSumQ/rv+/Z1iz8/A/2GgnrG/n7S+xI+TJeqCqoMR+tOb99EVg
 rEgM0CcsxdPpnnswa6xLiJ/9AY06kK/1c4l/bGEK3JegbMuvMrNW3ROnvJdVyivShDKVybbKA
 +ujxr1H9VL38C9htzk+3XK9RUEPOYqiZvBhehhg2OY9A8xwuYwuZhX8lUv8dNE7236fuupxiW
 65UYXcam/xz/EyFLpqJHf6QTyP+M2KPEJnZlLDBsWOeas+p+q2BRhbrFQRAnKsfV9y/FOWyAt
 K5p6b//t2ksOqwhQ/ogH9ySSL/glCWawqkSx50npwZ/Wg4VR3ACW8Vtw2zSrCx5+rFGxFC3Kt
 S9EHw7Woeqe3Z1OM5PvfdttkTz6rS9x493ef6yqsldAGvnDBG04guGcLWGydLthGTNjIYk3Be
 5B43hOJwz32y8XK4SRu1a9Q5S/ABIC0F9oHQ8j+TKpfVKilfwNcVPolZF2Sky3dC7hVl4SaE3
 mGmmJWqoEYRTmtkJ0B5WD0jNYqPyAXzC1Q3YfAAgLFKK0io6EGtdyXUI0awUWF+G/rVZb6yDN
 q34ijzM/RG3nv/JKttAxi6j+a3ag/+8Ddujqv5cHp5ffyzVKOrcXNIfVOAn1jhyJMZU4RB0PJ
 lBBq8K7/DHT/Lvtk3vQ/POtfeLcRmVTK45czRaHQg+fvcqV8wEZ0EaPcPBom1Nde6HodplDEd
 MuFCFF/ky5CeUeH6YJwKuGW6w49INd0/j6tTsuXNZtvnfx6kQfTBWrJr7zVIsXcdeW2cKOaIV
 t2ge/gQylrCZCY/iv7SJeoAvzuKgRcX4+DJFFjaU10ZSxtZjRyCnmJ/KJjM9zenIudcLuaxOq
 D8Fez00LKM5mpU77e3U2vDbYm8mO/IALkc9YYdcnrQGIC1C9Mc0EGxV+KY6Sf3iFsG0fVnYL1
 0+znt2wiH/S4ATQtrtmt55R2K2oDr1vXAxsupWreV37ZMRqEykBshB9fJaJ1VvjhjBQic5WEZ
 +XYywBYGUE7aDoc9SWkkvKSEm8pmlOlZicsMvZwDz1jw6aToe9yQXhwtFi+cnK+EqcxlVcV1c
 50MlTWua+b3lb8KCApE+KLq0u261XYCwM5h95lhzrmOne8DEAyWka4yT8ZITdOwpl/3+cPRWe
 uB/EJ0mRtyxFATYR03vHnVdGnPUaJXiVnDc6ZX/4OYVVhU5YLaF3ZjsvmEtl4Ky7T5VL/6V/k
 TuL8kASCQpuf/9Eb52nJw9VwCNFaCVgZ0jR5+PDJ/i4ap6W+VT0tcZrSt1Jbqzypk3gOfgw2R
 jThntvD63ErDMAiWT0LSqsuuQ2I5xYHsGNhP8pJf4hkRlQ+J/axxPxSoc2wdBi/mj1q96x6lH
 E5LUdvRqaOgstH1+Wgt+orMBTmIRoYxYp1vnPAO2zNRzxDU3xFkbyVgv7BeXYxPqlwoSmVQ6I
 j6XUztdYhURJ/PXmSw+R4y/5aYr2Jzu+M/mt9jCpmuM7S+LABWBF2qdTODSOAyPr4wzCeoB5C
 vaEWBQPHdsNlr7ZhdA0eVZj0XUyztmPAprwzrMH5yKsxTwSTutxrs/ykvhS6+ISeP7EGgxyF8
 IvizKcDmUtZfw+lgDsT71BAD5r4tVXzw25BZuPOX+eS6burYRosCfCkdgQCV9K+xnZv3rIVut
 TAD0iTBUFxQlnkFpj7loEsdItzyMdT4SgBVvrnF4PHatv5jIiFA5xjivYVooHazKrZy8xIsRG
 AW8B9eLYMPMCzeExrniz98Uzw+jQiwNxpRvcdZ3nBe3uYLZPnWjiWStV+sA6ovEqzl/9z5K9e
 3wyvrjz+5zHDkvVb5aPDe/sGovuIMfRL385feIZnWaGl9Y6/yzvhpMpDtaDnnLD3JoP2MWCXk
 vTkV7auG3X1z3JgyTUORjjbUrodsiIZ+kRZyRIUYPGAMvgZ2Cr1JBixQ30S3XfUt7Lv0FwC9x
 oo4/SMNem5XB5E2gZV6MqsPcKlOIevjUtogkk3PXbdtFWSElQcihjxof8iL9DWBH2mVxJZO0U
 2wcvQm2POTKPyUh2jdB9Kp8KGgCbySIcgpZ3T7EDFClwwdONMuJHg0SdbVjjAhCaeAYSGgwcB
 X1CtDKzWjrAOXpLT0PqG5r31Wdc2jmKBsr6k3VFCWZV4zR6Heh2yYQDVJi6h1dlABgp4a6Z6T
 tIR7A9P8h+VB2JRWaseyehB3lGwkyF/oa0d8ZZAGiwNJxc9Y1J1m5fNvT0qkjhJmt83EWFG9B
 ebQZ/f6vyWRDbA5UYx8B/QbZ/GyUupm//kyUXJ9ce/BJim5zgLboCvoB4v2JviCf+Q4c8Rpc5
 iWHconBBxk/2pKtXh1snVrQ7q0Gja8Rm3En+B5wh+i8I3OYRUU9uhPv4p2ELO6N1G0nU4WKSu
 bXgyDU2f1/wH11Ubn3cVuAKiSTFXKx3WrmUk2AnS2l7Dm516kpClKITpBYX60pcjBRbV1ZVr9
 C089oe3GidnEG4U

Hi there,

On 6/26/26 18:32, Brian Masney wrote:
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
>
> This series fixes this by adding support for sync_state to the clk
> subsystem.
>
> Changes in v3:
> - Allow multiple sync_state callbacks in the driver core via a new
>    helper dev_add_sync_state(). This allows dropping changes to the QC
>    drivers that already have a sync_state callback since everything can
>    coexist without changes. This also makes it so that this can coexist
>    with the pmdomain subsystem.
> - Only show "clk: Not disabling unused clocks" message once.
> - Add Tested-by from Neil and Xuyang
> - Link to v2: https://lore.kernel.org/linux-clk/20260616-clk-sync-state-=
v2-0-15f82c64d95c@redhat.com/
>
> Changes in v2:
> - Split out clk-cbf-8996.c into it's own patch, and don't call
>    qcom_cc_sync_state().
> - Clarify comment above call to dev_set_drv_sync_state() about
>    the -EBUSY.
> - Added Tested-by from Jens
> - Link to v1: https://lore.kernel.org/r/20260603-clk-sync-state-v1-0-457=
120eed200@redhat.com
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (4):
>        driver: core: introduce dev_add_sync_state()
>        pmdomain: core: migrate to dev_add_sync_state()
>        driver: core: remove dev_set_drv_sync_state()
>        clk: implement sync_state support
>
>   drivers/base/base.h     |  7 +++++
>   drivers/base/core.c     | 29 ++++++++++++++++++
>   drivers/clk/clk.c       | 78 ++++++++++++++++++++++++++++++++++++++++-=
=2D-------
>   drivers/pmdomain/core.c |  4 +--
>   include/linux/clk.h     | 14 +++++++++
>   include/linux/device.h  | 21 +++++++------
>   6 files changed, 127 insertions(+), 26 deletions(-)
> ---
> base-commit: 6c94b38b83a04c43ea49004275f0391404051093
> change-id: 20260626-clk-sync-state-ad008829a689
>
> Best regards,

Tested the whole series on several sc8280xp and x1 devices. Appears to=20
work well.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens

