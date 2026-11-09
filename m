Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192232;
	b=QsusBKFGKuOnRao34FfY39Gi+srBLKqc8aKEbWRIydNpP/Wy1UkeBfE4w5OBlD/Q27I1
	 nbJPo8kw1Sg6Vq6B/GxeCIWIEfaGldqUhw7eFPWWId2Yv4xrThh7y7tfhkoeZWrEqIIrB
	 rraluDT8ZBu+hTF4z61owRlTeWl+CXnkz0s6UIH5/SW+riqVxkLvVdnUpQeNFLVekSFqL
	 RuVgripEMHjTEYIyZoEYG8z4vuyDXEu+W2SDQ4D3p+Gje+x+QpFAIyO0xfOF6NIZr9ow4
	 dC1mCBT5HYtxhjm/inAb8VofOnMDRXfT6bg4r1jZyd5B6lZbXswdZd4gqvhMyHu+G3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192232;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yq6Wg8dZm4uB3bJQCmf1miWvm1ABWBJ7TTfz/AA487Q=;
	b=Dmch2gL2tQaLNMRTH+GPFxfrQyOA6ooNwZLMR6vQmeTDakTTl+ezDC9GoxHs7zml/crr
	 P1b3Ww+mu4lcTEGgvyKeYIvy3cJ10YpOvOmFu2dUwIxbzcsEujvLoU7SVRt0F0NYU3ZdD
	 4G8pDdta4VLqGRqr8+sZTb0lSMk+BQwCZgnUnQT4/Sv/byMFq202eXMDOxn99xMXyv6I4
	 W3H/8NJt9itYByN97MCrrVfd4vExsVW2QZIdb0RdkS7402NZOa4NVQk5ufVGKudos1Mn9
	 gs15ZotP1WRT+hkoJJrhYfFtlq/saWTOm3OtSwpnWAwwDzC8ulLMWq3mkHzMFuyT01A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n1/628eM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44500606A320
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 02:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1/628eM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88771F008A4
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 02:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794192231;
	bh=Yq6Wg8dZm4uB3bJQCmf1miWvm1ABWBJ7TTfz/AA487Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n1/628eMuF0qPAkqesisYQ6yKWJ7AmwnuO4vlBh18h6Mj36/7w+FGaj+I60SWAPhH
	 D0OAPqOPz7kbkmrxpEYoORTdfBel351gZLiQfi4B+tzWMqcHNafX/L5Zft/yGhttMj
	 hvy96X4MxRcGm8b9ek2TMXliumh9cbCxqBzsD1ic0KGJbQJ6GPBUTjERr4M4TcnPsD
	 eNbcW8kuACQkLpReDZ8FF4IhhBR9QChQfZq5cRyy8XMZzuks9w2tPEqYdiIBFYr2uL
	 bPV32hAroVDL3cyKi2ybGo26vdrvfs5T3ZpfwA9favWSGpR+lypSfipGx+pSu9Z6Mu
	 SuD1iF8Duahyg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so547686a12.3
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 18:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFZ0hVo2rO5CsSCoU2vkQ9VdCup5w5cPV8SwEhR9ru9C9LLgV32j29BX6wajA7ic3K5rEMdSEOPItKJYQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/4nK2PbsDnintm9IWKpQTrSCH5V3O+0e2em0TBah2n/Wh6GrHf
	VKHE1A8IossoC2hRxkW4kHdWUgyKmAIxqFHL7fszt8ygegRAYSL9IFJPhD29i99uHfb6FQHpIqx
	fw3BxYcrOgmXyoPK2YVNFj8l4tKCbAPM=
X-Received: by 2002:a05:6402:4487:b0:6b5:7de8:87cd with SMTP id
 4fb4d7f45d1cf-6b72249a189mr1729932a12.42.1794192230805; Sun, 08 Nov 2026
 18:43:50 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com> <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
In-Reply-To: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
From: Saravana Kannan <saravanak@kernel.org>
Date: Sun, 8 Nov 2026 18:43:39 -0800
X-Gmail-Original-Message-ID: <CACRMN=d8OnSHZ=4DOmfWafwYL+8ZTGggrxdWV2-iTptEJmd19A@mail.gmail.com>
X-Gm-Features: AclHuK83znKgPlPm3mYNg-jihIjo0y5-ZXz-onGQXWzrK1htisLXcdgRQNPmioU
Message-ID: <CACRMN=d8OnSHZ=4DOmfWafwYL+8ZTGggrxdWV2-iTptEJmd19A@mail.gmail.com>
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 6:08=E2=80=AFPM Songwei.Chai
<songwei.chai@oss.qualcomm.com> wrote:
>
>
> On 11/6/2026 4:50 PM, Johan Hovold wrote:
> > [ +CC: Saravana ]
> >
> > On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
> >> fw_devlink detects and relaxes dependency cycles automatically, so thi=
s
> >> is not an error condition requiring user action. On complex DT
> >> topologies (e.g. CoreSight), this message can fire for many node
> >> pairs and adds noise to the boot log, even though it's primarily
> >> useful for debugging. Switch pr_info() to pr_debug() so it stays
> >> available via dynamic debug when actually needed, without cluttering
> >> default boot logs.
> >>
> >> For example, on sm8750 this produces 125 such lines in the boot log in
> >> total, 80 of which are CoreSight-related, e.g.:
> >>
> >> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with =
/soc@0/stm@10002000
> >> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /so=
c@0/funnel@10041000
> >> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with =
/soc@0/tpda@10004000
> >> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /s=
oc@0/funnel@10041000
> >> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /s=
oc@0/tpda@10004000
> >> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /s=
oc@0/tpdm@1000f000
> > I reported this elsewhere a while back:
> >
> >       https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com=
/
> >
> > Are you sure it's not the coresight bindings that should be fixed?
>
> No, Johan, I don't think this is a Coresight bindings issue.
>
> This is the mechanical result of the standard bidirectional graph
> binding + fw_devlink's direction-agnostic phandle scan =E2=80=94 it will =
appear
> on any SoC/CoreSight topology using the standard binding, and there's no
> alternative binding syntax that avoids it.

You can add the post-init-providers property so Linux/OSes can know
which dependency is not a probe time or initialization time
dependency.

A lot of cycles can be broken by adding just a few of these. It'll
make sure the coresight stuff gets probed in the right order, and more
importantly also does suspend/resume, etc in the right order too.

-Saravana
