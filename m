Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590550;
	b=Gc1/3WNdrKKwVW9Lg7zSK2LbGRDBfW4uq+EcfDujzwaC5IWjX0BrOkL1xlHPt06H0/gY
	 ZfWs2sh3HG7PcG3J4lQXHovAb39J8UaIVvmA1qNZQeWF/I6sz0/c9fvRB3vL7qBZJD+H0
	 wDSq1hYZjXVlSZVf61zjEfDu9bPOmW0zpBc8rWrN0Fnv2fLCVCe2zXfuMSjC+yXiUjN3F
	 7ycR/kX7GEzwV7ueaq5jDtkqrkBjJUgNHMRu6WDKf82L+EbWxuYSbHroUWKZadHegV1N3
	 vTr73RkF7FVQ0cRcuVV9v35+GxrrT07xZ70EOifM9OFlda2u37N8ewY9H2sipqCkaXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590550;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:User-Agent:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
	b=b5TOwdPP3IHbrawFG9t8fndjrAs//JLkrtsK8AGb0laEHwhrz7911D8XEvi9n8tCnSto
	 Gs2KcskBlKf7khyzMOQMu0W/sfo9w3S3vpS6jx24OSOcjtFSWmrH1OdUOXsGl1fWUaXZW
	 aC/ibv27RrZLNkUCEKhtYgMeQQ1SrPHOqACTeAILI+Cg+agsNteBtHDCYVcPFfvWeszbk
	 JVOTe0wA2AcG3ewJnDm0UaHrHj5tJrTZ3dxuL9byW2078+MCnr9+Y5VwhXYtaT3OllgTu
	 qP7asWO5LFz85XK418dgn98TeLqIGmetRNAgUD3aGOs9Qw40ymuECNC9plXjbwFm59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XrEKfe6f;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C64A6074B1E
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 17:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C64A6074B1E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XrEKfe6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794590549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
	b=XrEKfe6fCnKpa2jXihnYFm6pVPgxT8g1CK3Hzb7eHNGwrxU/McGfbWDAMXax8HnKFcHfBZ
	vNcXs8/bNyfL9NyP4VHcRbfMmVhokRjEwdklrD9ECz0SCsXHeEBESWDmUZXECXzk0MPXpx
	ZlgExFnGAlM8eZ82vo4kAfaiTPDCxuM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-HjVdr1PTMi6k3UjCKqIe_A-1; Fri, 13 Nov 2026 12:22:27 -0500
X-MC-Unique: HjVdr1PTMi6k3UjCKqIe_A-1
X-Mimecast-MFC-AGG-ID: HjVdr1PTMi6k3UjCKqIe_A_1794590547
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5351f1b26e6so17473471cf.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 09:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590547; x=1795195347;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
        b=dTv1TnX/acZFrlO+czim3SdK/T6TQVV4SG6cT0zVok25WYeH4ac6TnPBlwvvwwKJHw
         dqgA2l1YH3WI22N1E0q+TY9EHN/geZxYbALDhTqEdQKowpMoNsu+xg79pc6QO7HS52SK
         bIIGVdEFKv4XxK1+bzh7+9IqMMmfQGOrcDydaQwSmL9mzGfO3Ob9oq1TSHtWQVPfPs+Z
         KzK86wC4Sx9bhyCd/YfeYaN56Pme37hE5CaT7b/+ACT305Ae+RttB1a1lBxfi7KaK4mm
         71LtzrTOUgzXU/w+duCrenpFdxAlNPvxo3z4gSer+QO7QRqFvvVHaOP1reogOaZQUGXC
         ArwA==
X-Forwarded-Encrypted: i=1; AL+hErH4yDiXcl+TFsJPGjnOTi0CJnSr1Mt4ZJ8MWTDbXeflVcFVcaYlGZfHodKINdyrAj+VwV0yIJti+pDkBA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/a08xoQRqFFbAjkF87c2OVXwVWLev9Ua9rWVNLWaTF0UV2mPLW
	eLkBDQqdAJ6ggcSEfaJmMSgWBp+iDvNQE1xWc9V+qaheGNU8IjouEz+iZPWuhGLXWNiagMg2SXS
	9QiVhi3R4MvJsF4+XFI9J/rkG3CPve+Aje5nKyywXZqc9UMtIWXbAecBjoJwA7As1
X-Gm-Gg: AYBFou3W2+eDy1LLBojqjoEvx4N230f1F167ABXi4cVebDjViDiRUt9SfujfhcsE6ys
	sVF9hK9Sq56n5lReUMObxyCf3WJ9VuqNlaLCdaNZb31TllUvifonIa01krpMKtVNy+5dHQrJtvm
	fuuxs+FErMh1ebpFHQyAlQh3fGZaBQUqrE3rJmP3kH+6g61kel8uXC6VbwwrBHQ4OVikveacnPF
	k25qfBtWK3r3AkUTpo4SDsr7cY+lIRz+guQ+T85pioYK5B6IFb9X/1Z80vDYJPA/6Cqf/jANNNW
	eAOWHQ8DgElHjIL+eLJ28mqvMGLitvvqQcVECm+eMBdd2NqrRgPeIOa6z1M7b9qjiAEHB8riVPF
	9jzbXaDSPuWjcvsRyWgF7fms8mHu3L7UygX63feXHCq6xdvhdSz0XQDuPmkn6v0x1vJFrBXIegb
	h7J9J5TLRJermugBUwXAW9qJseDVA4MpL3FKz0IIRY
X-Received: by 2002:a05:622a:550e:b0:535:70b4:3f7c with SMTP id d75a77b69052e-55ac937d6e5mr45976371cf.66.1794590546849;
        Fri, 13 Nov 2026 09:22:26 -0800 (PST)
X-Received: by 2002:a05:622a:550e:b0:535:70b4:3f7c with SMTP id d75a77b69052e-55ac937d6e5mr45975821cf.66.1794590546274;
        Fri, 13 Nov 2026 09:22:26 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad14f1ecasm22347291cf.24.2026.11.13.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:22:24 -0800 (PST)
Date: Fri, 13 Nov 2026 12:22:22 -0500
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
Message-ID: <avdHTgDnTmQYy3CN@redhat.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
 <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
 <179458337623.3308909.8679910347462508471.b4-reply@b4>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <179458337623.3308909.8679910347462508471.b4-reply@b4>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SS1q8HDh8UzUjHNr9iX8IPctrVorPDM9pbgTPKL_jgY_1794590547
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2026 at 04:22:56PM +0100, Jerome Brunet wrote:
> On 2026-11-09 15:06 +0100, Konrad Dybcio wrote:
> > On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> > > On 10/23/26 12:35 PM, Jerome Brunet wrote:
> > >>> Preparing a clock protects its current requirements, not the resources
> > >>> needed while changing its rate or parent. A transition can temporarily
> > >>> use both parents or access an unprepared clock, and a parent rate change
> > >>> can cause other clocks to be programmed too. Raising resources one clock
> > >>> at a time leaves those operations exposed to insufficient power.
> > >>>
> > >>> Failures make this worse: hardware may already have changed when the
> > >>> operation returns an error. A matching cached rate is then not proof
> > >>> that resource reconciliation finished. Retaining a temporary enable
> > >>> reference without a corresponding prepare reference also breaks a
> > >>> consumer's normal disable/unprepare sequence after a failed reparent.
> > >>>
> > >>> Make CCF acquire the affected tree's and parent paths' resources before
> > >>> notifiers or programming, and reconcile them only when the walk stops.
> > >>> Keep fault recovery independent of rate shortcuts and subsequent
> > >>> consumer reference-count changes. Require explicit recovery of an
> > >>> ancestor's uncertain parent selection rather than reporting success
> > >>> from a descendant request.
> > >>
> > >> I don't think all this is necessary to address the problem described
> > >> here and in the cover letter.
> > >>
> > >> IMO a new provider API is the wrong layer. The framework already has
> > >> the hook a provider needs: the rate change notifiers. What the core
> > >> should do instead is fix those notifiers, which do have a few issues.
> > >> You are fixing one in patch 1. Another fix, about setting the parent,
> > >> was sent recently:
> > >>
> > >> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> > >>
> > >> You want to act on some changes before anything is programmed. PRE
> > >> notifiers are the right tool for this. The user of this change in
> > >> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> > >> it, ABORT drops it.
> > >>
> > >> Also, what is acquired here follows the requested clock. When an
> > >> ancestor switches parent, the chain of its new parent is not acquired,
> > >> although it feeds the whole subtree after the switch.
> > >>
> > >> With notifiers, the parent fault state is not needed either. As it is,
> > >> it blocks every request on or below the clock until the same switch is
> > >> retried.
> > >>
> > >> Could you tell me what you need from this approach that cannot be done
> > >> with (fixed) notifiers?
> > > 
> > > I'm a little worried about the ordering there, since some device
> > > drivers may also be registering listeners in parallel, so we don't
> > > get a clean split of what PRE means ("has power for sure " or "may
> > > not have power")
> > 
> > Do you have any thoughts on this? I'd like to proceed with this
> > series in one way or another.
> 
> As I have replied before, if there are things to fix in notifiers, we surely
> can discuss it but, at the moment, I don't think the complexity of what you
> are proposing here is justified.
> 
> Please allow some time for Brian to have a look.

I'm hoping to be able to look at this, plus some other requested changes
to the clk core, next week.

Brian

