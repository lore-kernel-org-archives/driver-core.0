Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD64C3D88F6
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776784881; cv=none; b=Kt0Sgbo7LObFLsfFEqmSAF4aP/zgMGAuv9dZouBjX2+oi+5OXV91sJ53Am1lRklVozqWDePDMZZcjH9jbuEZ1bkCRFpp0DekvLNSdqVTwVsIwnOK550wf/DZbTID1XsXj3VkxW5gcePm+x8TVhlJ2lmVryKWSv11G6YBVOVeECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776784881; c=relaxed/simple;
	bh=Kyk3+wNQNdoAB6SWDPZsFu2inFstrAooXQvG3g3opEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rsc1a3ciRNEV5v9sFXsLj1v7g+dRCluXv8o/nUXFijXvSgQ7AWwjL9qiMr45qQM+x4RoGxxZAcn3wVgrHNc4zEB/uy+sgkGphaxVA6Uz3BUDpUgIlSJ9vc786ddYzsY3pd/nA5cxWrqBrih4HDNF71pzL9TqrYojx120IYAaHtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=jsPUBLSv; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="jsPUBLSv"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7986e538decso42206787b3.1
        for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776784878; x=1777389678; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+B+8NSAggTlzgSEBNF7JVWtV7yl/tiBwRJ1+ICjPNI=;
        b=jsPUBLSv63sZKLO9WklaLZ6OVN4IYtgVqzcr63vaiWV6jiebTG/DWLTX1lJMLVzQwu
         Xyxm3FAtfPtyvWgTs/qHhr15kgxp++9jVn5oRrvRC84seHLg2dLqIaQsryN8BoqbM9Hu
         5WXPO0sMWP97pjL3LmjgBhebotKQ/qbvHBeEILhGzCZFtljayqFpsQ6KsTmLuoFsL6is
         Kf+kNgro7unwjvVGEdti0GYAVOtQwkF+WQwprW8WRmJWcILUmJlyf48NDQlOcLqf3DxD
         i16CTA+r7juSEryX7aeWQ1martLrrSAjQPXKptGthFee6PWVFqhXny890BLbFfi5+r1R
         02Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776784878; x=1777389678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+B+8NSAggTlzgSEBNF7JVWtV7yl/tiBwRJ1+ICjPNI=;
        b=WXrY0XA6Db34Vz8kk7nH7VxODk4D9fh2Pmhs6mF9zzB9GR9RfYH8iMfghnvzk7xCGi
         k9JLNKvlOjKbvR6Uxg2WX1T8i4u5GZq5GaNnCu2Uph5rL1eDkzolA+QYNqoRBqZkZ3MA
         IWLHcRmAm/RyKmEER8L+w+U0ZX5JT3LkPYoQI8C3tJNEm8Fliq8GJl+nsByrPdsU/hRv
         wlr+V6LNu+QeqiomDjR7Mu45r0qkY08JldRpBCzMAPna1BKhiL4xmO1FXJVw05o5VR7C
         iekNDlWhoH30xCn77fgqgizb2aKaY6jKkTzVc+OpX4G/sWP+X/e0o6KwATQpbpM/9K6/
         Zbvg==
X-Forwarded-Encrypted: i=1; AFNElJ8MlT0jNj1koG71a0udU43S1nd8yseIzXMgVrbQmiSAyJXVvLQpaK1ZQHNzrV3n9WLGsrBsvIEBQ9j3MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfIWPTiBxmQJnWQjNoyXUxXed8+pTE36KbojYzct41apXWOgcO
	PdxhBsYcc5fgjU5+DxrLoAFdPC6Z0KooyaGWTK0zRhvLPLA9tuhZwWDUbpezfeW6/UE=
X-Gm-Gg: AeBDietRjc7HR1VQIGQjvXU9uOsf2lLRGhvaTHgPJ9x5CGXiO09KtLcGmP1hOSIirf5
	cyunX7dmtBUvp0gcCNvMu3+IlQCncOLx7ayjPusAR/3DBaJTxD9aFTKvl3DqjSol0z0txZjARU8
	ol1gqOvYzrLwTvNQPC7DAzRcOEQkBluDNwQ8yo8gDA6mOLOmzoIFSw9X72aSbsaZ9JwMOax4QwT
	AjNv5q2yzC/uXYcJtvCVfnnP4WAGPutdCRmygWATY9fJfWwy31bEh1lqCRZb7oVYO05RMH714F6
	DFb/F+n4WDbTP5yHv35EaHfJu1SSY2typHb4t5GjSlrUSC9D+caP264djZ8je50LF0Z4Twe42tA
	sdRDHsiGI7S4Pqsff2f7rX6Z2n2+mMTOi6dFKoKCO3ebNicHNaTVBi1PXsdgM9xRUxD4WztrhVp
	S/WUvNEwDFSbKzfj6xl94nxTYmu/K1ElFfJD1Ki1w8dpEfNORsNrLxx+0mWM1hvuipmmyt5NNVJ
	+hheK2VuygfLV12u9USN++WHX9mu+sH0mnlpT3M
X-Received: by 2002:a05:690c:f14:b0:7ba:f677:8c32 with SMTP id 00721157ae682-7baf67794c3mr66413557b3.15.1776784877840;
        Tue, 21 Apr 2026 08:21:17 -0700 (PDT)
Received: from google.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee9b293fsm56526037b3.40.2026.04.21.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:21:17 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:21:15 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Jeffery <djeffery@redhat.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?utf-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, John Garry <john.g.garry@oracle.com>
Subject: Re: [PATCH 5/5] scsi: Enable async shutdown support
Message-ID: <aeeV1e4j4ok9_iQz@google.com>
References: <20260420152608.6244-1-djeffery@redhat.com>
 <20260420152608.6244-6-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420152608.6244-6-djeffery@redhat.com>

On 04-20 11:26, David Jeffery wrote:
> Like scsi's async suspend support, allow scsi devices to be shut down
> asynchronously to reduce system shutdown time.
> 
> Signed-off-by: David Jeffery <djeffery@redhat.com>
> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> Tested-by: Laurence Oberman <loberman@redhat.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 
